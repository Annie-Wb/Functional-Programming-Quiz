module LazyExample where

import Test.QuickCheck
import Test.QuickCheck.Function
import Control.Monad (forM_)
import LazyExamples
import System.Exit (exitFailure)

prop_ones_repeat :: Bool
prop_ones_repeat = take 5 ones == replicate 5 1

prop_fibs_start :: Bool
prop_fibs_start = take 6 fibs == [0,1,1,2,3,5]

prop_takeN_eq_take :: [Int] -> NonNegative Int -> Bool
prop_takeN_eq_take xs (NonNegative n) = takeN n xs == take n xs

prop_mapLazy_eq_map :: Fun Int Int -> [Int] -> Bool
prop_mapLazy_eq_map (Fun _ f) xs = mapLazy f xs == map f xs

prop_prefixSums :: [Int] -> Bool
prop_prefixSums xs = prefixSums xs == (if null xs then [] else tail $ scanl (+) 0 xs)

prop_sumStrict :: [Int] -> Bool
prop_sumStrict xs = sumStrict xs == sum xs

main :: IO ()
main = do
  forM_ [ quickCheckResult prop_ones_repeat
         , quickCheckResult prop_fibs_start
         , quickCheckResult prop_takeN_eq_take
         , quickCheckResult prop_mapLazy_eq_map
         , quickCheckResult prop_prefixSums
         , quickCheckResult prop_sumStrict
         ] $ \rIO -> do
    r <- rIO
    case r of { Success {} -> return (); _ -> exitFailure }
