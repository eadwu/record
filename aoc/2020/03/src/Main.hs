{-# LANGUAGE TemplateHaskell #-}

import EmbedIO

input :: String
input = $(embedFile "2020/03/input.txt")

everyN :: Int -> [a] -> [a]
everyN n []     = []
everyN n (x:xs) = x : everyN n (drop (n-1) xs)

main :: IO ()
main = do
  -- Part One
  let r3d1 = rXd1 3
  print r3d1
  -- Part Two
  -- Right 1, down 1.
  let r1d1 = rXd1 1
  -- Right 3, down 1. (This is the slope you already checked.)
  -- Right 5, down 1.
  let r5d1 = rXd1 5
  -- Right 7, down 1.
  let r7d1 = rXd1 7
  -- Right 1, down 2.
  let r1d2 = rXd2 1
  print $ r1d1 * r3d1 * r5d1 * r7d1 * r1d2
  where
    -- zipWith can probably replace fmap use
    rXd1 x = length . filter (== '#') $ fmap (\(index, line) -> line !! (index `mod` length line)) $ zip [0,x ..] (lines input)
    rXd2 x = length . filter (== '#') $ fmap (\(index, line) -> line !! (index `mod` length line)) $ zip [0,x ..] (everyN 2 $ lines input)
