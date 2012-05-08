module Enki_Test where

import Enki 
import Test.HUnit

p1 = Property "cats" "animals" All
p2 = Property "cats" "fur" All
p3 = Property "animals" "eyes" All
properties = [p1,p2,p3]

allCatsAreAnimals = Question "cats" "animals" All
allCatsShouldBeAnimals = TestCase $ assertBool
  "all cats should be animals"
   (makeQuestion allCatsAreAnimals properties)
  
allCatsHaveFur = Question "cats" "fur" All
allCatsShouldHaveFur = TestCase $ assertBool
  "all cats should have fur"
   (makeQuestion allCatsHaveFur properties)

allCatsHaveEyes = Question "cats" "eyes" All
allCatsShouldHaveEyes = TestCase $ assertBool
  "all cats should have eyes"
   (makeQuestion allCatsHaveEyes properties)

allCatsAreGreen = Question "cats" "green" All
noCatShouldBeGreen = TestCase $ assertBool
  "no cat should be green"
   (not (makeQuestion allCatsAreGreen properties))

allAnimalsHaveFur = Question "animals" "fur" All
notAllAnimalsHaveFur = TestCase $ assertBool
  "not all animals have fur"
   (not (makeQuestion allAnimalsHaveFur properties))

suite = TestList [allCatsShouldBeAnimals, allCatsShouldHaveFur, allCatsShouldHaveEyes, noCatShouldBeGreen, notAllAnimalsHaveFur]

main = runTestTT suite
