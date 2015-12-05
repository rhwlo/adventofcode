import Text.Printf
import Routing (assistedDelivery, countVisitedHouses)

main :: IO ()
main = do
  instructions <- readFile "input.txt"
  printf "Despite the tipsy navigator, Santa visited %i houses\n" (countVisitedHouses instructions)
  printf "With some robotic assistance, %i houses got at least 1 present\n" (assistedDelivery instructions)
