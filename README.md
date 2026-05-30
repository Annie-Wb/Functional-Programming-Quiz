# EDAN40 Functional Programming Exercises

This repository is a course workspace for **EDAN40: Functional Programming**. It collects exercise sheets, solution hints, and Haskell skeletons covering the main topics from the course:

- Types, type classes, and data structures
- Laziness, parallelism, and concurrency
- Memoization and tries
- Functors, applicatives, monads, and parsing
- Final exam preparation material

The subfolders are organized by topic and usually contain:

- `Quiz*.md` files with exercise statements
- `src/` folders with Haskell skeleton code
- `test/` folders with small test programs
- `stack.yaml` / `package.yaml` / `.cabal` files for building the examples

## What this repo is meant to do

The repository is meant as exam preparation for the course. It contains Haskell programs to complete, run, and test.

## How it was created

This workspace was assembled from the course exercise material already present in the repository using GPT-5.2-Codex and hand corrected by yours truly.

In other words:

## How to use it

For each exercise folder, open the `src` folder and complete the skeletons, then run the tests. For example:

```bash
cd 2-Lazy-Parallel-Concurrency
stack test
```

## Final exam material

The top-level files [`Final_Exam.md`](Final_Exam.md) and [`Final_Exam_Solutions.md`](Final_Exam_Solutions.md) contain the paper-exam and solution hints.

An answer template is available in [`FinalExamSubmission/Final_Exam.hs`](FinalExamSubmission/Final_Exam.hs).

## Stack version and setup

This repository is tested with Stack resolver `lts-24.39`. To check your local Stack installation run:

```bash
stack --version
```

If you already have `stack` installed, the easiest way to upgrade to the latest release is:

```bash
stack upgrade
```

To install or upgrade Stack from the official installer (works on most Linux/macOS systems):

```bash
curl -sSL https://get.haskellstack.org/ | sh
```