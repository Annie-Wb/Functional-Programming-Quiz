module Main where

import Exercises.FAM.ParserExamples

main :: IO ()
main = do
  putStrLn "Parsing '123' with many1 digit parser (demo)"
  print $ runParser (many1 (sat isDigit)) "123abc"
  putStrLn "Parsing 'abc' with string \"ab\" (demo)"
  print $ runParser (string "ab") "abc"
