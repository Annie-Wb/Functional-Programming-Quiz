# Quiz 04 — Monadic Parsing

Exercises

1. Parser primitives
   - Implement `item :: Parser Char` that consumes a single character.
   - Implement `sat :: (Char -> Bool) -> Parser Char`.

2. Combinators
   - Implement `char`, `string`, `many`, `many1`, and `sepBy` using the parser primitives.

3. Building a small parser
   - Parse simple arithmetic expressions with `+` and `*` and parentheses into an AST.

4. Error handling and backtracking
   - Discuss greedy vs backtracking parsers and implement a parser that prefers longest match.
