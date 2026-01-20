f :: (Integral a) => a -> a
f 0 = 0 
f 1 = 1
f x = (f (x-2)) + (f (x-1))