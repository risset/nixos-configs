module Util where

import XMonad

screenshot :: MonadIO m => String -> m ()
screenshot flags = spawn cmd
  where cmd = "maim " ++ flags ++ " | tee " ++ dest ++ toClipboard
        dest = "/storage/images/screenshots/$(date +%s).png"
        toClipboard = " | xclip -selection clipboard -t image/png"
