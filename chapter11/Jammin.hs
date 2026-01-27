module Jammin where 
import Data.List
import Data.Function
data Fruit =
    Peach
    | Plum
    | Apple
    | Blackberry
    deriving (Eq, Show,Ord)
data JamJars =
    Jam Fruit Int
    deriving (Eq, Show)


-- 1. create module
-- one the top

-- 2. rewrite JamJars with record syntax
data JamJars' = 
    Jam' { fruit :: Fruit
        ,   qty :: Int } 
        deriving (Eq, Show, Ord)

-- 3. What is the cardinality of JamJars?
-- 4 x 256 = 1024

-- 4. Add ord instance of the deriving clause
-- Done
 
-- 5.  
row1 = Jam' Peach 10
row2 = Jam' Apple 15
row3 = Jam' Peach 10
row4 = Jam' Peach 10
row5 = Jam' Peach 10
row6 = Jam' Peach 10
allJam = [row1, row2, row3, row4, row5, row6]
-- 5. map it into numbers
qtys = map (\x -> qty x) allJam 


-- 6. write a function that gives total number
total::[JamJars'] -> Int 
total = foldr (\inp acc -> qty inp+acc) 0 

-- 7. write a function that gives the most qty
mostRow::[JamJars'] -> JamJars'
mostRow = foldr (\inp acc -> if qty acc > qty inp then acc else inp) (Jam' Peach 0) 


-- 8. import sortby or groupby
sorted :: [JamJars']
sorted = sortBy (\x y -> compare (qty x) (qty y)) allJam

--9. sort by first field
sortedF :: [JamJars']
sortedF = sortBy (\x y -> compare (fruit x) (fruit y)) allJam

-- 10. Group the jars by fruitname
groupedJars = groupBy ((==) `on` fruit) sorted
