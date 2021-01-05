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

-- Complete the fibonacciModified function below.
fibonacciModified t1 t2 n = fib' n
  where
    fib' 1 = t1
    fib' 2 = t2
    fib' n = (fib' $ n - 2) + (fib' $ n - 1) ^ 2

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    t1T2nTemp <- getLine
    let t1T2n = words t1T2nTemp

    let t1 = read (t1T2n !! 0) :: Integer

    let t2 = read (t1T2n !! 1) :: Integer

    let n = read (t1T2n !! 2) :: Integer

    let result = fibonacciModified t1 t2 n

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
