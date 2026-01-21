-- 1. Will the following expression return a value or be ⊥?
-- take 1 $ map (+1) [undefined, 2, 3]
-- Prelude.undefined

-- 2. Will the following expression return a value?
-- take 1 $ map (+1) [1, undefined, 3]
-- [2]

-- 3. take 2 $ map (+1) [1, undefined, 3]
-- Prelude.undefined

-- 4. itIsMystery xs = map (\x -> elem x "aeiou") xs
-- it will return a List of Bool whether the particular value is a vowel

-- 5. what will be the result of the following functions
-- a) map (^2) [1..10]
--     [1,4,9,16,25,36,47,64,81,100]
-- b) map minimum [[1..10], [10..20], [20..30]]
--     [1,10,20]
-- c) map sum [[1..5], [1..5], [1..5]]
--     [15,15,15]

-- 6. 
import Data.Bool 
map (\x -> bool (x+1) x ((rem x 2) == 0)) [1,2,3,4,5,6,7,8,9]