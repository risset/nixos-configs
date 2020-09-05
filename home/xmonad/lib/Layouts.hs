module Layouts where

import qualified Config as C

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.PerWorkspace
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiColumns

layoutHook = onWorkspace "music" mirrorTall
           $ onWorkspace "video" full
           $ onWorkspace "game" full
           $ tall
  where
    full = noBorders Full

    tall = avoidStruts
         $ smartBorders
         $ ResizableTall 1 (1/100) (50/100) []

    mirrorTall = avoidStruts
               $ smartBorders
               $ Mirror
               $ ResizableTall 1 (1/100) (70/100) []
