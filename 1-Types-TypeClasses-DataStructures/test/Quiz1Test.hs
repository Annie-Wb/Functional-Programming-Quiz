{-# OPTIONS_GHC -Wno-unused-imports #-}
module Main where

import Test.QuickCheck
import System.Exit (exitFailure)
import Data.List (sort)
import Quiz1

-- (removed trivial reverse properties)

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

prop_len_io :: IO Bool
prop_len_io = do
  r <- quickCheckResult prop_len
  return (isSuccess r)

prop_safeHeadEmpty_io :: IO Bool
prop_safeHeadEmpty_io = do
  r <- quickCheckResult prop_safeHeadEmpty
  return (isSuccess r)

prop_safeHeadCons_io :: IO Bool
prop_safeHeadCons_io = do
  r <- quickCheckResult prop_safeHeadCons
  return (isSuccess r)

prop_sumList_io :: IO Bool
prop_sumList_io = do
  r <- quickCheckResult prop_sumList
  return (isSuccess r)

prop_rev_io :: IO Bool
prop_rev_io = do
  r <- quickCheckResult prop_rev
  return (isSuccess r)

prop_pairMapId_io :: IO Bool
prop_pairMapId_io = do
  r <- quickCheckResult prop_pairMapId
  return (isSuccess r)

prop_pairMapAdd1_io :: IO Bool
prop_pairMapAdd1_io = do
  r <- quickCheckResult prop_pairMapAdd1
  return (isSuccess r)

prop_treeSize_io :: IO Bool
prop_treeSize_io = do
  r <- quickCheckResult prop_treeSize
  return (isSuccess r)

prop_treeHeight_io :: IO Bool
prop_treeHeight_io = do
  r <- quickCheckResult prop_treeHeight
  return (isSuccess r)

prop_treeToList_io :: IO Bool
prop_treeToList_io = do
  r <- quickCheckResult prop_treeToList
  return (isSuccess r)

prop_lookupALFound_io :: IO Bool
prop_lookupALFound_io = do
  r <- quickCheckResult prop_lookupALFound
  return (isSuccess r)

prop_lookupALMissing_io :: IO Bool
prop_lookupALMissing_io = do
  r <- quickCheckResult prop_lookupALMissing
  return (isSuccess r)

prop_sortIsSorted_io :: IO Bool
prop_sortIsSorted_io = do
  r <- quickCheckResult prop_sortIsSorted
  return (isSuccess r)

main :: IO ()
main = do
  r1 <- prop_len_io
  if not r1 then exitFailure else putStrLn "len OK"
  r2 <- prop_safeHeadEmpty_io
  if not r2 then exitFailure else putStrLn "safeHeadEmpty OK"
  r3 <- prop_safeHeadCons_io
  if not r3 then exitFailure else putStrLn "safeHeadCons OK"
  r4 <- prop_sumList_io
  if not r4 then exitFailure else putStrLn "sumList OK"
  r5 <- prop_rev_io
  if not r5 then exitFailure else putStrLn "rev OK"
  r6 <- prop_pairMapId_io
  if not r6 then exitFailure else putStrLn "pairMapId OK"
  r7 <- prop_pairMapAdd1_io
  if not r7 then exitFailure else putStrLn "pairMapAdd1 OK"
  r8 <- prop_treeSize_io
  if not r8 then exitFailure else putStrLn "treeSize OK"
  r9 <- prop_treeHeight_io
  if not r9 then exitFailure else putStrLn "treeHeight OK"
  r10 <- prop_treeToList_io
  if not r10 then exitFailure else putStrLn "treeToList OK"
  r11 <- prop_lookupALFound_io
  if not r11 then exitFailure else putStrLn "lookupALFound OK"
  r12 <- prop_lookupALMissing_io
  if not r12 then exitFailure else putStrLn "lookupALMissing OK"
  r13 <- prop_sortIsSorted_io
  if not r13 then exitFailure else putStrLn "sortIsSorted OK"