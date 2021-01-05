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

-- Complete the circularArrayRotation function below.
circularArrayRotation a k queries = fmap (\i -> a !! ((start + i) `mod` length a)) queries
    where start = length a - (k `mod` length a)

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

    nkqTemp <- getLine
    let nkq = words nkqTemp

    let n = read (nkq !! 0) :: Int

    let k = read (nkq !! 1) :: Int

    let q = read (nkq !! 2) :: Int

    aTemp <- getLine

    let a = Data.List.map (read :: String -> Int) . words $ aTemp

    queriesTemp <- readMultipleLinesAsStringArray q
    let queries = Data.List.map (read :: String -> Int) queriesTemp

    let result = circularArrayRotation a k queries

    hPutStrLn fptr $ intercalate "\n" $ Data.List.map (\x -> show x) $ result

    hFlush fptr
    hClose fptr
