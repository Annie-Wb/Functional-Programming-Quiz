module Main where

import Test.QuickCheck
import Control.Monad (forM_)
import Quiz01_TypeTheory
import Quiz02_SomeTheory
import Quiz03_Reactive
import System.Exit (exitFailure)

prop_betaReduce_simple :: Bool
prop_betaReduce_simple = betaReduce (App (Lam "x" (Var "x")) (Var "y")) == Var "y"

prop_principal_defined :: Bool
prop_principal_defined = principalType (Var "x") `seq` True

prop_hmInfer_defined :: Bool
prop_hmInfer_defined = hmInfer (Var "x") `seq` True

prop_mapSignal_defined :: Bool
prop_mapSignal_defined = mapSignal id Signal == Signal

prop_combineSignals_defined :: Bool
prop_combineSignals_defined = combineSignals (\_ _ -> ()) Signal Signal `seq` True

prop_stepEvent_defined :: Bool
prop_stepEvent_defined = case stepEvent Event of _ -> True

prop_quiz02_strings :: Bool
prop_quiz02_strings = functorCategory `seq` monadStructure `seq` recursiveFunction `seq` computabilityTheme `seq` True

main :: IO ()
main = do
  forM_ [ quickCheckResult prop_betaReduce_simple
         , quickCheckResult prop_principal_defined
         , quickCheckResult prop_hmInfer_defined
         , quickCheckResult prop_mapSignal_defined
         , quickCheckResult prop_combineSignals_defined
         , quickCheckResult prop_stepEvent_defined
         , quickCheckResult prop_quiz02_strings
         ] $ \rIO -> do
    r <- rIO
    case r of { Success {} -> return (); _ -> exitFailure }
