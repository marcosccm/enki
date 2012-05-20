module Enki.Parser.Tests where

import Enki
import Enki.Parser
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.HUnit

tests = [ testCase "parses ALL property" parseAllProp
        , testCase "parses SOME property"  parseSomeProp
        , testCase "parses ALL question" parseAllQuestion 
        , testCase "parses ANY question" parseAnyQuestion 
        , testCase "parses NONE question" parseNoneQuestion 
        , testCase "parses ALL quantifier"  parseAll 
        , testCase "parses SOME quantifier"  parseSome 
        , testCase "parses NONE quantifier"  parseNone ]

parseAllProp = Property "cats" "green" All @=? 
               (parseProperty "all cats are green") 

parseSomeProp = Property "cats" "blue" Some @=? 
                (parseProperty "some cats are blue") 

parseAllQuestion = Question "cats" "blue" All @=? 
                   (parseQuestion "Are all cats blue?") 

parseAnyQuestion = Question "cats" "blue" Some @=? 
                   (parseQuestion "Are any cats blue?") 

parseNoneQuestion = Question "cats" "blue" None @=? 
                    (parseQuestion "Are no cats blue?") 

parseAll  = All  @=? (parseQuantifier "all")
parseSome = Some @=? (parseQuantifier "some")
parseNone = None @=? (parseQuantifier "none")
