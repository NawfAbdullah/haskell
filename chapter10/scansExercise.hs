fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs
fibsN :: Int -> Integer
fibsN x = fibs !! x


-- 1. Modify your fibs function to only returb the first 20 fibonacci number

fibsTo :: Int -> [Integer]
fibsTo x = take x fibs 

-- 2. Modify fibs to return the Fibonacci numbers that are less than 100.
fibsLT100 :: [Integer]
fibsLT100 = takeWhile (< 100) fibs

-- write a functipn for factorial
facts = scanl (*) 1 [1..]