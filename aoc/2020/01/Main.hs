{-# LANGUAGE TemplateHaskell #-}

import EmbedIO

main :: IO ()
main = do
  -- <$> is fmap
  -- if using readFile, then it returns IO String
  -- in which case fmap allows lines to operate on the String of the IO String
  let fileLines = map (read :: String -> Int) . lines $ $(embedFile "aoc/2020/01/input.txt")
  -- Part 1
  print . head $ [ a * b | a <- fileLines, b <- fileLines, a + b == 2020 ]
  -- Part 2
  print . head $ [ a * b * c | a <- fileLines, b <- fileLines, c <- fileLines, a + b + c == 2020 ]
