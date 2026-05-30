module ConcurrencyExamples where

import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

-- spawn two threads that print alternating messages (example)
twoThreads :: IO ()
twoThreads = error "implement"

-- STM (tip: use atomically)
newCounter :: IO (TVar Int)
newCounter = error "implement"

incCounter :: TVar Int -> IO ()
incCounter tv = error "implement"
