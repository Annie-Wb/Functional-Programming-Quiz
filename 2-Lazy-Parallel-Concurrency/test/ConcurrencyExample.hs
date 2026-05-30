module ConcurrencyExample where

import Control.Exception (catch, SomeException)
import System.Exit (exitFailure)
import Control.Concurrent.STM
import Test.QuickCheck
import ConcurrencyExamples

failOnException :: String -> IO a -> IO a
failOnException label action = catch action handler
  where
    handler :: SomeException -> IO a
    handler e = error $ "FAILED (exception) " ++ label ++ " -> " ++ show e

prop_twoThreads_runs :: IO Bool
prop_twoThreads_runs = do
  _ <- failOnException "twoThreads" twoThreads
  return True

prop_counter :: IO Bool
prop_counter = do
  tv <- failOnException "newCounter" newCounter
  _ <- failOnException "incCounter" (incCounter tv)
  v <- atomically $ readTVar tv
  return (v >= 0)

main :: IO ()
main = do
  r1 <- prop_twoThreads_runs
  if not r1 then exitFailure else putStrLn "twoThreads OK"
  r2 <- prop_counter
  if not r2 then exitFailure else putStrLn "counter OK"
