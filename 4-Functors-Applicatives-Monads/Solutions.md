# Solutions and Hints

Short hints for the Functors/Applicatives/Monads/Parsing quizzes.

- Functor: implement `fmap` for `Pair a` as `fmap f (Pair x y) = Pair (f x) (f y)`.
- Applicative: `Id` and `Pair` implementations are straightforward; test laws with QuickCheck.
- Monad: `Maybe` bind returns `Nothing` on `Nothing`, otherwise applies function.
- Parser: classic `Parser` newtype with `[ (a, String) ]` results; `item` consumes head.
