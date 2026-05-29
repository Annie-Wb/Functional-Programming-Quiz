# Quiz 02 — Parallelism

Exercises

1. `par` and `pseq`
   - Explain the difference between `par` and `pseq`.
   - Write a small example that uses `par` to evaluate two independent computations in parallel.

2. `Control.Parallel.Strategies`
   - Use `parList rdeepseq` to evaluate a map over a large list in parallel.
   - Implement a function `parallelSum :: [Int] -> Int` that splits the list and sums parts in parallel.

3. Performance measurement
   - Sketch how to benchmark a parallel vs sequential implementation using `criterion` (conceptual).
