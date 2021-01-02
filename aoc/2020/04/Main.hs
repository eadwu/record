{-# LANGUAGE TemplateHaskell #-}

import EmbedIO

import Data.List ( isSuffixOf, isPrefixOf )

input :: String
input = $(embedFile "aoc/2020/04/input.txt")

unlines' :: [String] -> String
unlines' [] = []
unlines' (l:ls) = l ++ (case l of
  [] -> '\n'
  _ -> ' ') : unlines' ls

validate' :: (String, String) -> Bool
validate' (f,v) = case f of
  "byr" -> v' >= "1920" && v' <= "2002" && length v' == 4
  "iyr" -> v' >= "2010" && v' <= "2020" && length v' == 4
  "eyr" -> v' >= "2020" && v' <= "2030" && length v' == 4
  "hgt" -> ("in" `isSuffixOf` v' && v' >= "59in" && v' <= "76in") ||
           ("cm" `isSuffixOf` v' && v' >= "150cm" && v' <= "193cm")
  "hcl" -> "#" `isPrefixOf` v' && length v' == 7 && all (`elem` "0123456789abcdef") (tail v')
  "ecl" -> v' `elem` [ "amb", "blu", "brn", "gry", "grn", "hzl", "oth" ]
  "pid" -> length v' == 9 && all (`elem` "0123456789") v'
  "cid" -> True  -- doesn't matter
  _     -> False -- invalid field
  where v' = tail v

main :: IO ()
main = do
  let credentials = fmap (fmap (break (==':')) . words) $ lines . unlines' $ lines input
  -- Part One
  -- byr (Birth Year)
  -- iyr (Issue Year)
  -- eyr (Expiration Year)
  -- hgt (Height)
  -- hcl (Hair Color)
  -- ecl (Eye Color)
  -- pid (Passport ID)
  -- cid (Country ID)
  let filtered = filter (\x -> let x' = fmap fst x
                               in "byr" `elem` x' && "iyr" `elem` x' &&
                                  "eyr" `elem` x' && "hgt" `elem` x' &&
                                  "hcl" `elem` x' && "ecl" `elem` x' &&
                                  "pid" `elem` x') credentials
  print . length $ filtered
  -- Part 2
  -- byr (Birth Year) - four digits; at least 1920 and at most 2002.
  -- iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  -- eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  -- hgt (Height) - a number followed by either cm or in:
  --   If cm, the number must be at least 150 and at most 193.
  --   If in, the number must be at least 59 and at most 76.
  -- hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  -- ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  -- pid (Passport ID) - a nine-digit number, including leading zeroes.
  -- cid (Country ID) - ignored, missing or not.
  print . length $ filter (==True) $ fmap (and . fmap validate') filtered
