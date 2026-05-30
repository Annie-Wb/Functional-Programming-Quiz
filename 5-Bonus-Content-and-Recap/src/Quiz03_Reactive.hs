module Quiz03_Reactive where

data Event a = Event
  deriving (Eq, Show)

data Signal a = Signal
  deriving (Eq, Show)

mapSignal :: (a -> b) -> Signal a -> Signal b
mapSignal = error "implement mapSignal"

combineSignals :: (a -> b -> c) -> Signal a -> Signal b -> Signal c
combineSignals = error "implement combineSignals"

stepEvent :: Event a -> Signal a
stepEvent = error "implement stepEvent"