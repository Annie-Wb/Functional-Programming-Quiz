module Concurrency where

import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

-- spawn two threads that print alternating messages (example)
twoThreads :: IO ()
twoThreads = error "implement twoThreads"

-- STM (tip: use atomically)
newCounter :: IO (TVar Int)
newCounter = error "implement newCounter"

incCounter :: TVar Int -> IO ()
incCounter tv = error "implement incCounter"
