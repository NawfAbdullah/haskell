-- Data.Char
import Data.Char
-- 1. what are the types of isUpper and toUpper
-- isUpper:: Char -> Bool
-- toUpper:: Char -> Char 

-- 2. write a function that returns only the uppercase
-- filterUpper x = filter isUpper x

-- 3.function that capitalized first Letter
-- makeUpper (x:xs) = toUpper x : xs 

-- 4. write a function that capitalizes all letters
makeAllUpper "" = ""
makeAllUpper (x:xs) = toUpper x : makeAllUpper xs

--5. write a function that return only the return the first letter capitalizes
makeOnlyUpper (x:xs) = toUpper x     

-- 6. rewrite it as composed function 
makeOnlyUpper' "" = ""
makeOnlyUpper' x = (toUpper.head) x     
