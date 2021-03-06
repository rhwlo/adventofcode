module Routing (deliverWithWorkers) where

import qualified Data.Set as DS

deliverWithWorkers :: Int -> [Char] -> Int
deliverWithWorkers workers = countVisitedHouses . distributeList workers

distributeList :: Int -> [a] -> [[a]]
distributeList n xs = let
    batch = take n xs
    remaining = drop n xs
  in case length batch of
    0 -> take n $ repeat []
    m -> distribute n (distributeList n remaining, batch)
  where
    distribute :: Int -> ([[a]], [a]) -> [[a]]
    distribute _ ([], _) = []
    distribute _ (ys, []) = ys
    distribute m (c:cs, y:ys) = (y:c):(distribute (m - 1) (cs, ys))

countVisitedHouses :: [[Char]] -> Int
countVisitedHouses = length . DS.unions . map visitedSetFromDirections
  where
    visitedSetFromDirections :: [Char] -> DS.Set (Int, Int)
    visitedSetFromDirections = uncurry DS.insert . foldl getHouses ((0,0), DS.empty)
    getHouses :: ((Int, Int), DS.Set (Int, Int)) -> Char -> ((Int, Int), DS.Set (Int, Int))
    getHouses ((x, y), visited) direction = let
        newPosition = case direction of
          '^' -> (x, y + 1)
          '>' -> (x + 1, y)
          'v' -> (x, y - 1)
          '<' -> (x - 1, y)
          _   -> (x, y)
      in
        (newPosition, DS.insert (x, y) visited)
