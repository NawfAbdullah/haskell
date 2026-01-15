avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x  
    | y >= 0.7 = 'C'
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where y = x / 100

-- 1. otherwise should be written in the last as otherwise will be overwritten by values after everything will return F 
-- 2. moving | y >= 0.7 = "C"
--      any value above 0.7 is taken as "C" amd it's executed first so the compiler will not check other statements after executions

--3. which of the following will return

pal xs
    | xs == reverse xs = True
    | otherwise        = False

-- b) True when xs is a palindrome

-- 4. what types of a argument pal can take?
-- [a]

-- 5. what is the type of pal? 
-- pal :: a=>[a] -> Bool

-- 6. which of the function returns 
numbers x 
    | x < 0 = -1 
    | x == 0 = 0
    | x > 0 = 1
-- c) an indication of whether its argument is a positive or negative number or zero

-- 7. Num
-- 8. (Num a, Ord a, Num b) => a -> b 

