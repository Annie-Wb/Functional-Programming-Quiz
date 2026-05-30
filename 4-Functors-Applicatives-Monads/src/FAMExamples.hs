{-# LANGUAGE InstanceSigs #-}

module FAMExamples where

import Control.Applicative
import Control.Monad

-- Simple Id wrapper
newtype Id a = Id { runId :: a } deriving (Eq, Show)

instance Functor Id where
  fmap :: (a -> b) -> Id a -> Id b
  fmap = error "implement Id.fmap"

instance Applicative Id where
  pure :: a -> Id a
  pure = error "implement Id.pure"
  (<*>) :: Id (a -> b) -> Id a -> Id b
  (<*>) =  error "implement Id(<*>)"

instance Monad Id where -- see `pure`
  return :: a -> Id a
  return = error "implement Id.return"
  (>>=) :: Id a -> (a -> Id b) -> Id b
  (>>=) = error "implement Id.(>>=)"

-- Pair type
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
  fmap :: (a -> b) -> Pair a -> Pair b
  fmap = error "implement Pair.fmap"

instance Applicative Pair where
  pure :: a -> Pair a
  pure = error "implement Pair.pure"
  (<*>) :: Pair (a -> b) -> Pair a -> Pair b
  (<*>) = error "implement Pair(<*>)"

instance Monad Pair where
  return :: a -> Pair a
  return = error "implement Pair.return"
  (>>=) :: Pair a -> (a -> Pair b) -> Pair b
  (>>=) = error "implement Pair.(>>=)"

-- State monad skeleton
newtype State s a = State { runState :: s -> (a,s) }

instance Functor (State s) where
  fmap :: (a -> b) -> State s a -> State s b
  fmap = error "implement State.fmap"

instance Applicative (State s) where
  pure :: a -> State s a
  pure = error "implement State.pure"
  (<*>) :: State s (a -> b) -> State s a -> State s b
  (<*>) = error "implement State(<*>)"

instance Monad (State s) where
  return :: a -> State s a
  return = error "implement State.return"
  (>>=) :: State s a -> (a -> State s b) -> State s b
  (>>=) = error "implement State.(>>=)"