import Text.Printf
import Wrapping (areaFromDimensions, ribbonLengthFromDimensions)

main :: IO ()
main = uncurry (printf "The elves need a total of %i square feet of wrapping paper and %i feet of ribbon\n")
        =<< foldl sumAreaAndLength  (0, 0) . lines <$> readFile "input.txt"
  where
    sumAreaAndLength (sumA, sumL) line = (areaFromDimensions line + sumA, ribbonLengthFromDimensions line + sumL)
