module ParallelExample where

import Test.QuickCheck
import ParallelExamples
import System.Exit (exitFailure)

prop_parallelPairSum :: [Int] -> [Int] -> Bool
prop_parallelPairSum xs ys = parallelPairSum xs ys == sum xs + sum ys

prop_parallelSum :: [Int] -> Bool
prop_parallelSum xs = parallelSum xs == sum xs

main :: IO ()
main = do
  r1 <- quickCheckResult prop_parallelPairSum
  case r1 of { Success {} -> return (); _ -> exitFailure }
  r2 <- quickCheckResult prop_parallelSum
  case r2 of { Success {} -> return (); _ -> exitFailure }
