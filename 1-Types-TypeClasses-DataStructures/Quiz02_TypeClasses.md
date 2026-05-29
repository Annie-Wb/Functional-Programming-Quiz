# Quiz 02 — Type Classes

Exercises

1. `Eq` and `Ord`
   - Define a data type `Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun` and derive `Eq` and `Show`.
   - Implement `Ord` for `Weekday` where the week starts on Monday.

2. `Show` and `Read`
   - Create a `Point` type and write custom `Show` instance that prints `Point(x,y)`.

3. `Functor` and `Applicative`
   - Implement `Functor` for the binary tree type in Quiz 3.
   - Implement `Applicative` for the simple wrapper `data Id a = Id a`.

4. `Monoid`
   - Implement `Monoid` for a `newtype Sum a` and `newtype Product a`.

5. Type class laws (informal)
   - State the functor identity and composition laws and test a small example.
