{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Chapter1Test where

import qualified Data.List as List
import Test.SmallCheck.Series (Serial)
import Test.Tasty             (TestTree, testGroup)
import Test.Tasty.SmallCheck  (testProperty, (==>))
import           Test.Tasty.HUnit                         (testCase, (@?=))

import Chapter1

-- | Exercise 1.1 (pg. 2)
--
-- Some terminology: a function f: R -> R is said to be
-- a) order-preserving if x <= y implies f(x) <= f(y), for all x, y in R
-- b) metric-preserving if |x-y| = |f(x) - f(y)|
-- c) addition-preserving if f(x+y) = f(x) + f(y)
--
-- For each of the three properties defined above --call it foo --find an f that
-- is foo-preserving and an example of an f that is not foo-preserving

fooPreservingSuite
  :: (Num x, Ord x, Show x, Serial IO x) => String -> (x -> x) -> TestTree
fooPreservingSuite fnName fn = testGroup fnName
  [ testProperty "order-preserving" $ \(x, y) -> x < y ==> fn x < fn y
  , testProperty "metric-perserving"
    $ \(x, y) -> abs (x - y) == abs (fn x - fn y)
  , testProperty "addition-preserving" $ \(x, y) -> fn (x + y) == fn x + fn y
  ]

-- | Exercise 1.1 Tests
test_idIsFooPreserving = fooPreservingSuite "id" (id :: Int -> Int)

-- | Exercise 1.1 Tests that are expected to fail
-- test_halfIsNotFooPreserving   = fooPreservingSuite "half" (\ (x :: Int) -> div x 2)
-- test_doubleIsNotFooPreserving = fooPreservingSuite "double" (\ (x :: Int) -> x * 2)
-- test_powTwoIsNotFooPreserving = fooPreservingSuite "powTwo" (\ (x :: Int) -> x ^ 2)

-- | Exercise 1.3
-- TODO still very much WIP
-- 1. Write down all the partitions of a two-element set {., *}, order them as
-- above, and draw the Hasse diagram.
--
-- 2. Now do the same thing for a four-element set, say {1,2,3,4}. There should
-- be 15 partitions.

test_exerciseOneDotThree = testGroup "Exercise 1.3" [
    testProperty "partitions are defined correctly" $ \(xs :: [Int]) ->
      possiblePartitions xs == length (partitions xs)
  ]
