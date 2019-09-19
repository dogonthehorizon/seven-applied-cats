module Chapter1 where

import Data.Function (on)
import qualified Data.List as List

-- Exercise 1.3
-- TODO still very much WIP

-- | Comparator for lists that prioritizes list length over list contents.
hasseComparator :: Ord a => [a] -> [a] -> Ordering
hasseComparator xs ys =
  compare (length xs) (length ys) <> compare xs ys

-- | Generate all partitions of the input list sorted for use in a Hasse diagram.
partitions :: Ord a => [a] -> [[a]]
partitions = List.sortBy hasseComparator . tail . List.subsequences

-- | Determine the possible combinations of r sub-elements of a set with n elements
possibleCombinations :: Int -> Int -> Int
possibleCombinations n r =
  let fact x = product [1..x]
  in div (fact n) ((fact r) * (fact $ n - r))

-- | Determine the possible partitions of a mathematical set.
possiblePartitions :: [a] -> Int
possiblePartitions xs =
  let n = length xs
  in
    sum $ (possibleCombinations n) <$> [1..n]

-- | Given a list of partitions, group each partition by it's length
groupPartitions :: [[a]] -> [[[a]]]
groupPartitions = List.groupBy ((==) `on` length)

-- | TODO see how much effort it would be to create a directed graph from the
-- output of partitions.

