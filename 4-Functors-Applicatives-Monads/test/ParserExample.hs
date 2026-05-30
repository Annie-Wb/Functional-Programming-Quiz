module ParserExample where

import ParserExamples
import Data.Char
import Test.QuickCheck
import System.Exit (exitFailure)

prop_many1_digits :: Bool
prop_many1_digits = not $ null (runParser (many1 (sat isDigit)) "123abc")

prop_string_ab :: Bool
prop_string_ab = not $ null (runParser (string "ab") "abc")

main :: IO ()
main = do
  r1 <- quickCheckResult prop_many1_digits
  case r1 of { Success {} -> return (); _ -> exitFailure }
  r2 <- quickCheckResult prop_string_ab
  case r2 of { Success {} -> return (); _ -> exitFailure }
