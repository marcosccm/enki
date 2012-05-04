# Anki

## A Haskell Inference Engine

Enki is a haskell implementation for this [Ruby Quiz](http://rubyquiz.com/quiz37.html).
I am Haskell and FP noob, so I am using this exercise
to guide my studies. Improvements and suggestions are more 
then welcome

## The Rules (lifted from rubyquiz.com)

You should be able to teach your engine truths with the following inputs:

  All PLURAL-NOUN are PLURAL-NOUN
  No PLURAL-NOUN are PLURAL-NOUN
  Some PLURAL-NOUN are PLURAL-NOUN
  Some PLURAL-NOUN are not PLURAL-NOUN.

You should also be able to query your engine with the following questions:

  Are all PLURAL-NOUN PLURAL-NOUN?
  Are no PLURAL-NOUN PLURAL-NOUN?
  Are any PLURAL-NOUN PLURAL-NOUN?
  Are any PLURAL-NOUN not PLURAL-NOUN?
  Describe PLURAL-NOUN.
