Types, Type Classes and Data Structures
=====================================

This folder contains a series of quizzes designed to teach types, type classes and data structures in Haskell, with emphasis on property testing (QuickCheck).

Structure:

- `Quiz01_Basics.md` — basic types, functions and pattern matching.
- `Quiz02_TypeClasses.md` — type classes, `Eq`, `Ord`, `Show`, `Functor`, `Monoid`.
- `Quiz03_DataStructures.md` — lists, trees, maps, and custom ADTs.
- `Quiz04_PropertyTesting.md` — QuickCheck properties and writing testable code.
- `Quiz05_MixedProblems.md` — combined problems and small projects.
- `src/` — skeleton modules for exercises.
- `test/` — QuickCheck example tests.

How to use:

1. Open the quiz `.md` you want to work on and implement the skeleton in `src/`.
2. Load the `test/*.hs` files in `ghci` or run with your preferred test runner. Example using `ghci`:

```bash
ghci -isrc test/Quiz04Test.hs
```

For QuickCheck-based tests, install `QuickCheck` if needed (e.g. `cabal install QuickCheck` or add it to your project).

Solutions are provided in `Solutions.md`.
