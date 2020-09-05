module Startup where

import qualified Bar as B

import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicBars
import XMonad.Util.Run

startupHook = do
    setWMName "XMonad"
    dynStatusBarStartup B.barCreator B.barDestroyer
    -- spawn "xrandr --output DP-2 --mode 1920x1080 --rate 144 --output DVI-D-0 --right-of DP-2"
    spawn "~/.fehbg" -- Reload wallpapers
