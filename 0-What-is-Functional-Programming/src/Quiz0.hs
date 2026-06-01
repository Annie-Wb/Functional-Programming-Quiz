module Quiz0 where

applyTwice :: (a -> a) -> a -> a
applyTwice = error "implement applyTwice"

-- composes two functions
composeTwo :: [(a -> a)] -> a -> a
composeTwo = error "implement composeList"

mapList :: (a -> b) -> [a] -> [b]
mapList = error "implement mapList"

sumList :: Num a => [a] -> a
sumList = error "implement sumList"

-- make these generic where appropriate
incrementAll :: Num a => [a] -> [a]
incrementAll = error "implement incrementAll"

filterEven :: Integral a => [a] -> [a]
filterEven = error "implement filterEven"

pipeline :: [(a -> a)] -> a -> a
pipeline = error "implement pipeline"

higherOrderReplacement :: (a -> b) -> [a] -> [b]
higherOrderReplacement = error "higherOrderReplacement: not implemented"

foldReplacement :: (b -> a -> b) -> b -> [a] -> b
foldReplacement = error "foldReplacement: not implemented"
