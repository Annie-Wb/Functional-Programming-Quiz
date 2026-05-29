# Quiz 01 — Lazy Evaluation

Exercises

1. Thunks and evaluation order
   - Explain when a thunk is created and when it is evaluated.
   - Given `let x = expensive 1 in 2 + 2`, will `expensive` run? Why or why not?

2. Infinite structures
   - Implement `ones :: [Int]` as an infinite list of ones.
   - Implement `takeN :: Int -> [a] -> [a]` (don't use Prelude `take`).

3. Space leaks
   - Explain what a space leak is and why left folds can cause them.
   - Implement `sumStrict :: Num a => [a] -> a` that avoids accumulating thunks.

4. Laziness tricks
   - Use laziness to memoize a simple function (tabulate a list of results).
