data List a = Nil | Cons a (List a) deriving (Eq, Show)

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)

instance Functor List where 
    fmap _ Nil = Nil 
    fmap f (Cons a as) = Cons (f a) (fmap f as)

instance Applicative List where
    pure a = Cons a Nil 
    (<*>) Nil b = Nil
    (<*>) a Nil = Nil
    (<*>) (Cons f fs) as = append (fmap f as) (fs <*> as)
