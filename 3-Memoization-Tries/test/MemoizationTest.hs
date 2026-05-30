module Main where

import Test.QuickCheck
import Memoization

-- QuickCheck property for listCache/listLookup
prop_listCacheLookup :: [Int] -> Fun Int Int -> Bool
prop_listCacheLookup domain (Fun _ f) = all check domain
  where cache = listCache domain f
        check x = listLookup cache x == f x

-- Correctness small test for fastFibo
prop_fastFiboCorrect :: Int -> Property
prop_fastFiboCorrect n = (n >= 0 && n <= 20) ==> fastFibo n == fibo n

main :: IO ()
main = do
  quickCheck prop_listCacheLookup
  quickCheck prop_fastFiboCorrect
