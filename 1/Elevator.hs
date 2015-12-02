module Elevator(interpretString) where

import Text.Printf

interpretParens :: Int -> Char -> Int
interpretParens n c = case c of
  '(' -> n + 1
  ')' -> n - 1
  _   -> n

interpretString :: String -> String
interpretString instructions = let
    finalFloor = foldl interpretParens 0 instructions
    instructionsBeforeBasement = length $ takeWhile (>= 0) $ scanl interpretParens 0 instructions
  in
    printf "Processed %i instructions and ended on floor %i%s" (length instructions) finalFloor
      (if length instructions == instructionsBeforeBasement
        then printf ", never entered basement"
        else printf ", entered basement on instruction %i" instructionsBeforeBasement :: String)
