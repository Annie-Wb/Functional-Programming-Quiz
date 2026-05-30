{-# LANGUAGE InstanceSigs #-}

module FAMExamples where

import Control.Applicative
import Control.Monad

-- Simple Id wrapper
newtype Id a = Id { runId :: a } deriving (Eq, Show)

instance Functor Id where
  fmap :: (a -> b) -> Id a -> Id b
  fmap = error "implement"

instance Applicative Id where
  pure :: a -> Id a
  pure = error "implement"
  (<*>) :: Id (a -> b) -> Id a -> Id b
  (<*>) =  error "implement"

instance Monad Id where -- see `pure`
  return :: a -> Id a
  return = error "implement"
  (>>=) :: Id a -> (a -> Id b) -> Id b
  (>>=) = error "implement"

-- Pair type
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
  fmap :: (a -> b) -> Pair a -> Pair b
  fmap = error "implement"

instance Applicative Pair where
  pure :: a -> Pair a
  pure = error "implement"
  (<*>) :: Pair (a -> b) -> Pair a -> Pair b
  (<*>) = error "implement"

instance Monad Pair where
  return :: a -> Pair a
  return = error "implement"
  (>>=) :: Pair a -> (a -> Pair b) -> Pair b
  (>>=) = error "implement"

-- State monad skeleton
newtype State s a = State { runState :: s -> (a,s) }

instance Functor (State s) where
  fmap :: (a -> b) -> State s a -> State s b
  fmap = error "implement"

instance Applicative (State s) where
  pure :: a -> State s a
  pure = error "implement"
  (<*>) :: State s (a -> b) -> State s a -> State s b
  (<*>) = error "implement"

instance Monad (State s) where
  return :: a -> State s a
  return = error "implement"
  (>>=) :: State s a -> (a -> State s b) -> State s b
  (>>=) = error "implement"