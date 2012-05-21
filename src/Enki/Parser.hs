module Enki.Parser where

import Enki

parseEntry :: String -> String
parseEntry entry
    | entry `beginsWith` quantifiers = show $ parseProperty entry
    | entry `beginsWith` questions   = show $ parseQuestion entry
    | otherwise                      = "WTF!?"
    where
      beginsWith entry xs = any (`isPrefixOf` entry) xs
      quantifiers = ["all", "some", "any", "none"]
      questions   = ["are"]

parseQuestion :: String -> Question
parseQuestion text = Question subj adj quantifier
  where components = words text
        subj       = components !! 2
        adj        = init $ components !! 3
        quantifier = parseQuantifier $ components !! 1

parseProperty :: String -> Property
parseProperty propertyText = Property subj adj quantifier
  where components = words propertyText
        subj       = components !! 1
        adj        = components !! 3
        quantifier = parseQuantifier $ components !! 0

parseQuantifier :: String -> Quantifier
parseQuantifier "all"  = All
parseQuantifier "some" = Some
parseQuantifier "any"  = Some
parseQuantifier "none" = None
parseQuantifier "no"   = None
parseQuantifier _      = error "Unknown quantifier"

