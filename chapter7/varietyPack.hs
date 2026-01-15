-- 1. Given the following declarations

k (x, y) = x
k1 = k ((4-1),10)
k2 = k ("Three",(1 + 2))
k3 = k (3, True)

-- a) What is the tyoe if k ?
k :: (a, b) -> a 

-- b)Type of k3 is Integer, k1 is Integer and k3 is Bool

-- c) k2  

-- 2) fill the function

f :: (a,b,c) -> (d,e,f) -> ((a,d),(c,f))
f = (a, _ , c) (d, _ , f) = ((a,d),(c,f))