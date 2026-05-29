# Solutions and Hints

Brief hints for the quizzes.

- Quiz01: create `ones = 1 : ones`; `sumStrict` can be implemented using `foldl'` from `Data.List` or explicit strict accumulator (`!acc`).
- Quiz02: `par` sparks evaluation; `pseq` enforces sequencing. Use `withStrategy` and `parList` from `Control.Parallel.Strategies`.
- Quiz03: use `forkIO`, `newEmptyMVar`, `putMVar`/`takeMVar` for producer/consumer. Use `atomically` and `modifyTVar'` for `STM` counters.
