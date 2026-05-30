module Quiz0 where

applyTwice :: (a -> a) -> a -> a
applyTwice = error "implement applyTwice"

composeList :: [(a -> a)] -> a -> a
composeList = error "implement composeList"

mapList :: (a -> b) -> [a] -> [b]
mapList = error "implement mapList"

sumList :: Num a => [a] -> a
sumList = error "implement sumList"

incrementAll :: [Int] -> [Int]
incrementAll = error "implement incrementAll"

filterEven :: [Int] -> [Int]
filterEven = error "implement filterEven"

pipeline :: [a -> a] -> a -> a
pipeline = error "implement pipeline"

translateLoop :: a
translateLoop = error "translateLoop: not implemented"

higherOrderReplacement :: a
higherOrderReplacement = error "higherOrderReplacement: not implemented"

foldReplacement :: a
foldReplacement = error "foldReplacement: not implemented"
