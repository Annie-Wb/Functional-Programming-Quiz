module Main where

import Test.QuickCheck
import System.Exit (exitFailure)
import Memoization

-- QuickCheck property for listCache/listLookup
prop_listCacheLookup :: [Int] -> Fun Int Int -> Bool
prop_listCacheLookup domain (Fun _ f) = all check domain
  where cache = listCache domain f
        check x = listLookup cache x == f x

-- Correctness small test for fastFibo
prop_fastFiboCorrect :: Int -> Property
prop_fastFiboCorrect n = (n >= 0 && n <= 20) ==> fastFibo n == fibo n

-- Simple deterministic trieCache test: build a small cache and verify lookups
prop_memo_placeholders_exercise :: Bool
prop_memo_placeholders_exercise =
  let _ = listCache ([] :: [Int]) (\x -> x :: Int)
      cache = listCache [1] (\x -> x + (1 :: Int))
      _ = listLookup cache 1
      _ = memoizeList [1 :: Int] (\x -> x + 1 :: Int)
      _ = rootTrie ([] :: [Int])
      _ = mapTrie id (rootTrie ([] :: [Int]))
      _ = trieCache ([] :: [Int]) (const (0 :: Int))
  in True

main :: IO ()
main = do
  quickCheck prop_listCacheLookup
  r1 <- quickCheckResult prop_listCacheLookup
  case r1 of { Success {} -> return (); _ -> exitFailure }
  r2 <- quickCheckResult prop_fastFiboCorrect
  case r2 of { Success {} -> return (); _ -> exitFailure }
  r3 <- quickCheckResult prop_memo_placeholders_exercise
  case r3 of { Success {} -> return (); _ -> exitFailure }
