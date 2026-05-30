module FunctorLawsTest where

import Test.QuickCheck
import Test.QuickCheck.Function
import Control.Monad (forM_)
import FAMExamples
import System.Exit (exitFailure)

-- Functor laws for Id
prop_id_law :: Int -> Bool
prop_id_law x = (fmap id (Id x)) == Id (id x)

prop_comp_law :: Fun Int Int -> Fun Int Int -> Int -> Bool
prop_comp_law (Fun _ f) (Fun _ g) x = fmap (f . g) (Id x) == (fmap f . fmap g) (Id x)

-- Applicative/Monad basic checks for Id
prop_id_applicative :: Fun Int Int -> Int -> Bool
prop_id_applicative (Fun _ f) x = (pure f <*> Id x) == Id (f x)

prop_id_monad :: Int -> Bool
prop_id_monad x = (Id x >>= return) == (Id x)

-- Functor laws for Pair
prop_pair_fmap_id :: Int -> Bool
prop_pair_fmap_id x = fmap id (Pair x x) == Pair x x

main :: IO ()
main = do
  forM_ [ quickCheckResult prop_id_law
         , quickCheckResult prop_comp_law
         , quickCheckResult prop_id_applicative
         , quickCheckResult prop_id_monad
         , quickCheckResult prop_pair_fmap_id
         ] $ \rIO -> do
    r <- rIO
    case r of { Success {} -> return (); _ -> exitFailure }
