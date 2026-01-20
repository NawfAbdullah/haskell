f :: (Eq a, Num a) => a -> a 
f 1 = 1
f n = n + f (n-1) 