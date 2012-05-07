module Enki ( 
  Noun,
  RuleType (..),
  Rule (..),
  Question (..),
  Answer,
  Relation,
  makeQuestion
) where

import Data.Maybe
import Data.List

type Noun = String
data RuleType = All | None | Some deriving (Show, Eq, Ord)
data Rule = Rule Noun RuleType deriving (Show, Eq)
data Question = Question Noun Noun RuleType deriving (Show, Eq)

type Answer = Bool
type Relation = (Noun, [Rule])

makeQuestion :: Question -> [Relation] -> Answer
makeQuestion (Question n1 n2 rtype) graph
    | rule /= Nothing && rtype <= (ruleType rule) = True
    | otherwise                              = False
    where rule = extractRule n1 n2 graph
          ruleType (Just (Rule _ r)) = r

extractRule :: Noun -> Noun -> [Relation] -> Maybe Rule
extractRule target origin graph = find hasTarget rules
  where hasTarget x = target == (nounFor x)
        rules = (reachbleRules origin graph)

reachbleRules :: Noun -> [Relation] -> [Rule]
reachbleRules target graph  = dfs (rulesFor target graph)  graph

nounFor :: Rule -> Noun
nounFor (Rule n _) = n

ruleTypeFor :: Rule -> RuleType
ruleTypeFor (Rule _ r) = r

rulesFor :: Noun -> [Relation] -> [Rule]
rulesFor noun graph = fromMaybe [] $ lookup noun graph

dfs :: [Rule] -> [Relation] -> [Rule]
dfs start graph = visit start []
  where visit [] visited = visited
        visit (x:xs) visited
          | elem x visited = visit xs visited
          | otherwise      = visit (adjacents ++ xs) (x:visited)
          where
            adjacents = rulesFor (nounFor x) graph

