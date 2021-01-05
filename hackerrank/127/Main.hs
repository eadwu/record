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

-- Complete the findDigits function below.
findDigits n = length $ Data.List.filter (\x -> x /= 0 && n `mod` x == 0) digits
  where digits = fmap (\c -> (read :: String -> Int) [c]) $ show n

main :: IO()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    t <- readLn :: IO Int

    forM_ [1..t] $ \t_itr -> do
        n <- readLn :: IO Int

        let result = findDigits n

        hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
