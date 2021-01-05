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

-- Complete the beautifulDays function below.
beautifulDays i j k = length $ Data.List.filter (\i' -> beauti' i' `mod` k == 0) [i..j]
  where beauti' n = abs $ n - ((read :: String -> Int) $ reverse $ show n)

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    ijkTemp <- getLine
    let ijk = words ijkTemp

    let i = read (ijk !! 0) :: Int

    let j = read (ijk !! 1) :: Int

    let k = read (ijk !! 2) :: Int

    let result = beautifulDays i j k

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
