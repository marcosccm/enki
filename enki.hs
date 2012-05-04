type Noun = String
data RuleType = All | None | Some
data Rule = Rule Noun Noun RuleType
type Question = Rule

addRule :: Rule -> [Rule]

makeQuestion :: Question -> String


