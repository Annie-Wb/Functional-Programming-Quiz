Lazy Evaluation, Parallelism, and Concurrency
=============================================

This folder contains quizzes and example code covering Haskell's lazy evaluation model, parallelism (pure parallel strategies), and concurrency (threads, MVar, STM).

Files:
- `Quiz01_LazyEvaluation.md`
- `Quiz02_Parallelism.md`
- `Quiz03_Concurrency.md`
- `Solutions.md`
- `src/` — skeleton/example modules: `LazyExamples.hs`, `ParallelExamples.hs`, `ConcurrencyExamples.hs`.
- `test/` — small runnable examples demonstrating concepts.

Load the examples in `ghci` to experiment, for example:

```bash
ghci -isrc test/LazyExample.hs
```
