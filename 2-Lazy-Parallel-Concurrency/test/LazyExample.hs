module Main where

import Exercises.LazyParCon.LazyExamples
import System.IO

main :: IO ()
main = do
  putStrLn "First 5 ones:" 
  print $ take 5 ones
  putStrLn "First 10 fibs:" 
  print $ take 10 fibs
