module Wrapping(areaFromDimensions, ribbonLengthFromDimensions) where

import Data.List (sort, unfoldr)

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs = unfoldr sep xs where
  sep [] = Nothing
  sep ys = Just (takeWhile (/= x) ys, dropWhile (== x) (dropWhile (/= x) ys))

getSortedDimensions :: String -> [Int]
getSortedDimensions = sort . fmap read . splitOn 'x'

ribbonLengthFromDimensions :: String -> Int
ribbonLengthFromDimensions dimensionsString = let
    sortedDimensions = getSortedDimensions dimensionsString
  in
    product sortedDimensions + sum (fmap (* 2) (take 2 sortedDimensions))

areaFromDimensions :: String -> Int
areaFromDimensions dimensionsString = let
    sortedDimensions = getSortedDimensions dimensionsString
    areas :: [Int]
    areas = zipWith (*) sortedDimensions (tail (cycle sortedDimensions))
  in
    sum $ zipWith (*) [3, 2, 2] areas
