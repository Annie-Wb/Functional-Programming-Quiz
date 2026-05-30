module Memoization where

-- List-based cache
listCache :: [a] -> (a -> b) -> [(a,b)]
listCache = error "implement"

listLookup :: Eq a => [(a,b)] -> a -> b
listLookup = error "implement"

-- Naive fibonacci (for correctness checks)
fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

-- Open recursion fibonacci
openFibo :: (Int -> Int) -> Int -> Int
openFibo = error "implement"

-- memoizeList helper
memoizeList :: Eq a => [a] -> (a -> b) -> (a -> b)
memoizeList = error "implement"

-- fastFibo using memoization
fastFibo :: Int -> Int
fastFibo = error "implement"

-- Trie type
data Trie a e = Trie a [(e, Trie a e)] deriving (Eq, Show)

trieLookup :: Eq e => Trie a e -> [e] -> a
trieLookup = error "implement"

mapTrie :: (a -> b) -> Trie a e -> Trie b e
mapTrie = error "implement"

-- Helpers for building/inspecting tries
rootTrie :: [e] -> Trie a e
rootTrie = error "implement"

limitTrie :: Int -> Trie a e -> Trie a e
limitTrie = error "implement"

trieCache :: [e] -> ([e] -> a) -> Trie a e
trieCache = error "implement"