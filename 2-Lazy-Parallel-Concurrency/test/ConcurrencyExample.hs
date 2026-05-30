module ConcurrencyExample where

import Control.Concurrent.STM

import ConcurrencyExamples

main :: IO ()
main = do
  putStrLn "Running twoThreads demo:" 
  twoThreads
  putStrLn "Creating and incrementing STM counter..."
  tv <- newCounter
  incCounter tv
  v <- atomically $ readTVar tv
  putStrLn $ "Counter value: " ++ show v
