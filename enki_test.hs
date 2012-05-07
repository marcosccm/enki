module Enki_Test where

import Enki 
import Test.HUnit

rule1 = Rule "fur" All
rule2 = Rule "animals" All

rule3 = Rule "eyes" All

rel1 = ("animals", [rule3])
rel2 = ("cats", [rule1, rule2])
relations = [rel1, rel2]

allCatsAreAnimals = Question "animals" "cats" All
allCatsShouldBeAnimals = TestCase $ assertBool
  "all cats should be animals"
   (makeQuestion allCatsAreAnimals relations)
  
allCatsHaveFur = Question "fur" "cats" All
allCatsShouldHaveFur = TestCase $ assertBool
  "all cats should have fur"
   (makeQuestion allCatsHaveFur relations)

allCatsHaveEyes = Question "eyes" "cats" All
allCatsShouldHaveEyes = TestCase $ assertBool
  "all cats should have eyes"
   (makeQuestion allCatsHaveEyes relations)

allCatsAreGreen = Question "green" "cats" All
noCatShouldBeGreen = TestCase $ assertBool
  "no cat should be green"
   (not (makeQuestion allCatsAreGreen relations))

allAnimalsHaveFur = Question "fur" "animals" All
notAllAnimalsHaveFur = TestCase $ assertBool
  "not all animals have fur"
   (not (makeQuestion allAnimalsHaveFur relations))

suite = TestList [allCatsShouldBeAnimals, allCatsShouldHaveFur, allCatsShouldHaveEyes, noCatShouldBeGreen, notAllAnimalsHaveFur]

main = runTestTT suite
