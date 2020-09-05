module Bar where

import qualified Config as C

import XMonad.Hooks.DynamicLog            
import XMonad.Hooks.DynamicBars
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad
import Text.Printf
import GHC.IO.Handle
import XMonad.Config.Prime

logPP :: PP
logPP = namedScratchpadFilterOutWorkspacePP def
  { ppCurrent = xmobarColor C.red "" . pad
  , ppVisible = xmobarColor C.white "" . pad
  , ppHiddenNoWindows = xmobarColor C.gray "" . pad
  , ppHidden  = wrap " " " "
  , ppSep     = pad $ xmobarColor C.gray "" " "
  , ppTitle   = (\str -> "")
  , ppLayout  = (\str -> "")
  }

logPPActive :: PP
logPPActive = logPP
  { ppCurrent = xmobarColor C.red "" . pad
  }

logHook :: X ()
logHook = multiPP logPPActive logPP

barCreator :: ScreenId -> IO Handle
barCreator s = spawnPipe $ bar
  where
    bar
      | s == 0 = conf "0"
      | s == 1 = conf "1"
      | otherwise = conf "1"
    conf x = printf "xmobar ~/.xmobar/s%s.hs -x %s" x x

barDestroyer :: IO()
barDestroyer = return ()
