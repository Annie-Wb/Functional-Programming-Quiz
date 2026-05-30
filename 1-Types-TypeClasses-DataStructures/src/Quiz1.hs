module Quiz where

len :: [a] -> Int
len = error "implement len"

safeHead :: [a] -> Maybe a
safeHead = error "implement safeHead"

sumList :: Num a => [a] -> a
sumList = error "implement sumList"

rev :: [a] -> [a]
rev = error "implement rev"


data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Eq, Show)

treeSize :: Tree a -> Int
treeSize = error "implement treeSize"

treeHeight :: Tree a -> Int
treeHeight = error "implement treeHeight"

treeToList :: Tree a -> [a]
treeToList = error "implement treeToList"
