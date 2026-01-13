-- write eq instances for the typeclass


--------------------------- 1 -------------------------
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where 
    (==) (TisAn a) (TisAn a') = a == a'

-------------------------- 2 --------------------------

data TwoIntegers = Two Integer Integer 

instance Eq TwoIntegers where 
    (==) (Two a b) (Two a' b') = (a == a') && (b == b')

------------------------- 3 ---------------------------

data StringOrInt = TisAnInt Int | TisAnString String

instance Eq StringOrInt where 
    (==)  (TisAnInt a) (TisAnInt b) = a == b
    (==)  (TisAnString a) (TisAnString b) = a == b
    (==)  (TisAnString _) (TisAnInt _) = False
    (==)  (TisAnInt _) (TisAnString _)  = False


----------------------- 4 ------------------------

data Pair a = Pair a a 
instance Eq a => Eq (Pair a) where 
    (==) (Pair a b) (Pair a' b') = (a == a') && (b == b')

--------------------- 5 -----------------------------
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq(Tuple a b) where
    (==) (Tuple a b) (Tuple a' b') = (a == a') && (b == b')

-------------------- 6 ------------------------------

data Which a = ThisOne a | ThatOne a

instance (Eq a) => Eq( Which a ) where
    (==) lhs rhs = valueOf lhs ==  valueOf rhs
        where
            valueOf (ThisOne a) = a 
            valueOf (ThatOne a) = a 


------------------------ 7 ------------------------
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello y) = x == y
    (==) (Goodbye x) (Goodbye y) = x == y
    (==) _ _ = False