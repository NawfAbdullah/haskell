data Woot = Woot 
data Blah = Blah
f :: Woot -> Blah 
f x = Blah

g :: (Blah, Woot) -> (Blah, Blah)
g (b, w) = (b, f w)


----------- 1.--------------
f :: Int -> String 
f = undefined

g :: String -> Char 
g = undefined

h :: Int -> Char 
h x = g (f x)



---------- 2. --------------------

data A = A 
data B = B 
data C = C 

q :: A -> B 
q = undefined

w :: B -> C 
w = undefined 

e :: A -> C 
e x =  w(q x)


------- 3 -------------

data X = X 
data Y = Y 
data Z = Z 

xz  :: X -> Z 
xz = undefined 

yz :: Y -> Z 
yz = undefined 

xform :: (X, Y) -> (Z, Z)
xform (a, b) = (xz a, yz b)

--------- 4 ------------
munge :: (x -> y) -> (y -> (w,z)) -> x -> w 
munge a b c = fst (b (a c))