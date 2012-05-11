module Main where

import Test.Framework (defaultMain, testGroup)

import qualified Enki.Tests

main :: IO ()
main = print "foooo" >>= defaultMain tests
  where 
    tests = [ testGroup "Enki.Tests" Enki.Tests.tests ]

