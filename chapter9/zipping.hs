-- write your own version of zip
myZip :: [a] -> [b] -> [(a,b)]


myZip (x:xs) (y:ys) = (x,y) : myZip xs ys 
myZip _ _ = []

-- write your own myZipWith
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f (x:xs) (y:ys) = (f x y) : myZipWith f xs ys 
myZipWith _ _ _ = []
