{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

-- Complete the hurdleRace function below.
hurdleRace k height
  | max > k   = max - k
  | otherwise = 0
  where max = maximum height

readMultipleLinesAsStringArray :: Int -> IO [String]
readMultipleLinesAsStringArray 0 = return []
readMultipleLinesAsStringArray n = do
    line <- getLine
    rest <- readMultipleLinesAsStringArray(n - 1)
    return (line : rest)

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    nkTemp <- getLine
    let nk = words nkTemp

    let n = read (nk !! 0) :: Int

    let k = read (nk !! 1) :: Int

    heightTemp <- getLine

    let height = Data.List.map (read :: String -> Int) . words $ heightTemp

    let result = hurdleRace k height

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
