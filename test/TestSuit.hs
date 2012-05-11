module Main where

import Test.Framework (defaultMain, testGroup)

import Enki.Tests

main :: IO ()
main = defaultMain tests
  where 
    tests = [ testGroup "Enki.Tests" Enki.Tests.tests ]

