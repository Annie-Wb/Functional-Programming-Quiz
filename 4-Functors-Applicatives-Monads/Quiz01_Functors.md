# Quiz 01 — Functors

Exercises

1. Functor basics
   - State the `fmap` type and implement `fmap` for `Maybe` and lists (without using Prelude implementations).

2. Functor laws
   - State the functor identity and composition laws. Provide QuickCheck properties that test these laws for `Maybe` and `[]`.

3. Functor for custom types
   - Define `data Pair a = Pair a a` and implement `Functor` for it.

4. Functor composition
   - Implement `newtype Compose f g a = Compose (f (g a))` and `Functor` for `Compose`.
