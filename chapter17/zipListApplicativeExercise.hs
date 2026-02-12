module ListApplicative where
import Main (z)

data List a = Nil | Cons a (List a) deriving (Eq, Show)

-- ==========================================
-- Part 1: Helper Functions
-- You will need these to implement the instances below.
-- ==========================================

append :: List a -> List a -> List a
append Nil ys = ys 
apppend (Cons f a) as = Cons f (append a as)

repeat' :: a -> List a
repeat' x = Cons x (repeat' x)

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _ = Nil
zipWith' _ _ Nil = Nil 
zipWith' f (Cons x xs) (Cons y ys) = Cons (f x y) (zipWith' f xs ys)
 
take' :: Int -> List a -> List a
take' n _ | n <= 0 = Nil
take' _ Nil        = Nil
take' n (Cons x xs) = Cons x (take' (n-1) xs)


instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
    pure a = Cons a Nil

    Nil <*> _ = Nil
    _ <*> Nil = Nil
    (Cons f fs) <*> xs = append (fmap f xs) (fs <*> xs)


newtype ZipList' a = ZipList' (List a) deriving (Eq, Show)

instance Functor ZipList' where
    fmap f (ZipList' xs) = ZipList' (fmap f xs)

instance Applicative ZipList' where
    pure x = ZipList' (repeat' x)

    -- <* > should use zipWith'
    (ZipList' fs) <*> (ZipList' xs) = ZipList' (zipWith' ($) fs xs)