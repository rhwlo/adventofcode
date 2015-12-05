module Quality (isNaughty, isNice, newIsNaughty, newIsNice) where

import Data.Tuple.Extra (fst3, snd3, (&&&))
import Data.Either (isRight)
import Data.List (isInfixOf)

isNaughty :: String -> Bool
isNaughty = not . isNice

isNice :: String -> Bool
isNice = isRight . step (Right (Just 0, False, Nothing))

newIsNaughty :: String -> Bool
newIsNaughty = not . newIsNice

newIsNice :: String -> Bool
newIsNice = uncurry (&&) . (fst3 &&& snd3) . newStep (False, False, [])

newStep :: (Bool, Bool, [Char]) -> [Char] -> (Bool, Bool, [Char])
newStep (b, c, _) [] = (b, c, [])
newStep (b, c, s2) (x:xs) = case s2 of
  [] -> newStep (b, c, x:[]) xs
  s:[] -> newStep (b, c, x:s:[]) xs
  s:t:r -> let
      b' = b || t == x
      c' = c || (x:s:[]) `isInfixOf` (t:r)
    in newStep (b', c', x:s2) xs

step :: Either Bool (Maybe Int, Bool, Maybe Char) -> [Char] -> Either Bool (Maybe Int, Bool, Maybe Char)
step (Left b) _ = Left b
step (Right (Nothing, True, m)) [] = Right (Nothing, True, m)
step (Right _) [] = Left False
step (Right (vowelCount, doubledLetter, maybeLastChar)) (x:xs) = let
    vowelCount' = case vowelCount of
      Nothing -> Nothing
      Just 2 -> if x `elem` "aeiou" then Nothing else (Just 2)
      Just n -> if x `elem` "aeiou" then (Just (n + 1)) else (Just n)
    doubledLetter' = case maybeLastChar of
      Nothing -> doubledLetter
      Just z -> doubledLetter || x == z
    maybeLastChar' = Just x
    constructor = case (:x:[]) <$> maybeLastChar of
      Nothing -> Right
      Just twoLetters -> if twoLetters `elem` ["ab", "cd", "pq", "xy"]
        then (\_ -> Left False)
        else Right
  in step (constructor (vowelCount', doubledLetter', maybeLastChar')) xs
