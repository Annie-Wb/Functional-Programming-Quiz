# Final Exam — Solution Hints

These are concise hints and guiding snippets for each section of the final exam. They are intended to help students check approach and instructors to grade consistently — not full dumps of answers.

Section A — Types, Type Classes & Data Structures

- A1: `len` and `safeHead`
  - `len` can be implemented recursively or with a strict fold: `len = foldl' (\n _ -> n+1) 0` (import `Data.List`).
  - `safeHead [] = Nothing; safeHead (x:_) = Just x`.
  - `pairMap f (x,y) = (f x, f y)` (polymorphic types).

- A2: `Weekday` and `Expr`
  - Implement `Ord` by mapping constructors to an `Int` or by pattern-matching comparisons: `compare Mon Tue = LT` etc.
  - `Expr` evaluation: `eval (Val n) = n; eval (Add a b) = eval a + eval b; eval (Mul a b) = eval a * eval b`.
  - For `Show` prefer precedence-aware pretty-printing; simple parenthesised printing is acceptable.

- A3: `Tree` and QuickCheck
  - `treeSize Leaf = 0; treeSize (Node _ l r) = 1 + treeSize l + treeSize r`.
  - `treeHeight Leaf = 0; treeHeight (Node _ l r) = 1 + max (treeHeight l) (treeHeight r)`.
  - `treeToList` inorder: recurse left, yield value, recurse right.
  - QuickCheck generator (small trees):
    - Use `sized` to control depth: base case `return Leaf`, otherwise randomly build `Node` with smaller size for children.
    - Property examples: `length (treeToList t) == treeSize t` and `treeHeight t >= 0`.

Section B — Functors, Applicatives, Monads

- Functor for `Pair` and `Compose`
  - `fmap f (Pair x y) = Pair (f x) (f y)`.
  - For `Compose f g a` (where `Compose (f (g a))`): `fmap h (Compose x) = Compose (fmap (fmap h) x)`.
  - Test functor laws with QuickCheck: `fmap id == id` and `fmap (f . g) == fmap f . fmap g`.

- Applicative
  - `Id` and `Pair` are straightforward; ensure laws (identity/composition/homomorphism/interchange) are tested for `Id`.
  - `liftA2 (+) (Id 2) (Id 3) == Id 5` demonstrates usage.

- Monad and `State`
  - `Id` bind: `Id x >>= f = f x`.
  - `State` skeleton: `newtype State s a = State { runState :: s -> (a,s) }`.
    - `get = State $ \s -> (s,s)`; `put s = State $ \_ -> ((),s)`; `modify f = State $ \s -> ((), f s)`.
  - QuickCheck law check: left-identity for `Id`: `return a >>= f` should equal `f a`.

Section C — Monadic Parsing

- Parser primitives
  - `newtype Parser a = Parser { runParser :: String -> [(a,String)] }`.
  - `item`: consume head if present: `item = Parser $ \s -> case s of c:cs -> [(c,cs)]; [] -> []`.
  - `sat p = do { c <- item; if p c then return c else empty }` using `Alternative`/`Monad`.
  - `char c = sat (==c)` and `string` by recursion: `string [] = pure []; string (c:cs) = (:) <$> char c <*> string cs`.

- Combinators and expression parser
  - `many` and `many1` are standard; `sepBy p sep = (:) <$> p <*> many (sep *> p) <|> pure []`.
  - For arithmetic: use a grammar with precedence:
    - `expr = chainl1 term (AddOp)`
    - `term = chainl1 factor (MulOp)`
    - `factor = number <|> between (char '(') (char ')') expr`
  - Avoid left-recursive productions; use `chainl1`-style combinator (left-associative).
  - Document backtracking: the simple `Parser` above is nondeterministic (returns multiple results); tests should check the first/expected parse.

Section D — Lazy Evaluation

- Infinite lists & `fibs`
  - `ones = 1 : ones` or `repeat 1`.
  - `fibs = 0 : 1 : zipWith (+) fibs (tail fibs)` — explain reuse: `fibs` ties the knot and shares previously computed elements.

- Strict sum / Avoiding space leaks
  - Use `foldl'` from `Data.List` or an explicit strict accumulator: `go !acc [] = acc; go !acc (x:xs) = go (acc+x) xs` (requires `BangPatterns` or `seq`).
  - Demonstration: call `sumStrict [1..n]` for large `n` and ensure it does not grow memory due to thunks.

Section E — Parallelism

- `par` / `pseq`
  - `par` sparks potential parallel evaluation; `pseq` enforces evaluation order (or use `seq`). Typical idiom: `a `par` (b `pseq` (a+b))`.

- Strategies
  - Use `Control.Parallel.Strategies`: `withStrategy (parList rdeepseq)` or `map (f) `using` parList rdeepseq` to parallelise list computations.
  - `parallelSum`: split list into chunks (e.g., `chunksOf k xs`), evaluate each chunk's sum in parallel using `parList rdeepseq`, then combine.

Section F — Concurrency

- `MVar` producer/consumer
  - Producer: `putMVar` items into an `MVar` or use a bounded queue; consumer: `takeMVar` in a loop.
  - Termination: send a sentinel value (e.g., `Nothing` in `Maybe` stream) or use an additional `MVar` for acknowledgements.

- `STM` counter
  - Use `newTVarIO` / `atomically $ modifyTVar' t (+1)`; spawn several `forkIO` threads incrementing concurrently, then read final value with `atomically $ readTVar`.

Section G — Integrated Task

- Steps & hints
  - Reuse the `Parser` to parse many expressions into `[Expr]`.
  - Use `parMap rdeepseq` or `map (`using` parList rdeepseq)` to evaluate the list in parallel and compare with sequential `map eval`.
  - QuickCheck property: for randomly generated small expression lists, `evalSeq xs == evalPar xs` (compare results lists).

Section H — Robustness, Testing & Verification

- Testing & QuickCheck
  - Reuse `Arbitrary` instances from earlier sections (trees, Expr). Focus on small generators to keep tests fast.
  - Example property: round-trip parsing: `forAll genExprString $ \s -> case runParser parseExpr s of (e,_) : _ -> True; _ -> False`.

- Robustness & error handling
  - Use `bracket` from `Control.Exception` or `withFile` for safe resource handling. Example:
    - `bracket (openFile f ReadMode) hClose (\h -> process h)`.
  - For IO-driven parse pipelines, catch parse errors and return `Either String a` or `Maybe a` rather than throwing exceptions.

Section I — Type Theory & Reactive Programming

- Type-theory basics
  - Parametricity: functions polymorphic in `a` cannot inspect values of type `a`, leading to free theorems. Example: `f :: forall a. [a] -> [a]` must commute with any function `g :: a -> b` in the sense `map g . f = f' . map g` for related `f'` and `f` (explain informally).

- Reactive / FRP basics
  - For the exam, a minimal acceptable answer is a clear explanation of push vs pull streams, and a small producer/consumer example using lazy lists or `Chan`.
  - If students implement a tiny example, reward correct structure and explanation even if not production-grade FRP.

General grading hints
- Prefer correct, well-typed implementations even if they are not fully optimised.
- Tests and properties should be runnable with `stack`/`ghci` — include short commands in student's `README`.

Instructor note
- These hints are intentionally high-level; graders may award partial credit for correct approach, types, and tests even if minor edge-cases are missing.
