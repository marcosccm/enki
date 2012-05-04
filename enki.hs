type Noun = String
data RuleType = All | None | Some deriving (Eq)
data Rule = Rule Noun Noun RuleType
type Question = Rule

filterRules :: [Rule] -> RuleType -> [Rule]
filterRules rules rtype = filter (isOfType) rules
    where isOfType (Rule _ _ t) =  t == rtype

hasRule :: Noun -> Noun -> [Rule] -> Bool
hasRule x y rules = any (isRule) rules
    where isRule (Rule n1 n2 _) =  n1 == x && n2 == y

makeQuestion :: Question -> [Rule] -> String
makeQuestion (Rule x y All) xs 
    | hasRule  x y alls = "Yes, all " ++ x ++ " are " ++ y
    | otherwise         = "No"
  where alls = filterRules xs All

makeQuestion (Rule x y None) xs 
    | hasRule  x y alls   = "No, all " ++ x ++ " are " ++ y
    | hasRule  x y somes  = "No, some " ++ x ++ " are " ++ y
    | otherwise        = "Yes, no " ++ x ++ " are " ++ y
  where alls = filterRules xs All
        somes = filterRules xs Some

makeQuestion (Rule x y Some) xs 
    | hasRule  x y somes = "Yes, some " ++ x ++ " are " ++ y
    | hasRule  x y alls  = "Yes, all " ++ x ++ " are " ++ y
    | otherwise        = "No"
  where alls = filterRules xs All
        somes = filterRules xs Some
