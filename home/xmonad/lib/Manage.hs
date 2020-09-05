module Manage where

import qualified Config as C

import XMonad
import Data.Monoid
import Control.Monad
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Util.Scratchpad
import qualified XMonad.StackSet as W   
  
manageHook :: Query (Endo WindowSet)
manageHook = compose
         <+> scratchpad
  where 
    compose = composeAll [ className =? "mpv"  --> viewShift "video"
                         , className =? "Steam"  --> viewShift "steam"
                         , className =? "steam_app"  --> viewShift "game"
                         , className =? "mpv"  --> doFloat
                         , className =? "feh"  --> doCenterFloat
                         , roleName =? "GtkFileChooserDialog"  --> doCenterFloat
                         , roleName =? "pop-up" --> doCenterFloat
                         , isBrowserDialog --> doCenterFloat
                         ]
    roleName = stringProperty "WM_WINDOW_ROLE" 
    isBrowserDialog = isDialog <&&> className =? C.browser
    viewShift = doF . liftM2 (.) W.greedyView W.shift


scratchpad :: ManageHook
scratchpad = scratchpadManageHook (W.RationalRect l t w h)
  where
    h = 0.90
    w = 0.90
    t = 0.04
    l = 0.05
