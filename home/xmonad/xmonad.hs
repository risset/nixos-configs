-- My XMonad configuration

import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicBars
import XMonad.Actions.DynamicProjects
import XMonad.Util.EZConfig

import qualified Bar as B
import qualified Config as C  
import qualified Keys as K
import qualified Layouts as L
import qualified Manage as M
import qualified Startup as S
import qualified Workspaces as W

main :: IO()
main = xmonad $ docks $ dynamicProjects W.projects def
        { startupHook        = S.startupHook
        , modMask            = C.modMask
        , logHook            = B.logHook
        , layoutHook         = L.layoutHook
        , workspaces         = W.spaces
        , clickJustFocuses   = False
        , focusFollowsMouse  = False
        , normalBorderColor  = C.black
        , focusedBorderColor = C.white
        , manageHook         = M.manageHook
        , handleEventHook    = fullscreenEventHook
                           <+> dynStatusBarEventHook B.barCreator B.barDestroyer
                           <+> handleEventHook def
        } `additionalKeysP` K.keys
