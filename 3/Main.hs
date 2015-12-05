import Text.Printf
import Routing (deliverWithWorkers)

main :: IO ()
main = do
  instructions <- readFile "input.txt"
  printf "Despite the tipsy navigator, Santa visited %i houses\n" (deliverWithWorkers 1 instructions)
  printf "With some robotic assistance, %i houses got at least 1 present\n" (deliverWithWorkers 2 instructions)
