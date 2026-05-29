# Quiz 01 — Basic Types and Functions

Exercises

1. Simple expressions
   - Evaluate these expressions and state their types: `42`, `True`, `"x"`, `2 + 3 * 4`, `take 3 [1,2,3,4,5]`.

2. Function definitions
   - Implement `len :: [a] -> Int` without using `length`.
   - Implement `safeHead :: [a] -> Maybe a`.

3. Pattern matching and recursion
   - Implement `sumList :: Num a => [a] -> a` using pattern matching.
   - Implement `rev :: [a] -> [a]` (reverse) recursively.

4. Polymorphism
   - Implement `pairMap :: (a->b) -> (a,a) -> (b,b)`.

5. Short proofs / reasoning
   - Explain why `id . id = id` for all types.
