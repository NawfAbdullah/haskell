awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

-- 1. type signature of length, how many arguments it takes?, what is the return type
-- length :: Foldable t => t a -> Int
-- only one argument it gets
--  it evaluates to int

-- 2. evaluate the results of expression
--    a) length [1, 2, 3, 4, 5] -> 5
--    b) length [(1,2), (2,3), (3,4)] -> 3
--    c) length allAwesome -> 2
--    d) length (concat allAwesome) -> 5

-- 3. determine which will return error and why
-- 6/3 or 6 / length [1, 2, 3]
-- 6 / length [1, 2, 3] as the haskell language read the expression from left to right it attempts to divide 6 by length 

-- 4. how to fix the error in previous expression
-- 6 / (length [1, 2, 3])

-- 5. what will be the result? 2 + 3 == 5
-- True

-- 6. what is the type and expected result value for 
-- let x = 5
-- x + 3 == 5
-- Ans: True

-- 7. determine whether the code bits work or not
-- a) length allAwesome == 2 -> True (will work)
-- b) length [1, 'a', 3, 'b'] -> won't work as they are off different data types
-- c) length allAwesome + length awesome -> 5 (will work)
-- d) (8 == 8) && ("b"<"a") -> False (will work)
-- e) (8 == 8) && 9 -> (will not work as 9 is integer)

-- 8. wite a functions to determine whether the giveb sequence is palindrome

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = (x == reverse x)

-- 9. write a function to return the absolute value of a number using if-then-else 

myAbs :: Integer -> Integer
myAbs  x = if x < 0 then (-x) else x


-- 10. write a function to f :: (a, b) -> ((b,d),(a,c))
f  x, y = ((snd x, snd y), (fst x, fst y))