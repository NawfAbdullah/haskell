import GHC.IO.Handle.Text (memcpy)
import Control.Applicative (Alternative(empty))
import Control.Applicative (liftA3)

--- Identify the types

-- 1. 
-- []
-- pure :: a -> ? a 
-- (<*>) :: ?  (a -> b) -> ? a -> ? b

-- pure :: a -> [a] 
-- (<*>) :: (a -> b) -> [a] -> [b]

-- 2.
-- IO
-- -- Methods
-- pure :: a -> IO a
-- (<*>) :: IO (a -> b) -> IO a -> IO b


-- 3. -- Type
-- (,) a
-- -- Methods
-- pure :: a -> (e,a)
-- (<*>) :: (e,a -> b) -> (e,a) -> (e,b)



-- -- 4. Function
-- -- f = (->) e  (which means `e ->`)

-- pure :: a -> (e -> a)
-- (<*>) :: (e -> a -> b) -> (e -> a) -> (e -> b)




-- Write applicative instances for the following datatype


------------------------------- 1 ----------------------------------

newtype Identity a = Identity a deriving Show 

instance Functor Identity where 
    fmap f (Identity a) = Identity (f a )

instance Applicative Identity where 
    pure = Identity
    (<*>) (Identity f) (Identity a) = Identity (f a)


------------------------------- 2 ------------------------------------

data Pair a = Pair a a deriving Show 

instance Functor Pair where 
    fmap f (Pair a b) = Pair (f a) (f b)

instance Applicative Pair where 
    pure a = Pair a a 
    (<*>) (Pair f g) (Pair a b) = Pair (f a) (g b)


------------------------------- 3 --------------------------------------

data Two a b = Two a b 

instance Functor (Two a) where 
    fmap f (Two a b) = Two a (f b)

instance Monoid a =>  Applicative (Two a) where
    pure x = Two mempty x 
    (<*>) (Two f g) (Two a b) = Two (f<>a) (g b) 


------------------------------ 4 ---------------------------------------

data Three a b c = Three a b c

instance Functor (Three a b) where 
    fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where 
    pure a = Three mempty mempty a
    (<*>) (Three a b f) (Three c d x) = Three (a<>c) (b<>d) (f x)


---------------------------- 5 ----------------------------------------

data Three' a b = Three' a b b

instance Functor (Three' a) where 
    fmap f (Three' a b c) = Three' a (f b) (f c)

instance Monoid a => Applicative (Three' a) where
    pure a = Three' mempty a a
    (<*>) (Three' a f g) (Three' b x y) = Three' (a<>b) (f x) (g y) 

----------------------------- 6 ---------------------------------------
data Four a b c d = Four a b c d    
instance Functor (Four a b c) where 
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure a = Four mempty mempty mempty a
    (<*>) (Four a b c f) (Four d e g x) = Four (a<>d) (b<>e) (c<>g) (f x)       

----------------------------- 7 ---------------------------------------
data Four' a b = Four' a a a b
instance Functor (Four' a) where 
    fmap f (Four' a b c d) = Four' a a a (f d)

instance Monoid a => Applicative (Four' a) where
    pure a = Four' mempty mempty mempty a
    (<*>) (Four' a f g h) (Four' b x y z) = Four' (a<>b) (f<>x) (g<>y) (h z)



---Combinations

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)
