module Workspaces where

import qualified Config as C

import XMonad
import XMonad.Actions.DynamicProjects

-- Projects that are always present at the start of an X session
spaces :: [[Char]]
spaces = ["nix", "music", "chat", "web"]

-- Full list of projects, each are defined below
projects :: [Project]
projects =
    [ nix
    , music
    , chat
    , web
    , org
    , japanese
    , video
    , game
    , steam
    , manga
    , irc
    , seedbox
    , code
    , study
    , compose
    ]

-- System administration, package management, etc.
nix :: Project
nix = Project { projectName      = "nix"
                , projectDirectory = "~/nix"
                , projectStartHook = Just $ do spawn $ C.emacs "."
                }

-- Music player and visualisation
music :: Project
music = Project { projectName      = "music"
                , projectDirectory = "/storage/music"
                , projectStartHook = Just $ do spawn $ C.term ++ " -e ncmpcpp"
                                               spawn $ C.term ++ " -e cava"
                }

-- Discord chat
chat :: Project
chat = Project { projectName      = "chat"
               , projectDirectory = "~"
               , projectStartHook = Just $ do spawn "Discord"
               }

-- Web browser
web :: Project
web = Project { projectName      = "web"
              , projectDirectory = "~/dl/http"
              , projectStartHook = Just $ do spawn "firefox"
              }

-- Org mode
org :: Project
org = Project { projectName      = "org"
              , projectDirectory = "~/org"
              , projectStartHook = Just $ do spawn $ C.emacs "."
              }

-- Studying Japanese
japanese :: Project
japanese =  Project { projectName = "japanese"
                    , projectDirectory = "~/org/study"
                    , projectStartHook = Just $ do spawn "anki"
                                                   spawn $ C.emacs "japanese.org"
                    }

-- Video player
video :: Project
video = Project { projectName      = "video"
                , projectDirectory = "/mnt/data/video"
                , projectStartHook = Nothing
                }

-- Video games
game :: Project
game = Project { projectName      = "game"
               , projectDirectory = "~"
               , projectStartHook = Nothing
               }

-- Steam
steam :: Project
steam = Project { projectName      = "steam"
                , projectDirectory = "~"
                , projectStartHook = Just $ do spawn "steam"
                }

-- Manga reading
manga :: Project
manga = Project { projectName      = "manga"
                , projectDirectory = "/mnt/data/manga"
                , projectStartHook = Just $ do spawn "zathura"
                }

-- IRC client
irc :: Project
irc = Project { projectName      = "irc"
              , projectDirectory = "~"
              , projectStartHook = Just $ do spawn C.term
              }


-- sclang music composition
compose :: Project
compose = Project { projectName      = "compose"
                 , projectDirectory = "~/snd/sc"
                 , projectStartHook = Just $ do spawn $ C.emacs "setup.sc"
                                                spawn $ C.emacs "main.sc"
                                                spawn $ C.emacs "patterns.sc"
                 }

-- programming projects
code :: Project
code = Project { projectName = "code"
                , projectDirectory = "~/projects"
                , projectStartHook = Just $ do spawn $ C.emacs "."
                }


--  studying things
study :: Project
study = Project { projectName = "study"
                  , projectDirectory = "~/org"
                  , projectStartHook = Just $ do spawn $ C.emacs "."
                                                 spawn "zathura"
                  }

-- seedbox
seedbox :: Project
seedbox = Project { projectName = "seedbox"
                , projectDirectory = "~/dl/http/torrent"
                , projectStartHook = Just $ do spawn $ C.term
                }
