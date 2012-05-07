module Enki_Test where

import Enki 
import Test.HUnit

rule1 = Rule "fur" All
rule2 = Rule "animals" All

rule3 = Rule "eyes" All

rel1 = ("animals", [rule3])
rel2 = ("cats", [rule1, rule2])

allCatsShouldBeAnimais = TestCase $ assertBool
  "all cats should be animals"
   (rule2 `elem` (reachbleRules "cats" [rel1, rel2]))
  
allCatsShouldHaveFur = TestCase $ assertBool
  "all cats should have fur"
   (rule1 `elem` (reachbleRules "cats" [rel1, rel2]))

allCatsShouldHaveEyes = TestCase $ assertBool
  "all cats should have eyes"
   (rule3 `elem` (reachbleRules "cats" [rel1, rel2]))

suite = TestList [allCatsShouldBeAnimais, allCatsShouldHaveFur, allCatsShouldHaveEyes]
main = runTestTT suite
