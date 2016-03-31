module MonoidalChars where

import Data.Char
import Data.Foldable
import Text.Printf


type MChar = String


toMChar :: Char -> MChar
toMChar x = [x]


main :: IO ()
main = do
  putStrLn $ foldMap toMChar ['a','b']
  printf "These are the punctuation signs: %s" $ foldMap toMChar punctuactionSigns
  where
    punctuactionSigns = filter isPunctuation [' '..'z']
