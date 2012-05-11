module Enki.Parser.Tests where

import Enki
import Enki.Parser
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.HUnit

tests = [ testCase "parses all property" parseAllProp
        , testCase "parses some property"  parseSomeProp
        , testCase "parses all quantifier"  parseAll 
        , testCase "parses some quantifier"  parseSome 
        , testCase "parses none quantifier"  parseNone ]

parseAllProp = Property "cats" "green" All @=? (parseProperty "all cats are green") 

parseSomeProp = Property "cats" "blue" Some @=? (parseProperty "some cats are blue") 

parseAll  = All  @=? (parseQuantifier "all")
parseSome = Some @=? (parseQuantifier "some")
parseNone = None @=? (parseQuantifier "none")
