module Parallel where

import Control.Parallel (par, pseq)
import Control.Parallel.Strategies (rpar, rseq, runEval, parList, rdeepseq, using)

-- small example: compute two independent sums in parallel using par and pseq
parallelPairSum :: [Int] -> [Int] -> Int
parallelPairSum = error "implement parallelPairSum"

-- parallelSum: split list and sum parts in parallel (student to implement)
parallelSum :: [Int] -> Int
parallelSum = error "implement parallelSum"
