import Elevator

main :: IO ()
main = putStrLn =<< interpretString <$> readFile "input.txt"
