module Definitions where
import Test.QuickCheck
import Data.List.Ordered
-- checking to make sure quickCheck is working


-- > quickCheck prop_commutativeAdd
prop_commutativeAdd :: Integer -> Integer -> Bool
prop_commutativeAdd n m = n + m == m + n



data PlExpression = Var Variable | Con Const | Prd Predicate | R Predicate Const deriving (Eq,Show)
data Variable  = X | Y | Z deriving (Eq,Show)
data Const     = A | B | C deriving (Eq,Show)
data Predicate = P1 | P2 | P3 deriving (Eq,Show)


-- data Domain = Entz [Int] | ll Interpretation

-- data Interpretation =

data Domain = Entity Int | Event Int | Bottom deriving (Eq,Show)

-- assignmentFn :: PlExpression -> Domain
-- assignmentFn (Var x) = Entity 1


-- A sub-model (events, ents, prds, consts)

events = [Event 1, Event 2]
ents   = [Entity 1, Entity 2, Entity 3]
prds   = [Prd P1, Prd P2]
consts = [Con A, Con B, Con C]


-- denotation brackets
-- partial & ad hoc

ll :: PlExpression -> Domain
ll (Con A)  = Entity 1
ll (Con B)  = Entity 2
ll (Con C)  = Entity 3
ll (Prd P1) = Event 1
ll (Prd P2) = Event 2
ll _        = Bottom


-- what's my denotation? helpers

llEvent = isEventDenoting
isEventDenoting :: PlExpression -> Bool
isEventDenoting x =
  let events = [Event 1, Event 2]
    in ll x `elem` events

llEvents = areEventsDenotings
areEventsDenotings :: [PlExpression] -> Bool
areEventsDenotings xs = case xs of
  [] -> False
  _ -> filter llEvent xs == xs


llEnt = isEnt
isEnt :: PlExpression -> Bool
isEnt x =
  let ents = [Entity 1, Entity 2, Entity 3]
    in ll x `elem` ents

llEnts = areEnts
areEnts :: [PlExpression] -> Bool
areEnts xs = case xs of
  [] -> False
  _  -> filter isEnt xs == xs

prop_areEvents = llEvents

-- prop_eventsEvents :: [PLExpression] -> Boolaean | True iff every Prd _ expression is an Event _
-- prop_eventsEvents (Prd x) = ll (Prd x) == \y -> ($) Event y 1


-- ll (Prd x) = \y -> Event y
