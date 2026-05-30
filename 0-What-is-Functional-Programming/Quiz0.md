# Quiz 01 - Introduction to Functional Programming

Exercises

1. Pure functions
   - Decide which of the following are pure and which are not: `head`, `putStrLn`, `map`, `randomRIO`.
   - Explain why purity matters for reasoning about programs.

2. Expressions and evaluation
   - Rewrite a small imperative loop that sums a list as a recursive function.
   - State what it means for an expression to be evaluated lazily.

3. Higher-order functions
   - Implement a function `applyTwice :: (a -> a) -> a -> a`.
   - Implement `composeList :: [(a -> a)] -> a -> a` that composes a list of functions.

4. Lists and recursion
   - Implement `mapList :: (a -> b) -> [a] -> [b]` without using `Prelude.map`.
   - Implement `sumList :: Num a => [a] -> a` using recursion.

5. Implement: `incrementAll`, `filterEven`, `pipeline`, `translateLoop`, `higherOrderReplacement`, `foldReplacement`