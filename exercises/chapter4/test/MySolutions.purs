module Test.MySolutions
  ( (<$?>)
  , countEven
  , isEven
  , keepNonNegative
  , keepNonNegativeRewrite
  , squared
  )
  where

import Prelude

import Data.Array (filter, head, null, tail)
import Data.Maybe (fromMaybe)

-- Note to reader: Add your solutions to this file

-- Exercise: isEven
isEven :: Int -> Boolean
isEven int =
  if int == 0 then
    true
  else if int == -1 || int == 1 then
    false
  else
    if int < 0 then
      isEven $ int + 2
    else
      isEven $ int - 2

-- Exercise: countEvent
countEven :: Array Int -> Int
countEven arr =
  if null arr then
    0
  else
    if fromMaybe false <<< map isEven $ (head arr) then
      1 + (countEven $ fromMaybe [] $ tail arr)
    else
      countEven $ fromMaybe [] $ tail arr

-- Exercise: squared
squared :: Array Number -> Array Number
squared arr = (\n -> n * n) <$> arr

-- Exercise: keepNonNegative
keepNonNegative :: Array Number -> Array Number
keepNonNegative arr = filter (\n -> n >= 0.0) arr

-- Exercise: filter infix operator
infixr 8 filter as <$?>

-- Exercise: keepNonNegativeRewrite

keepNonNegativeRewrite ∷ Array Number → Array Number
keepNonNegativeRewrite arr = (\n -> n >= 0.0) <$?> arr