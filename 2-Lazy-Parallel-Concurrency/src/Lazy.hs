module Lazy where


-- infinite list of ones
ones :: [Int]
ones = error "implement ones"

-- takeN: take first n elements (student to implement)
takeN :: Int -> [a] -> [a]
takeN = error "implement takeN"

-- sumStrict: a strict sum to avoid thunk buildup
sumStrict :: Num a => [a] -> a
sumStrict = error "implement sumStrict (use strict accumulator)"

-- naive memoization: build list of fibs (tip: zipWith)
fibs :: [Integer]
fibs = error "implement fibs"

-- mapLazy: map without using Prelude.map
mapLazy :: (a -> b) -> [a] -> [b]
mapLazy = error "implement mapLazy"

-- prefixSums: running totals, useful for spotting laziness issues
prefixSums :: Num a => [a] -> [a]
prefixSums = error "implement prefixSums"
