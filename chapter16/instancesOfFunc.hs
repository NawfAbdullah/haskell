--------------------------------------- 1 --------------------------------------
newtype Identity a = Identity a
instance Functor Identity where 
    fmap f (Identity a) = Identity (f a)

--------------------------------------- 2 --------------------------------------

data Pair a = Pair a a
instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)    

--------------------------------------- 3 --------------------------------------

data Two a b = Two a b  
instance Functor (Two a)  where
    fmap f (Two x y) = Two  x (f y)  

--------------------------------------- 4 --------------------------------------
data Three a b c = Three a b c
instance Functor (Three a b) where
    fmap f (Three x y z) = Three x y (f z)

--------------------------------------- 5 --------------------------------------
data Three' a b = Three' a b b
instance Functor (Three' a) where
    fmap f (Three' x y z) = Three' x (f y) (f z)    

------------------------- 6 --------------------------------------
data Four' a b c d = Four a b c d
instance Functor (Four' a b c) where
    fmap f (Four x y z w) = Four x y z (f w)

-------------------------- 7 --------------------------------------
data Trivial = Trivial

---- we can't since whe can't make a Functor instance for a type constructor of kind *