-- 1. Which (two or more) of the following are equivalent?
-- a) mTh x y z = x * y * z
-- b) mTh x y = \z -> x * y * z
-- c) mTh x = \y -> \z -> x * y * z
-- d) mTh = \x -> \y -> \z -> x * y * z

-- a b c d are all equivalent

-- 2. The type of mTh (above) is Num a => a -> a -> a -> a. Which is the type of mTh 3?
-- d) Num a => a -> a -> a

-- 3. lambda syntax practices
-- a) rewrite the function in the where clause
addOneIfOdd n = case odd n of
True -> f n
False -> n
where f n = n + 1

addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

-- b) Rewrite the following to use anonymous lambda syntax 
addFive x y = (if x > y then y else x) + 5
let addFive = \x -> \y -> (if x >y then y else x) + 5

-- c) Rewrite the following so that it doesn’t use anonymous lambda syntax:
mflip f = \x -> \y -> f y x
mflip f x y = f y x