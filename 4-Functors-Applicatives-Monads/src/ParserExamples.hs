{-# LANGUAGE InstanceSigs #-}

module ParserExamples where

import Control.Applicative
import Data.Char

-- Simple parsing library
newtype Parser a = Parser { runParser :: String -> [(a,String)] }

instance Functor Parser where
  fmap :: (a -> b) -> Parser a -> Parser b
  fmap = error "implement fmap"

instance Applicative Parser where
  pure :: a -> Parser a
  pure = error "implement pure"
  (<*>) :: Parser (a -> b) -> Parser a -> Parser b
  (<*>) = apParser

apParser :: Parser (a->b) -> Parser a -> Parser b
apParser = error "implement apParser"

instance Alternative Parser where
  empty :: Parser a
  empty = error "implement empty"
  (<|>) :: Parser a -> Parser a -> Parser a
  (<|>) = error "implement (<|>)"

instance Monad Parser where -- see `pure`
  return :: a -> Parser a
  return = error "implement return"
  (>>=) :: Parser a -> (a -> Parser b) -> Parser b
  (>>=) = error "implement (>>=)"

item :: Parser Char
item = error "implement item"

sat :: (Char -> Bool) -> Parser Char
sat = error "implement sat"

char :: Char -> Parser Char
char = error "implement char"

string :: String -> Parser String
string = error "implement string"

many1 :: Parser a -> Parser [a] -- see `<$>`
many1 = error "implement many1"

sepBy :: Parser a -> Parser sep -> Parser [a] -- see `<|>`
sepBy = error "implement sepBy"