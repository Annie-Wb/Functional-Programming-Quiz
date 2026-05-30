# Quiz — Memoization & Tries

Tasks

1. List-based memoization 
   - Implement `listCache :: [a] -> (a -> b) -> [(a,b)]` which builds a cache for a function over a finite domain.
   - Implement `listLookup :: Eq a => [(a,b)] -> a -> b` which looks up a value in the cache (you may assume the key exists for this exercise).
   - Provide a QuickCheck property that for a small domain and function `f`, `listLookup (listCache domain f) x == f x` for all `x` in the domain.

2. Open recursion & memoized fibonacci
   - Implement `openFibo :: (Int -> Int) -> Int -> Int` as the open-recursive Fibonacci (calls `f` for recursive calls).
   - Implement `fastFibo :: Int -> Int` by memoizing `openFibo` using `memoizeList` (or `listCache`/`listLookup`) over domain `[0..]` so that `fastFibo` is asymptotically faster than naive recursion for repeated calls.

3. Tries and infinite cache
   - Implement a trie data type `data Trie a e = Trie a [(e, Trie a e)]` and functions:
     - `trieLookup :: Eq e => Trie a e -> [e] -> a` (lookup following edges)
     - `mapTrie :: (a -> b) -> Trie a e -> Trie b e`
   - Implement `rootTrie` and `limitTrie` helpers to create and inspect finite prefixes of an infinite trie (signatures provided in skeleton).
   - Implement `trieCache :: [e] -> ( [e] -> a ) -> Trie a e` that builds an (lazily) infinite cache for lists of edges.

Hints
- Use `sized` or small domains in QuickCheck to keep tests fast.
- For `fastFibo`, construct the cache lazily and use `listLookup` so calls reuse computed values.
