module Definitions where
import Test.QuickCheck
import Data.List.Ordered
-- checking to make sure quickCheck is working


-- > quickCheck prop_commutativeAdd
prop_commutativeAdd :: Integer -> Integer -> Bool
prop_commutativeAdd n m = n + m == m + n



data PLExpression = Var Variable | Con Const | Prd Predicate | R Predicate Const deriving (Eq,Show)
data Variable  = X | Y | Z deriving (Eq,Show)
data Const     = A | B | C deriving (Eq,Show)
data Predicate = P1 | P2 | P3 deriving (Eq,Show)


-- data Domain = Entz [Int] | DoubleBrackets Interpretation

-- data Interpretation =

data Domain = Entity Int | Event Int deriving (Eq,Show)


assignmentFn :: PLExpression -> Domain
assignmentFn (Var x) = Entity 1

intendedInterpretation :: PLExpression -> Domain
intendedInterpretation (Con A)  = Entity 1
intendedInterpretation (Con B)  = Entity 2
intendedInterpretation (Con C)  = Entity 3
intendedInterpretation (Prd P1) = Event 1
intendedInterpretation (Prd P2) = Event 2

isEvent :: PLExpression -> Bool
isEvent x =
  let events = [Event 1, Event 2]
    in intendedInterpretation x `elem` events

areEvents [x] = filter isEvent [x]

-- isEventEvents :: [PLExpression] -> Bool
-- isEventEvents xs = let events = [Event 1, Event 2]
--                             in filter (\z -> (z `elem` events)) xs == []       -- not written in the most declarative way
                            --
                            -- (map intendedInterpretation xs) `subset` events
  -- not (intendedInterpretation `  ` `elem` [(Entity 1), (Entity 2)])

--elem
-- QUICKCHECK TIME
-- prop_eventsEvents :: [PLExpression] -> Boolaean | True iff every Prd _ expression is an Event _
-- prop_eventsEvents (Prd x) = intendedInterpretation (Prd x) == \y -> ($) Event y 1


-- intendedInterpretation (Prd x) = \y -> Event y
