module Main
( main ) where
  import System.IO ( readFile )

  main :: IO ()
  main = do
    fileLines <- map (read :: String -> Int) . lines <$> readFile "input.txt" -- <$> = fmap (Functor map)
    -- Part 1
    print . head $ [ a * b | a <- fileLines, b <- fileLines, a + b == 2020 ]
    -- Part 2
    print . head $ [ a * b * c | a <- fileLines, b <- fileLines, c <- fileLines, a + b + c == 2020 ]
