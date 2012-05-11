module Enki.Tests where

import Enki 
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.HUnit

tests = [ testCase "all cats are animals" allCatsShouldBeAnimals
        , testCase "all cats have fur" allCatsShouldHaveFur
        , testCase "all cats have eyes" allCatsShouldHaveEyes
        , testCase "no cats is green" noCatShouldBeGreen
        , testCase "not all animals have fur" notAllAnimalsHaveFur]

p1 = Property "cats" "animals" All
p2 = Property "cats" "fur" All
p3 = Property "animals" "eyes" All
properties = [p1,p2,p3]

allCatsAreAnimals = Question "cats" "animals" All
allCatsShouldBeAnimals = (makeQuestion allCatsAreAnimals properties) @=? True
  
allCatsHaveFur = Question "cats" "fur" All
allCatsShouldHaveFur = (makeQuestion allCatsHaveFur properties) @=? True

allCatsHaveEyes = Question "cats" "eyes" All
allCatsShouldHaveEyes = (makeQuestion allCatsHaveEyes properties) @=? True

allCatsAreGreen = Question "cats" "green" All
noCatShouldBeGreen = (makeQuestion allCatsAreGreen properties) @=? False

allAnimalsHaveFur = Question "animals" "fur" All
notAllAnimalsHaveFur = (makeQuestion allAnimalsHaveFur properties) @=? False
