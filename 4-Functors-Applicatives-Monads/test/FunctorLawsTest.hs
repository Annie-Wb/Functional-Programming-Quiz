module FunctorLawsTest where

import Test.QuickCheck
import Control.Applicative
import FAMExamples

-- Functor laws for Id
prop_id_law :: Int -> Bool
prop_id_law x = (fmap id (Id x)) == Id (id x)

prop_comp_law :: Fun Int Int -> Fun Int Int -> Int -> Bool
prop_comp_law (Fun _ f) (Fun _ g) x = fmap (f . g) (Id x) == (fmap f . fmap g) (Id x)

main :: IO ()
main = do
  quickCheck prop_id_law
  quickCheck prop_comp_law
