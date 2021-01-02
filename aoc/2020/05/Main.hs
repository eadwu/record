{-# LANGUAGE TemplateHaskell #-}

import EmbedIO
import Data.List ( sort, maximum )

input :: String
input = $(embedFile "aoc/2020/05/input.txt")

parseCol :: String -> Int -> Int -> Int
parseCol [] l r = l
parseCol (n:ns) l r
  | n == 'L' = parseCol ns l (r-diff)
  | n == 'R' = parseCol ns (l+diff) r
  where diff = (r - l + 1) `div` 2

parse :: Int -> Int -> String -> (Int, Int)
parse l r seat
  | n == 'F' = parse l (r-diff) ns
  | n == 'B' = parse (l+diff) r ns
  | otherwise = (l, parseCol seat 0 7)
  where
    (n:ns) = seat
    diff = (r - l + 1) `div` 2

seatId :: (Int, Int) -> Int
seatId seat = r * 8 + c
  where
    r = fst seat
    c = snd seat

mySeat :: [Int] -> Int
mySeat (l:ns)
  | succ l /= c = succ l
  | otherwise   = mySeat ns
  where c = head ns

main :: IO ()
main = do
  let seatIds = fmap (seatId . parse 0 127) $ lines input
  -- Part One
  print $ maximum seatIds
  -- Part Two
  print . mySeat $ sort seatIds
