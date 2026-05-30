# EDAN40 Functional Programming Exercises

This repository is a course workspace for **EDAN40: Functional Programming**. It collects exercise sheets, solution hints, and Haskell skeletons covering the main topics from the course:

- What functional programming is, and why it differs from imperative/OOP styles
- Haskell basics
- Types, type classes, and data structures
- Laziness, parallelism, and concurrency
- Memoization and tries
- Functors, applicatives, monads, and parsing
- Reasoning, verification, and theory-oriented bonus material
- Final exam preparation material

The subfolders are organized by topic and usually contain:

- `Quiz*.md` files with exercise statements
- `src/` folders with Haskell skeleton code
- `test/` folders with small test programs

## What this repo is meant to do

The repository is meant as exam preparation for the course. It contains Haskell programs to complete, run, and test.

## How it was created

This workspace was assembled from the course exercise material already present in the repository using GPT-5.2-Codex and hand corrected by yours truly.

## How to use it

For each exercise folder, open the `src` folder and complete the skeletons, then run the tests. For example:

```bash
cd 2-Lazy-Parallel-Concurrency
stack test
```

## Final exam material

The top-level files [`Final_Exam.md`](Final_Exam.md) and [`Final_Exam_Solutions.md`](Final_Exam_Solutions.md) contain the paper-exam and solution hints.

An answer template is available in [`FinalExamSubmission/Final_Exam.hs`](FinalExamSubmission/Final_Exam.hs).

## Stack resolver

This repository uses the Stack resolver `lts-24.39`.