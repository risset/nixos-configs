module Keys where

import qualified Config as C

import XMonad 
import qualified XMonad.StackSet as W   
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicProjects
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.GridSelect
import XMonad.Actions.WithAll
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Prompt.Pass
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.DirExec
import XMonad.Util.Run
import XMonad.Util.Scratchpad
import XMonad.Util.WorkspaceCompare

keys :: [([Char], X())]
keys = 
    -- Prompts
    [ ("M-r", spawn "rofi -show run")
    , ("M-p", spawn "rofi-pass")
    , ("M-o", spawn "rofi-open")
    , ("M-d", spawn "rofi-systemd")
    , ("M-m", spawn "rofi-mpd")
    , ("M-w", goToSelected def)
    , ("M-g", switchProjectPrompt C.promptTheme)

   -- Programs 
    , ("M-<Return>", spawn C.term)
    , ("M-S-<Return>", spawn "emacsclient -c -n -e '(switch-to-buffer nil)'")
    , ("M-<Space>", scratchpadSpawnActionTerminal C.term)

    -- -- Media
    , ("M--", spawn "maim-clip")
    , ("M-S--", spawn "maim-clip -s")
    , ("M-C--", spawn "maim-clip -w")
    , ("M-=", spawn "mpc toggle")
    , ("M-`", spawn "switch-input-method")

    -- -- Window management
    , ("M-x", kill)

    -- -- Workspaces & Screens
    , ("M-a", toggleWSNoNSP)
    , ("M-s", nextScreen)
    , ("M-l", changeWS Next)
    , ("M-h", changeWS Prev)
    , ("M-C-s", swapNextScreen)
    , ("M-S-<Backspace>", deleteWorkspace)
    ]
  where
    -- Switch to last workspace, ignoring scratchpad
     toggleWSNoNSP = toggleWS' ["NSP"]

     -- Change workspace left or right, ignoring scratchpad
     getSortByIndexNoNSP = fmap (.scratchpadFilterOutWorkspace) getSortByIndex
     changeWS dir = windows . W.greedyView =<<
       findWorkspace getSortByIndexNoNSP dir HiddenNonEmptyWS 1

     -- Delete workspace and kill all windows on it
     deleteWorkspace = sequence_ [killAll, removeWorkspace]

