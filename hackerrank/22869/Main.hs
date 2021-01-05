{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.Char
import Data.List
import Data.List.Split
import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

-- Complete the designerPdfViewer function below.
designerPdfViewer h word = length word * height
    where height = maximum $ fmap (\x -> h !! (ord x - ord 'a')) word

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

    hTemp <- getLine

    let h = Data.List.map (read :: String -> Int) . words $ hTemp

    word <- getLine

    let result = designerPdfViewer h word

    hPutStrLn fptr $ show result

    hFlush fptr
    hClose fptr
