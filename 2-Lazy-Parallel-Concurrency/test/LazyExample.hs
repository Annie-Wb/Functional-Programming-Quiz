module LazyExample where

import LazyExamples

main :: IO ()
main = do
  putStrLn "First 5 ones:" 
  print $ take 5 ones
  putStrLn "First 10 fibs:" 
  print $ take 10 fibs
