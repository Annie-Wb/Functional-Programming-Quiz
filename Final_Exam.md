# Final Exam - Functional Programming in Haskell (Paper Exam, 5 hours)

Duration: 5 hours (300 minutes)
Total points: 100 + 6 bonus

Instructions
- This is a paper exam. Write your answers in the booklet or in the provided PDF answer sheet.
- You may write short Haskell snippets when asked, but do not assume a compiler, editor, or internet access.
- Show reasoning where relevant. Short, correct explanations are worth more than long vague answers.
- If a question asks for a sketch, a pseudo-code answer is acceptable as long as the types and control flow are clear.
- Do not rely on exercises from the quizzes as templates; this exam uses different prompts and examples.

Grading scale (total points -> grade)
- Fail: 0-49 points
- 3: 50-64 points
- 4: 65-84 points
- 5: 85-100 points

Time management
- Suggested time allocations are given per section. They are guidelines only.

## Section A - Types, Data Structures, and Reasoning - 20 points - 60 minutes
**1. Type inference and polymorphism (6 pts)**
   - Determine the principal types of the following expressions:
     - `((,))`
     - `fmap show`
     - `either length reverse`
     - `flip (.)`
   - For one of the expressions, explain in one sentence why the type is as general as possible.

**2. Custom data types (7 pts)**
   - Consider the following definitions:
     - `data Season = Spring | Summer | Autumn | Winter`
     - `data Term = Lit Int | Neg Term | Add Term Term | Mul Term Term`
   - State how you would order the seasons from smallest to largest and justify the choice.
   - Evaluate the term `Add (Lit 2) (Mul (Neg (Lit 3)) (Lit 4))`.
   - Write a short, parenthesized `Show` style rendering for `Term` that avoids ambiguity.

**3. Trees and properties (7 pts)**
   - For the tree `Node 7 (Node 3 Leaf (Node 5 Leaf Leaf)) (Node 9 Leaf Leaf)` compute the size, height, and inorder traversal.
   - State one QuickCheck property connecting `treeSize` and `treeToList`.
   - Describe a simple strategy for generating small random trees without letting them grow too deep.


   

## Section B - Functors, Applicatives, and Monads - 16 points - 50 minutes
**1. Functor laws (6 pts)**
   - A data type `Pair a = Pair a a` has the instance `fmap f (Pair x y) = Pair (f x) (f y)`.
   - Explain why the identity and composition laws hold for this instance.
   - If a student wrote `fmap f (Pair x y) = Pair (f x) y`, state which functor law fails and why.

**2. Applicative reasoning (5 pts)**
   - Consider `newtype Id a = Id a` and `Pair a`.
   - For each of the following, compute the result by hand:
     - `liftA2 (+) (Id 2) (Id 5)`
     - `liftA2 (,) (Pair 1 2) (Pair 10 20)`
   - In one sentence, explain what `liftA2` captures conceptually.

**3. Monad and State (5 pts)**
   - A state computation is represented by `newtype State s a = State { runState :: s -> (a, s) }`.
   - Trace the result of the following sequence starting from state `3`:
     - first add `4` to the state,
     - then return the current state as the value,
     - then multiply the state by `2`.
   - State the meaning of left identity for monads in plain English.


   

## Section C - Monadic Parsing - 12 points - 40 minutes
**1. Parser traces (6 pts)**
   - Let `Parser a = String -> [(a, String)]` be the nondeterministic parser from lectures.
   - Given parsers `char 'a'`, `char 'b'`, and `string "ab"`, compute the result of:
     - `runParser (char 'a' <|> char 'b') "abc"`
     - `runParser (string "ab") "abc"`
     - `runParser (many (char 'a')) "aaab"`
   - Explain briefly why `many` can return more than one result in a nondeterministic parser.

**2. Grammar design (6 pts)**
   - Design a parser for a simple configuration line of the form `name=value;name=value;...`.
   - Write the grammar in words or BNF-style form.
   - Explain how you would avoid left recursion if the grammar were extended with arithmetic expressions.


   

## Section D - Lazy Evaluation - 8 points - 20 minutes
**1. Sharing and evaluation order (4 pts)**
   - Consider `xs = 1 : map (+2) xs`.
   - Write down the first five values of `xs`.
   - Explain where sharing occurs in this definition and why it is productive.

**2. Thunks and strictness (4 pts)**
   - Compare `foldl (+) 0 [1..n]` and a strict variant that forces the accumulator at each step.
   - Draw or describe where thunks accumulate in the lazy version.
   - Give one reason why a strict accumulator avoids the space leak.


   

## Section E - Parallelism - 8 points - 25 minutes
**1. `par` and `pseq` (4 pts)**
   - A function computes two expensive subresults `a` and `b` and then combines them.
   - Sketch where you would place `par` and `pseq` so that the subresults can run independently.
   - Explain the difference between creating a spark and forcing evaluation.

**2. Parallel strategies (4 pts)**
   - Suppose a list of 8 expensive tasks is split into chunks and each chunk is reduced independently.
   - Which strategy would you choose: `parList rdeepseq`, `parBuffer`, or plain `map`? Justify your choice in one or two sentences.


   

## Section F - Concurrency - 8 points - 25 minutes
**1. MVar protocol (4 pts)**
   - A producer places a sequence of numbers into an `MVar`-based queue and a consumer sums them until it sees a sentinel value.
   - Explain how termination is signaled and where blocking can occur.
   - Mention one common mistake that can cause a deadlock in this setup.

**2. STM invariant (4 pts)**
   - Two `TVar Int` values model the balances of two bank accounts.
   - Describe how an atomic transfer keeps the total balance constant.
   - Explain why `atomically` and `retry` are useful in this setting.


   

## Section G - Integrated Programming Task - 10 points - 30 minutes
**1. Design a small pipeline (10 pts)**
   - You are given a text file containing one arithmetic expression per line.
   - On paper, describe a pipeline that:
     - parses each line into an AST,
     - evaluates the ASTs,
     - evaluates independent lines in parallel,
     - and checks that the sequential and parallel results agree.
   - State one QuickCheck property you would use for the agreement check.
   - The answer may be a high-level design or a code sketch; full compilable code is not required.


   

## Section H - Robustness, Testing, and Verification - 12 points - 30 minutes
**1. Testing and QuickCheck (6 pts)**
   - Propose two QuickCheck properties for the material in this exam.
   - One property should target a tree function, and one should target a parser or evaluator.
   - For one property, describe the shape of the generator you would use.

**2. Safe IO and error handling (6 pts)**
   - Explain when you would use `bracket` or `withFile` instead of manual open/close handling.
   - Sketch how a small program should report parse errors using `Either String a` or `Maybe a` rather than throwing an exception.


   

## Section I - Bonus Theory - 6 points - 20 minutes
**1. Parametricity (3 pts)**
   - Explain what parametricity means for a function of type `forall a. [a] -> [a]`.
   - Give one informal free theorem or consequence of that type.

**2. Reactive basics (3 pts)**
   - Compare pull-based and push-based stream processing in one short paragraph.
   - Mention one simple Haskell abstraction that can model a stream pipeline on paper.

Good luck.