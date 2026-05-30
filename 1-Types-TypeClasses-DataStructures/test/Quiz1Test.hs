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

prop_len :: [Int] -> Bool
prop_len xs = len xs == length xs

prop_safeHeadEmpty :: Bool
prop_safeHeadEmpty = safeHead ([] :: [Int]) == Nothing

prop_safeHeadCons :: Int -> [Int] -> Bool
prop_safeHeadCons x xs = safeHead (x : xs) == Just x

prop_sumList :: [Int] -> Bool
prop_sumList xs = sumList xs == sum xs

prop_rev :: [Int] -> Bool
prop_rev xs = rev xs == reverse xs

prop_pairMapId :: Int -> Int -> Bool
prop_pairMapId x y = pairMap id (x, y) == (x, y)

prop_pairMapAdd1 :: Int -> Int -> Bool
prop_pairMapAdd1 x y = pairMap (+ 1) (x, y) == (x + 1, y + 1)

prop_treeSize :: Bool
prop_treeSize = treeSize sampleTree == 3

prop_treeHeight :: Bool
prop_treeHeight = treeHeight sampleTree == 2

prop_treeToList :: Bool
prop_treeToList = treeToList sampleTree == [2, 1, 3]

prop_lookupALFound :: Bool
prop_lookupALFound = lookupAL 'b' [('a', 1), ('b', 2), ('c', 3)] == Just 2

prop_lookupALMissing :: Bool
prop_lookupALMissing = lookupAL 'z' [('a', 1), ('b', 2), ('c', 3)] == Nothing

sampleTree :: Tree Int
sampleTree = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)

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
  quickCheck prop_len
  quickCheck prop_safeHeadEmpty
  quickCheck prop_safeHeadCons
  quickCheck prop_sumList
  quickCheck prop_rev
  quickCheck prop_pairMapId
  quickCheck prop_pairMapAdd1
  quickCheck prop_treeSize
  quickCheck prop_treeHeight
  quickCheck prop_treeToList
  quickCheck prop_lookupALFound
  quickCheck prop_lookupALMissing
  quickCheck prop_sortIsSorted
