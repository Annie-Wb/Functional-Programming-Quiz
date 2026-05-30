module Main where

import Test.QuickCheck
import Test.QuickCheck.Function
import System.Exit (exitFailure)
import Data.List (sort)
import Quiz0

-- Tests that exercise your implementations in src/QuizAll.hs

prop_mapList_eq_map :: Fun Int Int -> [Int] -> Bool
prop_mapList_eq_map (Fun _ f) xs = mapList f xs == map f xs

prop_sumList_eq_sum :: [Int] -> Bool
prop_sumList_eq_sum xs = sumList xs == sum xs

prop_applyTwice :: Fun Int Int -> Int -> Bool
prop_applyTwice (Fun _ f) x = applyTwice f x == f (f x)

prop_compose_two :: Fun Int Int -> Fun Int Int -> Int -> Bool
prop_compose_two (Fun _ f) (Fun _ g) x = composeList [f,g] x == (f . g) x

prop_incrementAll :: [Int] -> Bool
prop_incrementAll xs = incrementAll xs == map (+1) xs

prop_filterEven :: [Int] -> Bool
prop_filterEven xs = filterEven xs == filter even xs

-- pipeline should behave like composeList for consecutive functions
prop_pipeline_eq_compose :: [Fun Int Int] -> Int -> Bool
prop_pipeline_eq_compose fs x =
  let funcs = map apply fs
  in pipeline funcs x == composeList funcs x

main :: IO ()
main = do
  r1 <- quickCheckResult prop_mapList_eq_map
  case r1 of { Success {} -> return (); _ -> exitFailure }
  r2 <- quickCheckResult prop_sumList_eq_sum
  case r2 of { Success {} -> return (); _ -> exitFailure }
  r3 <- quickCheckResult prop_applyTwice
  case r3 of { Success {} -> return (); _ -> exitFailure }
  r4 <- quickCheckResult prop_compose_two
  case r4 of { Success {} -> return (); _ -> exitFailure }
  r5 <- quickCheckResult prop_incrementAll
  case r5 of { Success {} -> return (); _ -> exitFailure }
  r6 <- quickCheckResult prop_filterEven
  case r6 of { Success {} -> return (); _ -> exitFailure }
  r7 <- quickCheckResult prop_pipeline_eq_compose
  case r7 of { Success {} -> return (); _ -> exitFailure }
