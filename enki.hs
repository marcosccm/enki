type Noun = String
data RuleType = All | None | Some
data Rule = Rule Noun Noun RuleType
type Question = Rule

hasRule :: Noun -> Noun -> [Rule] -> Bool
hasRule x y rules = any (isRule) rules
    where isRule (Rule n1 n2 _) =  n1 == x && n2 == y

makeQuestion :: Question -> [Rule] -> String
makeQuestion (Rule x y All) xs 
    | hasRule  x y xs  = "Yes, all " ++ x ++ " are " ++ y
    | otherwise        = "No"


