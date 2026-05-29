module Exercises.LazyParCon.ParallelExamples where

import Control.Parallel (par, pseq)
import Control.Parallel.Strategies (rpar, rseq, runEval, parList, rdeepseq, using)

-- small example: compute two independent sums in parallel
parallelPairSum :: [Int] -> [Int] -> Int
parallelPairSum xs ys = a `par` (b `pseq` (a + b))
  where
    a = sum xs
    b = sum ys

-- parallelSum: split list and sum parts in parallel (student to implement)
parallelSum :: [Int] -> Int
parallelSum = error "implement parallelSum using Strategies"
