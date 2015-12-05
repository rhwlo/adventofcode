import Text.Printf
import Quality (isNice, newIsNice)

main :: IO ()
main = do
  strings <- lines <$> readFile "input.txt"
  printf "By the old standards, %i strings are nice\n" (length (filter isNice strings))
  printf "By the new standards, %i strings are nice\n" (length (filter newIsNice strings))
