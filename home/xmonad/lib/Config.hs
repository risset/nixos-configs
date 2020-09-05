module Config where

import XMonad
import Graphics.X11.Types 
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
import Text.Printf

black :: String
black = "#272822"

white :: String
white = "#bbbbbb"

red :: String
red = "#f92672"

green :: String
green = "#a6e22e"

yellow :: String
yellow = "#f4bf75"

blue :: String
blue = "#66d9ef"

magenta :: String
magenta = "#ae81ff"

cyan :: String
cyan = "#a1efe4"

gray :: String
gray = "#75715e"

myFont :: String  
myFont = "xft:Source Code Pro:pixelsize=12:antialias=true"

modMask :: Graphics.X11.Types.KeyMask
modMask = mod4Mask  

term :: String
term = "urxvtc"

emacs :: String -> String
emacs path = "emacsclient -c -n " ++ path

browser :: String
browser = "firefox"

promptTheme :: XPConfig
promptTheme = def { searchPredicate = fuzzyMatch
                  , alwaysHighlight = True
                  , sorter = fuzzySort
                  , autoComplete = Just 100000
                  , borderColor = white
                  , bgHLight = black
                  , fgHLight = red
                  , bgColor = black
                  , fgColor = white
                  , font = myFont
                  , position = CenteredAt 0.40 0.5
                  , promptBorderWidth = 1
                  , height = 48
               }
