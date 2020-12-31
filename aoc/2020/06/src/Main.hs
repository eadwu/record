{-# LANGUAGE TemplateHaskell #-}

import EmbedIO
import Data.List ( nub, intersect )

input :: String
input = $(embedFile "2020/06/input.txt")

unlines' :: [String] -> String
unlines' [] = []
unlines' (l:ls) = l ++ (case l of
  [] -> '\n'
  _  -> ' ') : unlines' ls

main :: IO ()
main = do
  let semiParsed = lines . unlines' $ lines input
  -- Part One
  print . sum $ fmap (length . filter (`elem` ['a'..'z']) . nub) semiParsed
  -- Part Two
  print . sum $ fmap (length . foldl1 intersect . words) semiParsed
