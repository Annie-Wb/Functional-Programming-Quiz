module Exercises.FAM.ParserExamples where

import Control.Applicative
import Data.Char

-- Simple parsing library (students implement/comprehend)
newtype Parser a = Parser { runParser :: String -> [(a,String)] }

instance Functor Parser where
  fmap f (Parser p) = Parser $ \s -> [ (f a, s') | (a,s') <- p s ]

instance Applicative Parser where
  pure x = Parser $ \s -> [(x,s)]
  (<*>) = apParser

apParser :: Parser (a->b) -> Parser a -> Parser b
apParser (Parser pf) (Parser pa) = Parser $ \s ->
  [ (f a, s'') | (f,s') <- pf s, (a,s'') <- pa s' ]

instance Alternative Parser where
  empty = Parser $ \_ -> []
  (Parser p1) <|> (Parser p2) = Parser $ \s -> p1 s ++ p2 s

item :: Parser Char
item = Parser $ \s -> case s of
  (c:cs) -> [(c,cs)]
  [] -> []

sat :: (Char -> Bool) -> Parser Char
sat pred = do
  c <- item
  if pred c then pure c else empty

char :: Char -> Parser Char
char c = sat (== c)

string :: String -> Parser String
string [] = pure []
string (c:cs) = (:) <$> char c <*> string cs

many1 :: Parser a -> Parser [a]
many1 p = (:) <$> p <*> many p

sepBy :: Parser a -> Parser sep -> Parser [a]
sepBy p sep = (:) <$> p <*> many (sep *> p) <|> pure []
