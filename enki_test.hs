module Enki_Test where

import Enki 
import Test.HUnit

assertSanity = TestCase $ assertEqual "true should be... true" True True

main = runTestTT assertSanity
