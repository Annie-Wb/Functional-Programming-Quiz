module ParallelExample where

import ParallelExamples

main :: IO ()
main = do
  putStrLn "parallelPairSum [1..1000000] [1..1000000] (demo)"
  print $ parallelPairSum [1..1000000] [1..1000000]
