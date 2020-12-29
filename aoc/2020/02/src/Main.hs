{-# LANGUAGE TemplateHaskell #-}

import EmbedIO

data Rule = Rule
  { range_min :: Int
  , range_max :: Int
  , target :: Char
  , pwd :: String }
  deriving (Show)

parseLine :: String -> Rule
parseLine rule = Rule l' r' target pwd
  where
    parts = words rule
    (l, r) = break (== '-') (parts !! 0)
    l' = (read :: String -> Int) l
    r' = (read :: String -> Int) $ tail r
    target = head $ parts !! 1
    pwd = parts !! 2

filter' :: Rule -> Bool
filter' (Rule range_min range_max target pwd) = len >= range_min && len <= range_max
  where
    len = length $ filter (== target) pwd

filter'' :: Rule -> Bool
filter'' (Rule l' r' target pwd) = (tl == target || tr == target) && tl /= tr
  where
    tl = pwd !! (l' - 1)
    tr = pwd !! (r' - 1)

main :: IO ()
main = do
  let parsed = map parseLine . lines $ $(embedFile "2020/02/input.txt")
  print . length $ filter filter' parsed  -- Part One
  print . length $ filter filter'' parsed -- Part Two

