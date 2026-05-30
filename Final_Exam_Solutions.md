# Final Exam — Solution Hints

These are concise hints and guiding snippets for each section of the final exam. They are intended to help students check approach and instructors to grade consistently — not full dumps of answers.

Section A — Types, Type Classes & Data Structures

- A1: Principal types and notes
  - `((,)) :: forall a b. a -> b -> (a,b)` (the tuple constructor).
  - `fmap show :: (Functor f, Show a) => f a -> f String` (needs `Show a`).
  - `either length reverse` is ill-typed: `length :: [x] -> Int` and `reverse :: [y] -> [y]` produce different result types, so they cannot be combined with `either`.
  - `flip (.) :: forall a b c. (a -> b) -> (b -> c) -> a -> c`.

- A2: `Season` and `Term` hints
  - Ordering seasons: any total order is acceptable; a natural choice is `Spring < Summer < Autumn < Winter` (chronological). State it and justify briefly.
  - Evaluate `Add (Lit 2) (Mul (Neg (Lit 3)) (Lit 4))`: compute `2 + ((-3) * 4) = 2 + (-12) = -10`.
  - Example parenthesised rendering: `(2 + ((-3) * 4))` or more generally render `Neg t` as `(- <t>)` and binary ops as `(left op right)`.

- A3: Trees and properties
  - For `Node 7 (Node 3 Leaf (Node 5 Leaf Leaf)) (Node 9 Leaf Leaf)`:
    - size = 4 (nodes with values 7,3,5,9)
    - height = 3 (root->left->right path length)
    - inorder traversal = `[3,5,7,9]`.
  - QuickCheck property: `length (treeToList t) == treeSize t`.
  - Generator strategy: use `sized` to limit depth; at small sizes return `Leaf`, otherwise randomly choose `Node` with smaller `sized` values for children.

Section B — Functors, Applicatives, Monads

- Functor laws
  - For `Pair a = Pair a a`, `fmap f (Pair x y) = Pair (f x) (f y)` satisfies:
    - identity: `fmap id (Pair x y) = Pair (id x) (id y) = Pair x y`.
    - composition: `fmap (f . g) (Pair x y) = Pair (f (g x)) (f (g y)) = fmap f (fmap g (Pair x y))`.
  - If `fmap f (Pair x y) = Pair (f x) y` then composition fails because the second component is untouched.

- Applicative
  - `liftA2 (+) (Id 2) (Id 5) = Id 7`.
  - `liftA2 (,) (Pair 1 2) (Pair 10 20) = Pair (1,10) (2,20)` (pairwise application).
  - `liftA2` lifts a binary function to work over the applicative structure pointwise.

- Monad and `State`
  - `State` trace starting from `3` with steps:
    1. add 4 -> state becomes `7`;
    2. return current state -> value `7`, state `7`;
    3. multiply state by 2 -> final state `14`.
    Result `(7,14)`.
  - Left identity: `return a >>= f` should behave as `f a`; `return` does not change meaning when binding.

Section C — Monadic Parsing

- Parser traces
  - `runParser (char 'a' <|> char 'b') "abc"` yields `[('a',"bc")]` (first alternative succeeds).
  - `runParser (string "ab") "abc"` yields `[ ("ab","c") ]`.
  - `runParser (many (char 'a')) "aaab"` can yield multiple results: `[("", "aaab"), ("a","aab"), ("aa","ab"), ("aaa","b")]` depending on nondeterminism.
  - `many` can return multiple results because it can parse different numbers of repetitions (including zero) and the parser is nondeterministic.

- Grammar design
  - BNF-style: `config := pair (';' pair)* ; pair := name '=' value ; name := letter { letter | digit | '_' } ; value := [^;]+`.
  - To avoid left recursion in arithmetic, use `chainl1` or rewrite left-recursive productions into right-recursive or iterative forms (factor using `term` and `factor` with precedence levels).

Section D — Lazy Evaluation

- Infinite lists & `fibs`
  - `ones = 1 : ones`.
  - `fibs = 0 : 1 : zipWith (+) fibs (tail fibs)` — the knot ties earlier values to later computations, enabling reuse.

- Strict sum / Avoiding space leaks
  - Use `foldl'` or an explicit strict accumulator (`go acc xs | acc `seq` ...` or `BangPatterns`) to avoid thunk buildup.
  - The strict variant prevents a long chain of unevaluated `(+ ...)` thunks in memory.

Section E — Parallelism

- `par` / `pseq`
  - Use `a `par` (b `pseq` (a + b))` pattern: spark `a`, force `b` to ensure ordering then combine.

- Strategies
  - For chunked list reductions prefer `parList rdeepseq` to fully evaluate chunk results in parallel; `parBuffer` is useful when needing limited lookahead; plain `map` is sequential.

Section F — Concurrency

- `MVar` producer/consumer
  - Producer uses `putMVar` or `tryPutMVar` to enqueue items; consumer `takeMVar` in loop. Use a sentinel (e.g. `Nothing`) to signal termination.
  - Blocking occurs on full bounded queues (producer blocks) or empty queues (consumer blocks). A common mistake is forgetting to send the sentinel or to close a channel, causing a deadlock.

- `STM` counter
  - Use `newTVarIO 0` and `atomically $ modifyTVar' t (+1)`; atomic transfers and increments maintain invariants because `atomically` groups reads/writes into a single transaction.

Section G — Integrated Task

- Steps & hints
  - Parse lines to ASTs (failures returned as `Left String`).
  - Evaluate sequentially with `map eval` and in parallel with `withStrategy (parList rdeepseq) . map eval` or `parMap rdeepseq eval`.
  - QuickCheck property: `forAll genExprList $ \xs -> evalSeq xs == evalPar xs`.

Section H — Robustness, Testing & Verification

- Testing & QuickCheck
  - Provide `Arbitrary` instances for small trees and small expression strings; keep sizes small via `sized`.
  - Example properties: `length (treeToList t) == treeSize t` and `forAll genExprString $ \s -> case runParser parseExpr s of (e,_):_ -> True; _ -> False`.

- Robustness & error handling
  - Use `bracket` or `withFile` to guarantee resource cleanup even on exceptions.
  - Report parse errors as `Either String a` so callers can handle errors without throwing exceptions.

Section I — Type Theory & Reactive Programming

- Type-theory basics
  - Parametricity: a value-polymorphic function cannot inspect or pattern-match on values of arbitrary type `a` and therefore satisfies free theorems; e.g. `f :: forall a. [a] -> [a]` must preserve the shape of lists and commute with `map` in expected ways.

- Reactive / FRP basics
  - Briefly explain push vs pull streams and mention simple lazy-list or `Chan` producer/consumer as modelling abstractions.

General grading hints
- Prefer correct, well-typed answers and concise reasoning. Partial credit should be awarded for correct approach or types even if some details are omitted.

Instructor note
- These hints are intentionally concise; graders may award partial credit for correct approach, types, and tests even if edge-cases are omitted.

General grading hints
- Prefer correct, well-typed implementations even if they are not fully optimised.
- Tests and properties should be runnable with `stack`/`ghci` — include short commands in student's `README`.

Instructor note
- These hints are intentionally high-level; graders may award partial credit for correct approach, types, and tests even if minor edge-cases are missing.
