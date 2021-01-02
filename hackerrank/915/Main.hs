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

-- Complete the lonelyinteger function below.
-- Not quite O(n log n + n), uses far more space and extra O(n)
lonelyinteger = head . head . Data.List.filter (\x -> length x == 1) . group . sort

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

    n <- readLn :: IO Int

    aTemp <- getLine

    let a = Data.List.map (read :: String -> Int) . words $ aTemp

    let result = lonelyinteger a

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
