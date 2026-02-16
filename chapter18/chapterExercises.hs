import Data.Monoid (Ap)
import Control.Monad (ap)
------------ write monads for the following datatypes.

------------------------------- 1 ----------------------------------
data Nope a =
    NopeDotJpg

instance Functor Nope where
    fmap _ _ = NopeDotJpg

instance Applicative Nope where
    pure _ = NopeDotJpg
    (<*>) _ _ = NopeDotJpg

instance Monad Nope where
    return = pure
    (>>=) _ _ = NopeDotJpg

------------------------------- 2 ----------------------------------
data PhhhbbtttEither b a =
    Left' a
    | Right' b
    deriving (Eq, Show)

instance Functor (PhhhbbtttEither b) where
    fmap f (Left' a) = Left' (f a)
    fmap _ (Right' b) = Right' b

instance Applicative (PhhhbbtttEither b) where
    pure = Left'
    (<*>) (Left' f) (Left' a) = Left' (f a)
    (<*>) (Right' b) _ = Right' b
    (<*>) _ (Right' b) = Right' b

instance Monad (PhhhbbtttEither b) where
    return = pure
    (>>=) (Left' a) f = f a 
    (>>=) (Right' b) _ = Right' b


------------------------------- 3 ----------------------------------

newtype Identity a = Identity a
    deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity (f a)

instance Applicative Identity where
    pure = Identity
    (<*>) (Identity f) (Identity a) = Identity (f a)

instance Monad Identity where
    return = pure
    (>>=) (Identity a) f = f a 


------------------------------- 4 ----------------------------------
data List a =
    Nil
    | Cons a (List a)
    deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)  

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)

instance Applicative List where
    pure a = Cons a Nil
    (<*>) Nil _ = Nil
    (<*>) _ Nil = Nil
    (<*>) (Cons f fs) as = append (fmap f as) (fs <*> as)

instance Monad List where
    return = pure
    (>>=) Nil _ = Nil
    (>>=) (Cons a as) f = append (f a) (as >>= f)


---------- write the following functions using methods from the Monad and functor typeclasses

j :: Monad m => m (m a) -> m a
j a = a >>= id


l1 :: Monad m => (a -> b) -> m a -> m b
l1 f a = fmap f a

l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 f a b = l1 f a <*> b

a :: Monad m => m a -> m (a -> b) -> m b
a v f = f <*> v


meh :: Monad m => [a] -> (a -> m b) -> m [b]
meh [] _ = return []
meh (x:xs) f = do 
    y <- f x 
    ys <- meh xs f 
    return (y:ys)

flipType :: Monad m => [m a] -> m [a]
flipType [] = return []
flipType (x:xs) = do 
    y <- x 
    ys <- flipType xs 
    return (y:ys)