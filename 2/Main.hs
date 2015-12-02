import Data.Tuple.Extra (both)
import Control.Arrow ((<<<), (&&&))
import Text.Printf
import Wrapping (areaFromDimensions, ribbonLengthFromDimensions)

main :: IO ()
main = uncurry (printf "The elves need a total of %i square feet of wrapping paper and %i feet of ribbon\n")
        =<< (both sum <<< fmap areaFromDimensions &&& fmap ribbonLengthFromDimensions <<< lines) <$> readFile "input.txt"
