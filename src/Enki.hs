module Enki ( 
  Subject,
  Adjective,
  Quantifier (..),
  Property (..),
  Question (..),
  Answer,
  makeQuestion
) where

import Data.Maybe
import Data.List

type Subject = String
type Adjective = String
data Quantifier = All | None | Some deriving (Show, Eq, Ord)
data Property = Property { subject :: Subject, adjective :: Adjective, quantifier :: Quantifier } deriving (Show, Eq) 
data Question = Question Subject Adjective Quantifier deriving (Show, Eq)
type Answer = Bool

makeQuestion :: Question -> [Property] -> Answer
makeQuestion question graph = question `isAnsweredBy` foundProperty
  where foundProperty = findProperty question graph

findProperty :: Question -> [Property] -> Maybe Property
findProperty (Question subj adj _) graph = find (hasAdjective adj) rules
  where rules = (dfs subj graph)

dfs :: Subject -> [Property] -> [Property]
dfs subj graph = visit (rulesFor subj graph) []
  where visit [] visited = visited
        visit (x:xs) visited
          | elem x visited = visit xs visited
          | otherwise      = visit (adjacents ++ xs) (x:visited)
          where
            adjacents = (rulesFor (adjective x) graph)

rulesFor :: Subject -> [Property] -> [Property]
rulesFor subj graph = filter (hasSubject subj) graph

hasSubject :: Subject -> Property -> Bool
hasSubject target x = target == (subject x)

hasAdjective :: Adjective -> Property -> Bool
hasAdjective target x = target == (adjective x)

isAnsweredBy :: Question -> Maybe Property -> Bool
isAnsweredBy _ Nothing = False
isAnsweredBy (Question _ _ q) (Just property)  = q <= (quantifier property)
