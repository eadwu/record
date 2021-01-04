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

-- Complete the extraLongFactorials function below.
extraLongFactorials :: Integer -> Integer
extraLongFactorials 1 = 1
extraLongFactorials n = n * extraLongFactorials (n - 1)

main :: IO()
main = do
    n <- readLn :: IO Integer

    print $ extraLongFactorials n
