module NonAssociativeOps where

import Text.Printf


main :: IO ()
main = do
  let nums = [1 :: Int, 2, 3]
  -- ((0 - 1) - 2) - 3
  printf "Folding from the left: %i\n" $ foldl (-) 0 nums
  -- 1 - (2 - (3 - 0))
  printf "Folding from the right: %i\n" $ foldr (-) 0 nums



