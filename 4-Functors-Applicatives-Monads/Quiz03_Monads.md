# Quiz 03 — Monads

Exercises

1. Monad basics
   - State the types of `>>=` and `return`. Implement `Monad` for `Id` and `Maybe` (showing `bind` behavior).

2. Monad laws
   - State left identity, right identity, and associativity. Provide QuickCheck properties for `Maybe`.

3. Do-notation
   - Rewrite a small sequence of binds into `do`-notation and vice versa.

4. Practical monads
   - Implement a simple `State` monad: `newtype State s a = State { runState :: s -> (a,s) }` with `Functor`, `Applicative`, `Monad`.
