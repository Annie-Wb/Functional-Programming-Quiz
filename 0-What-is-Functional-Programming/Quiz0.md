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

- `incrementAll`: increment every element of a list by 1.

- `filterEven`: keep only the even elements of a list.

- `pipeline`: like `composeList`, build a single function from a list of
   functions. If the list is `[f,g,h]` and applied to `x`, decide whether
   you want left-to-right or right-to-left composition; 

- `translateLoop`: an exercise in translation — convert an imperative loop
   (for/while that accumulates a value) into a recursive function. For the
   quiz we suggest using a concrete example such as summing a list of
   `Int`s.

- `higherOrderReplacement`: practice replacing explicit recursion with a
   higher-order function like `map` or `filter`. A canonical shape is
   `(a -> b) -> [a] -> [b]` (i.e. `map`), so implementers should show how a
   recursive element-mapping function can be rewritten using `map`.

- `foldReplacement`: show how to replace a recursive accumulator pattern
   with a fold. The general signature is `(b -> a -> b) -> b -> [a] -> b` —
   implement the same algorithm using `foldr`/`foldl` and compare the two
   implementations.