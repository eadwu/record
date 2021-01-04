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

-- Complete the viralAdvertising function below.
viralAdvertising n = f 1 5 0
  where f day shared cumulative
          | day > n   = cumulative
          | otherwise = f (day+1) shared' cumulative'
          where
            liked' = shared `div` 2
            shared' = liked' * 3
            cumulative' = cumulative + liked'

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    n <- readLn :: IO Int

    let result = viralAdvertising n

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
