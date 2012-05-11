module Enki.Parser.Tests where

import Enki
import Enki.Parser
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.HUnit

tests = [ testCase "parses an all property" parseAllProp
        , testCase "parses all quantifier"  parseAll 
        , testCase "parses some quantifier"  parseSome 
        , testCase "parses none quantifier"  parseNone ]

parseAllProp = Property "cats" "green" All @=? (parseProperty "all cats are green") 

parseAll  = All  @=? (parseQuantifier "all")
parseSome = Some @=? (parseQuantifier "some")
parseNone = None @=? (parseQuantifier "none")
