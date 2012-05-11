module Enki.Parser.Tests where

import Enki
import Enki.Parser
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.HUnit

tests = [ testCase "parses an all property" parseAll ]

parseAll = (parseProperty "all cats are green") @=? Property "cats" "green" All
