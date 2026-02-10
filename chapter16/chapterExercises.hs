-- Determine if a valid Functor can be written for the datatype
-- 1. data Bool = False | True
-- No, because there is no type parameter to map

-- 2. data BoolAndSomethingElse a = False' a | True' a      
-- Yes, we can write a Functor instance as there is parameter 

-- 3. data BoolAndMaybeSomethingElse a = Falsish | Truesish a
-- Yes, we can write a Functor instance as there is parameter 

-- 4. data Mu f = InF { outF :: f (Mu f) }
-- No, because f is a higher irdered type

-- 5. data D = D (Array Word Word) Int Int
-- No, because there is no type parameter to map    


-- Rearrange the arguments to the type constructor of the datatype so the Functor instance works.

-- 1. data Sum a b = First a | Second b
data Sum b a = First a | Second b
instance Functor (Sum e) where
    fmap f (First a) = First (f a)
    fmap f (Second b) = Second b

-- 2. data Company a b c = DeepBlue a c | Something b
data Company c a b = DeepBlue a c | Something b

instance Functor (Company c a) where
    fmap f (Something b) = Something (f b)
    fmap f (DeepBlue a c) = DeepBlue a c

-- 3. data More a b = L a b a | R b a b

data More b a = L a b a | R b a b deriving (Eq, Show)

instance Functor (More x) where
    fmap f (L a b a') = L (f a) b (f a')
    fmap f (R b a b') = R b (f a) b'

-- Write Functor instances for the following datatypes.
--------------------------- 1 ---------------------------
data Quant a b = Finance | Desk a | Bloor b deriving (Eq, Show)
instance Functor (Quant a) where
    fmap f Finance = Finance
    fmap f (Desk a) = Desk a
    fmap f (Bloor b) = Bloor (f b)

--------------------------- 2 ---------------------------
data K a b = K a deriving (Eq, Show)

instance Functor (K a) where
    fmap f (K a) = K a

--------------------------- 3 ---------------------------
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
newtype K' a b = K' a

instance Functor (Flip K' a) where
    fmap f (Flip (K' a)) = Flip (K' (f a))

--------------------------- 4 ---------------------------
data EvilGoateeConst a b = GoatyConst b deriving (Eq, Show)

