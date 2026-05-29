module Exercises.FAM.FAMExamples where

import Control.Applicative
import Control.Monad

-- Simple Id wrapper
newtype Id a = Id { runId :: a } deriving (Eq, Show)

instance Functor Id where
  fmap f (Id x) = Id (f x)

instance Applicative Id where
  pure = Id
  Id f <*> Id x = Id (f x)

instance Monad Id where
  return = pure
  Id x >>= f = f x

-- Pair type
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
  pure x = Pair x x
  Pair f g <*> Pair x y = Pair (f x) (g y)

instance Monad Pair where
  return = pure
  -- nondeterministic-ish bind (student to reason about laws)
  Pair x y >>= k = Pair rx ry
    where Pair rx _ = k x
          Pair _ ry = k y

-- State monad skeleton
newtype State s a = State { runState :: s -> (a,s) }

instance Functor (State s) where
  fmap f m = State $ \s -> let (a,s') = runState m s in (f a, s')

instance Applicative (State s) where
  pure x = State $ \s -> (x,s)
  mf <*> ma = State $ \s ->
    let (f,s1) = runState mf s
        (a,s2) = runState ma s1
    in (f a, s2)

instance Monad (State s) where
  return = pure
  m >>= k = State $ \s ->
    let (a,s1) = runState m s
    in runState (k a) s1
