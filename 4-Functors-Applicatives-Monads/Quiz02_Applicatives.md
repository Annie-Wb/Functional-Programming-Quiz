# Quiz 02 — Applicatives

Exercises

1. Applicative basics
   - State the `pure` and `<*>` types. Implement `Applicative` for `Id` and for `Pair` from Quiz 1.

2. Applicative laws
   - State the laws (identity, composition, homomorphism, interchange) and write QuickCheck properties to assert them for `Id`.

3. Using applicatives
   - Use `liftA2` to combine two `Maybe` values. Implement `sequenceA` for lists using `Applicative`.
