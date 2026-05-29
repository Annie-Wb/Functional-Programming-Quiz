# Quiz 03 — Data Structures

Exercises

1. Lists
   - Implement `filter` and `map` from scratch.

2. Binary Tree ADT
   - Define `data Tree a = Leaf | Node a (Tree a) (Tree a)`.
   - Implement `treeSize :: Tree a -> Int` and `treeHeight :: Tree a -> Int`.
   - Implement `treeToList :: Tree a -> [a]` (inorder traversal).

3. Association lists and lookup
   - Implement `lookupAL :: Eq k => k -> [(k,v)] -> Maybe v`.

4. Custom ADT design
   - Design a small AST for arithmetic expressions and write an evaluator.
