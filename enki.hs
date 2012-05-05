type Noun = String
data RuleType = All | None | Some deriving (Show, Eq)
data Rule = Rule Noun RuleType deriving (Show, Eq)

type Relation = (Noun, [Rule])
type Question = Rule

reachbleRules :: [Relation] -> Noun -> [Rule]
reachbleRules graph target  = dfs (rulesFor target graph)  graph

nounFor :: Rule -> Noun
nounFor (Rule n _) = n

rulesFor :: Noun -> [Relation] -> [Rule]
rulesFor noun graph = extract $ lookup noun graph
  where extract (Just r) = r
        extract Nothing  = []

dfs :: [Rule] -> [Relation] -> [Rule]
dfs start graph = visit start []
  where visit [] visited = visited
        visit (x:xs) visited
          | elem x visited = visit xs visited
          | otherwise      = visit (adjacents ++ xs) (x:visited)
          where
            adjacents = rulesFor (nounFor x) graph

