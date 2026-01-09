-- 1. 
-- x = (+)
-- F xs = w 'x' 1
--  where w = length xs

x = (+)
f xs = x w  1
  where w = length xs

-- 2. \ X = x
\x -> x 


-- 3. after fixed this function should return 1 from [1,2,3] \x : x s -> x
-- \(x:xs) -> x

-- 4. When fixed, this function will return 1 from the value (1, 2).
-- f (a b) = A
-- ans: f (a,b) = a
