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

-- Complete the hourglassSum function below.
hourglassSum arr = maximum [ hourglass' x y | x <- [0..n], y <- [0..n] ]
  where
    n = length arr - 3
    hourglass' x y = arr !! (x+1) !! (y+1) + sum [ arr !! x' !! y' | x' <- [x,x+2], y' <- [y,y+1,y+2] ]

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

    arrTemp <- readMultipleLinesAsStringArray 6
    let arr = Data.List.map (\x -> Data.List.map (read :: String -> Int) . words $ x) arrTemp

    let result = hourglassSum arr

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
