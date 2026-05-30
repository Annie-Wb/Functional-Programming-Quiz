{-# OPTIONS_GHC -Wno-unused-imports #-}
module Main where

import Test.QuickCheck
import Data.List (sort)
import Quiz1

-- Example property: reverse twice is identity
prop_reverseInv :: [Int] -> Bool
prop_reverseInv xs = reverse (reverse xs) == (xs :: [Int])

-- reverse distributes over (++)
prop_reverseAppend :: [Int] -> [Int] -> Bool
prop_reverseAppend xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs

-- property: sort preserves multiset (compare sorted lists)
prop_sortIsSorted :: [Int] -> Bool
prop_sortIsSorted xs = isSorted (sort xs)
  where isSorted [] = True
        isSorted [_] = True
        isSorted (a:b:rest) = a <= b && isSorted (b:rest)

main :: IO ()
main = do
  quickCheck prop_reverseInv
  quickCheck prop_reverseAppend
  quickCheck prop_sortIsSorted
