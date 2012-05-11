module Enki.Parser where

import Enki

parseProperty :: String -> Property
parseProperty propertyText = Property subj adj quantifier
  where components = words propertyText
        subj       = components !! 1
        adj        = components !! 3
        quantifier = parseQuantifier $ components !! 0

parseQuantifier :: String -> Quantifier
parseQuantifier "all"  = All
parseQuantifier "some" = Some
parseQuantifier "none" = None
parseQuantifier _      = error "Unknown quantifier"

