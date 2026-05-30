# Quiz 01 — Basic Types and Functions

Exercises: Work in `src/Quiz1.hs`

Make sure you implement property tests as well in `test/Quiz1test.hs`

1. Simple expressions
   - Evaluate these expressions and state their types: `42`, `True`, `"x"`, `2 + 3 * 4`, `take 3 [1,2,3,4,5]`.

2. Function definitions
   - Implement `len :: [a] -> Int` without using `length`.
   - Implement `safeHead :: [a] -> Maybe a`. (Safe `head`)

3. Pattern matching and recursion
   - Implement `sumList :: Num a => [a] -> a` using pattern matching.
   - Implement `rev :: [a] -> [a]` (reverse) recursively.

4. Polymorphism
   - Implement `pairMap :: (a->b) -> (a,a) -> (b,b)`.

5. `Eq` and `Ord`
   - Define a data type `Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun` and derive `Eq`, `Enum` and `Show`.
   - Implement `Ord` for `Weekday` where the week starts on Monday.

6. `Show` and `Read`
   - Create a `Point` type and write custom `Show` instance that prints `Point(x,y)`. Create then a Read parser with `readPrec`

7. Lists
   - Implement `filter` and `map` from scratch.

8. Binary Tree ADT
   - Define `data Tree a = Leaf | Node a (Tree a) (Tree a)`.
   - Implement `treeSize :: Tree a -> Int` and `treeHeight :: Tree a -> Int`.
   - Implement `treeToList :: Tree a -> [a]` (inorder traversal).

9. `Functor` and `Applicative`
   - Implement `Functor` for the binary tree type.
   - Implement `Applicative` for the simple wrapper `data Id a = Id a`.

10. `Monoid`
   - Implement `Monoid` for a `newtype Sum a` and `newtype Product a`.

11. Association lists and lookup
   - Implement `lookupAL :: Eq k => k -> [(k,v)] -> Maybe v`.
