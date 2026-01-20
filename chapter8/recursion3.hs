f :: (Eq a, Num a) => a -> a -> a 

f a b = go a b 0
        where go a b r
                | b == 0 = r 
                | otherwise = go a (b - 1) (r + a)