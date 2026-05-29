module Exercises.LazyParCon.LazyExamples where

-- Examples and skeletons for lazy evaluation exercises

-- infinite list of ones
ones :: [Int]
ones = 1 : ones

-- takeN: take first n elements (student to implement)
takeN :: Int -> [a] -> [a]
takeN = error "implement takeN"

-- sumStrict: a strict sum to avoid thunk buildup
sumStrict :: Num a => [a] -> a
sumStrict = error "implement sumStrict (use strict accumulator)"

-- naive memoization: build list of fibs (example)
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
