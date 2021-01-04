{-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Data.Text
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

-- Complete the superReducedString function below
superReducedString x
  | reduced == reduced' = case reduced of
    [] -> "Empty String"
    _  -> reduced
  | otherwise           = superReducedString reduced'
  where
    f = fmap Data.List.head . Data.List.filter (\x -> Data.List.length x `mod` 2 == 1) . Data.List.group
    reduced = f x
    reduced' = f reduced

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    s <- getLine

    let result = superReducedString s

    hPutStrLn fptr result

    hFlush fptr
    hClose fptr
