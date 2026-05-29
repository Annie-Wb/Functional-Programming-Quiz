module Exercises.LazyParCon.ConcurrencyExamples where

import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

-- spawn two threads that print alternating messages (example)
twoThreads :: IO ()
twoThreads = do
  m <- newEmptyMVar
  _ <- forkIO $ producer m
  _ <- forkIO $ consumer m
  threadDelay 1000000
  where
    producer mv = do
      putStrLn "producer: putting 42"
      putMVar mv (42 :: Int)
    consumer mv = do
      v <- takeMVar mv
      putStrLn $ "consumer: got " ++ show (v :: Int)

-- STM counter example
newCounter :: IO (TVar Int)
newCounter = atomically $ newTVar 0

incCounter :: TVar Int -> IO ()
incCounter tv = atomically $ modifyTVar' tv (+1)
