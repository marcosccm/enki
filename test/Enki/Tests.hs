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
allCatsShouldBeAnimals = assertBool
  "all cats should be animals"
   (makeQuestion allCatsAreAnimals properties)
  
allCatsHaveFur = Question "cats" "fur" All
allCatsShouldHaveFur = assertBool
  "all cats should have fur"
   (makeQuestion allCatsHaveFur properties)

allCatsHaveEyes = Question "cats" "eyes" All
allCatsShouldHaveEyes = assertBool
  "all cats should have eyes"
   (makeQuestion allCatsHaveEyes properties)

allCatsAreGreen = Question "cats" "green" All
noCatShouldBeGreen = assertBool
  "no cat should be green"
   (not (makeQuestion allCatsAreGreen properties))

allAnimalsHaveFur = Question "animals" "fur" All
notAllAnimalsHaveFur = assertBool
  "not all animals have fur"
   (not (makeQuestion allAnimalsHaveFur properties))
