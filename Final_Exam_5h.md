# Final Exam — Functional Programming in Haskell (5 hours)

Duration: 5 hours (300 minutes)
Total points: 100

Instructions
- This is an individual exam. Work in the `Exercises/FinalExamSubmission/` directory and create one subdirectory with your student id or name.
- Write clear, well-typed Haskell code (`.hs` files) and include a short README that lists how to build/run each part.
- Provide QuickCheck properties where requested and small benchmarks or measurements where asked.
- Document any deviations or assumptions.
- Deliverables: Haskell source files, tests, and a single `report.md` summarizing answers and time spent per section.

Grading scale (total points → grade):
- Fail:   0–49 points
- 3:     50–64 points
- 4:     65–84 points
- 5:     85–100 points

Marking criteria (per task unless stated):
- Correctness: 70% of task points — code compiles and meets the specification.
- Tests & Properties: 15% — appropriate QuickCheck properties / unit tests included.
- Style & Documentation: 10% — clear names, brief comments, README.
- Performance/Robustness: 5% — when relevant, demonstration of performance or handling edge cases.

Time management
- Suggested time allocations are given per section. They are guidelines only; total must not exceed 5 hours.

Section A — Types, Type Classes & Data Structures (+ Property Testing) — 20 points — 60 minutes
1. Types & Polymorphism (6 pts)
   - Implement `len :: [a] -> Int` and `safeHead :: [a] -> Maybe a`.
   - Implement `pairMap :: (a->b) -> (a,a) -> (b,b)` and provide type signatures.

2. Custom ADTs & Type Classes (10 pts)
   - Define `data Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun` with sensible `Show` and implement `Ord` so Monday < ... < Sunday.
   - Design `data Expr = Val Int | Add Expr Expr | Mul Expr Expr` and implement `eval :: Expr -> Int` and `Show` instance that pretty-prints.

3. Data Structures & Property Testing (9 pts)
   - Implement `Tree a` with `treeSize`, `treeHeight`, and `treeToList` (inorder).
   - Provide QuickCheck properties: (a) `length (treeToList t) == treeSize t`, (b) `treeHeight t >= 0`, and a generator for small trees.

Deliverables: `A1.hs` (implementations), `A1Test.hs` (QuickCheck properties). 6 pts correctness, 3 pts tests for (3).

Section B — Functors, Applicatives, Monads — 16 points — 50 minutes
1. Functor & Laws (6 pts)
   - Implement `Functor` for `Pair a` and `Compose f g a` (skeleton provided in course material).
   - Provide QuickCheck tests for identity and composition laws for `Pair`.

2. Applicative (6 pts)
   - Implement `Applicative` for `Id` and for `Pair` and demonstrate `liftA2` usage for a small example.

3. Monad & State (8 pts)
   - Implement `Monad` for `Id` and implement a `State` monad: `newtype State s a` with `get`, `put`, `modify` helpers and small example computing a running total.
   - Provide a short explanation of monad laws and one QuickCheck property for left-identity or right-identity on `Id`.

Deliverables: `B1.hs`, `B1Test.hs` with law checks and examples.

Section C — Monadic Parsing — 12 points — 40 minutes
1. Parser primitives (6 pts)
   - Implement `newtype Parser a = Parser { runParser :: String -> [(a,String)] }`, `item`, `sat`, `char`, and `string` as library functions.

2. Combinators & Expression parser (9 pts)
   - Implement `many`, `many1`, `sepBy` and build a parser for arithmetic expressions with `+` and `*` and parentheses that returns an `Expr` AST (the `Expr` type may be reused from Section A).
   - Provide examples showing correct parse results on inputs like `"1+2*3"`, `"(1+2)*3"` and document ambiguity/backtracking behaviour.

Deliverables: `C1.hs` with parser and sample runs in `C1Demo.hs`.

Section D — Lazy Evaluation — 8 points — 20 minutes
1. Infinite structures & memoization (4 pts)
   - Implement `ones :: [Int]` and `fibs :: [Integer]` using laziness. Explain briefly how `fibs` reuses previous results.

2. Space leaks & strictness (6 pts)
   - Implement `sumStrict :: Num a => [a] -> a` that avoids thunk buildup. Show with a short test that `sumStrict` runs in constant stack (demonstrate via a large list, or explain if you cannot measure here).

Deliverables: `D1.hs` and brief notes in `report.md`.

Section E — Parallelism — 8 points — 25 minutes
1. `par`/`pseq` (4 pts)
   - Write a function that uses `par` and `pseq` to evaluate two independent computations and explain the difference between `par` and `pseq`.

2. Strategies (6 pts)
   - Implement `parallelSum :: [Int] -> Int` using `Control.Parallel.Strategies` (split the list, sum parts with `parList rdeepseq`) and measure (or reason about) potential speedup.

Deliverables: `E1.hs` with a small benchmark snippet or explanation.

Section F — Concurrency — 8 points — 25 minutes
1. Threads & MVar (6 pts)
   - Implement a producer/consumer using `MVar` where the producer places N items and the consumer sums them; ensure proper termination.

2. STM (4 pts)
   - Implement a shared counter using `TVar` and `STM` with `incCounter :: TVar Int -> IO ()` and demonstrate concurrent increments from several threads.

Deliverables: `F1.hs` and `F1Demo.hs` showing runs.

Section G — Integrated Programming Task — 10 points — 30 minutes

Section H — Robustness, Testing & Verification — 12 points — 30 minutes
1. Testing & QuickCheck (6 pts)
   - Design QuickCheck properties to test core functions from previous sections (trees, parser, eval). Provide `Arbitrary` instances or generators and demonstrate property runs.

2. Robustness & error handling (6 pts)
   - Demonstrate safe IO/resource handling using `bracket` or `withFile` and implement graceful error handling for a small IO program (e.g., reading expressions from a file and reporting parse errors without crashing).

Deliverables: `H1.hs`, `H1Test.hs`, short notes in `report.md`.

Section I — Type Theory & Reactive Programming (Bonus theory + practical) — 6 points — 20 minutes
1. Type-theory basics (3 pts)
   - Short-answer: explain what parametricity means and give one example of a free theorem derived from a type (e.g., for `f :: forall a. [a] -> [a]`).

2. Reactive / FRP basics (3 pts)
   - Short implementation or design: outline (or implement a tiny example) of a producer/consumer stream using lazy lists or `Conduit`/`pipes` style folding; explain differences between pull and push-based reactive systems.

Deliverables: `I1.md` or `I1.hs` with short answers and demo.
1. Small project (10 pts)
   - Build a small combined tool that demonstrates multiple topics: parse a list of integer expressions from a string (parsing), evaluate them (AST and `eval`), compute results in parallel (use `parallelSum` or `parMap`), and run a small correctness QuickCheck that results are the same sequentially and in parallel for randomly generated inputs (property testing).

Deliverables: `G1.hs`, `G1Test.hs`, and short README describing how the pieces connect.

Submission checklist
- Put all source under `Exercises/FinalExamSubmission/<your-id>/`.
- Include `report.md` describing how long you spent on each section and any issues.
- Include `build.sh` or instructions to run tests/demos.

Academic honesty
- Cite any external resources used. The exam expects you to apply knowledge from lectures and the provided exercises.

Hints & references
- Use the existing exercise skeletons in `Exercises/Types-TypeClasses-DataStructures/src/`, `Exercises/Lazy-Parallel-Concurrency/src/`, and `Exercises/Functors-Applicatives-Monads/src/` as starting points.
- For property testing, use `Test.QuickCheck` and include `Arbitrary` instances or generators for your custom types.

Good luck.
