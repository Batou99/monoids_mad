module MaybeMonoidalValidation where

import Data.Monoid
import qualified Data.List as List


type Errors = [String]

validateBadWord :: String -> String -> Maybe Errors
validateBadWord word text =
  if word `List.isInfixOf` text 
     then Just ["String contains a bad word: " ++ word]
     else Nothing


validateLength :: Int -> String -> Maybe Errors
validateLength maxLength text =
  if length text <= maxLength
     then Nothing
     else Just ["String is too long"]


extractOrDefault :: Maybe Errors -> String -> String
extractOrDefault (Just x) _ = List.intercalate ", " x
extractOrDefault Nothing def = def


main :: IO ()
main = do
  let phrase = "cobol has native support for monads"
      cool = "cool stuff"

      validations = [
        validateLength 10,
        validateBadWord "monad",
        validateBadWord "cobol"
        ]

      phrase_values = foldMap (\x -> x phrase) validations
      cool_values = foldMap (\x -> x cool) validations
      
  print $ extractOrDefault phrase_values "All Ok"
  print $ extractOrDefault cool_values "All Ok"
