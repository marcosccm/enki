module Main where

import Test.Framework (defaultMain, testGroup)

import Enki.Tests
import Enki.Parser.Tests

main :: IO ()
main = defaultMain groups
  where 
    groups = [ testGroup "Enki.Tests" Enki.Tests.tests
             , testGroup "Enki.Parser" Enki.Parser.Tests.tests ]

