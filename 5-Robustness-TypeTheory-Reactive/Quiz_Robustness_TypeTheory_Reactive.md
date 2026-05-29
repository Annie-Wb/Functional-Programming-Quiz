# Quiz — Robustness & Verification; Type Theory & Reactive Programming

Suggested time: 90 minutes
Total points: 30

This quiz covers practical robustness and verification techniques (property testing, resource safety, verification reasoning) and basic type-theory concepts plus reactive programming (streams/FRP). Work in `Exercises/Robustness-TypeTheory-Reactive/` and include code under `src/` and tests under `test/`.

Section R — Robustness & Verification (16 pts) — 50 minutes

1. Property testing and fuzzing (6 pts)
   - Pick one pure function from earlier exercises (e.g., `treeToList` or `rev`) and write at least two QuickCheck properties that test structural invariants and edge cases.
   - Provide `Arbitrary` instance or generator if needed and run QuickCheck showing the tests pass.

2. Resource safety & exceptions (6 pts)
   - Implement `withFileSafe :: FilePath -> (Handle -> IO a) -> IO a` using `bracket` (do NOT use `withFile` directly; implement the pattern).
   - Write a short program that opens a (possibly missing) file, attempts to parse lines as integers, and returns a safe `Either String [Int]` without leaking handles; include a test or short demo.

3. Lightweight verification & reasoning (4 pts)
   - Provide a short informal proof (3–5 lines) that your `sumStrict` implementation is equivalent to `foldl' (+) 0` for finite lists.
   - Explain one potential source of space leaks in naive list processing and how your `sumStrict` avoids it.

Deliverables: `R1.hs` (implementations), `R1Test.hs` (QuickCheck tests and demo). 6 pts properties, 6 pts bracket/IO, 4 pts reasoning.

Section T — Type Theory & Reactive Programming (14 pts) — 40 minutes

1. Parametricity & free theorems (6 pts)
   - Short-answer: State what parametricity means and derive the free theorem for a function of type `f :: forall a. [a] -> [a]` (informal reasoning is fine). Explain one consequence for programmer reasoning.
   - Provide a short example where parametricity guarantees some property of `f` (e.g., `f` cannot add or remove information of type `a` in a way that depends on `a`).

2. Type inference & polymorphism (4 pts)
   - Given the following definitions, annotate the most general types (no implementation required):
     - `applyTwice x f = f (f x)`
     - `zipWith3 f xs ys zs = map (\(a,b,c) -> f a b c) (zip3 xs ys zs)`
   - Explain briefly (1–2 sentences) how Hindley-Milner type inference finds the most general type.

3. Reactive programming (4 pts)
   - Implement two short demos (each 2–6 lines): (a) a pull-based stream using a lazy list generator `streamFrom :: Int -> [Int]` and `takeN` to consume it; (b) a push-based stream using `Control.Concurrent.Chan` where a producer writes numbers and a consumer prints them.
   - Explain in one sentence the main trade-off between pull- and push-based reactive designs (latency, backpressure, resource control).

Deliverables: `T1.md` (theory answers) or `T1.hs` for small implementations, `T1Demo.hs` for stream demos.

Scoring & Hints
- Give partial credit for correct generators, safe resource handling patterns, and clear reasoning.
- For parametricity, full credit requires a correct informal statement and at least one sensible consequence or example.
