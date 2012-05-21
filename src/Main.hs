module Main where

import System.Environment
import System.IO
import Data.List
import Enki.Parser

main :: IO ()
main = do
  putStr "> "
  hFlush stdout
  entry <- getLine
  let parsedEntry = parseEntry entry
  putStrLn parsedEntry
  main 
