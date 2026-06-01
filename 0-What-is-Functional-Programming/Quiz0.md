# Quiz 01 - Introduction to Functional Programming

Write the functions in `src/Quiz0.hs`. The goal is to practice turning small programming ideas into clear Haskell functions.

Exercises

1. Pure functions and effects
   - For each of `head`, `putStrLn`, `map`, and `randomRIO`, decide whether it is pure or effectful.
   - For the effectful ones, say what kind of effect they perform.
   - In one or two sentences, explain why purity makes programs easier to test and reason about.

2. Evaluation and laziness
   - Rephrase a tiny imperative loop that sums a list of integers as a recursive Haskell function.
   - Your answer should name the base case and the recursive case.
   - Explain what it means for an expression to be evaluated lazily. Mention that Haskell delays work until a value is actually needed.

3. Single-step higher-order functions
   - Implement `applyTwice :: (a -> a) -> a -> a`.
   - Example: `applyTwice (+1) 10` should give `12`.
   - Implement `composeList :: [(a -> a)] -> a -> a`.
   - Example: `composeList [f, g] x` should mean `f (g x)`.

4. Recursion over lists
   - Implement `mapList :: (a -> b) -> [a] -> [b]` without using `Prelude.map`.
   - Example: `mapList (+1) [1,2,3]` should produce `[2,3,4]`.
   - Implement `sumList :: Num a => [a] -> a` using recursion.
   - Example: `sumList [1,2,3]` should produce `6`.

5. Rewrite the same ideas in more reusable ways
   - `incrementAll :: Num a => [a] -> [a]`
     - Add 1 to every number in the list.
     - This is just a specialised mapping function. Example: `[1,2,3] -> [2,3,4]`.
   - `filterEven :: Integral a => [a] -> [a]`
     - Keep only the even numbers.
     - Example: `[1,2,3,4,5,6] -> [2,4,6]`.
   - `pipeline :: [(a -> a)] -> a -> a`
     - Build one function from many smaller functions.
     - Use the same order as `composeList`: `[f, g, h]` should behave like `f (g (h x))`.
   - `higherOrderReplacement :: (a -> b) -> [a] -> [b]`
     - Take a recursive list-mapping function and replace the explicit recursion with `map`.
     - This should do the same job as your `mapList`.
   - `foldReplacement :: (b -> a -> b) -> b -> [a] -> b`
     - Take an accumulator-style recursive function and rewrite it using `foldl` or `foldr`.
     - For the test suite, make sure it agrees with `foldl` on the concrete example used there.

Tip: write the base case and recursive case first, then look for the matching higher-order combinator once the shape of the solution is clear.