data Constant a b = Constant a

instance Foldable (Constant a) where 
    foldr _ acc _ = acc 
    foldl _ acc _ = acc
    
    foldMap _ _ = mempty 

data Two a b = Two a b

instance Foldable (Two a) where 
    foldr f acc (Two a b) = f b acc 
    foldl f acc (Two a b) = f acc b 
    foldMap f (Two a b) = f b 


data Three a b c = Three a b c

instance Foldable (Three a b) where 
    foldr f acc (Three a b c) = f c acc
    foldl f acc (Three a b c) = f acc c 
    foldMap f (Three a b c) = f c  

data Three' a b = Three' a b b

instance Foldable (Three' a) where 
    foldr f acc (Three' a b c) = f b (f c acc)
    foldl f acc (Three' a b c) = f (f acc b) c
    foldMap f (Three' a b c) = f b <> f c  


data Four' a b =
    Four' a b b b

instance Foldable (Four' a) where 
    foldr f acc (Four' a b c d) = f b (f c (f d acc))
    foldl f acc (Four' a b c d) = f (f (f acc b) c ) d
    foldMap f (Four' a b c d) =  f b <> f c <> f d




filterF :: (Applicative f, Foldable t, Monoid (f a)) => (a -> Bool) -> t a -> f a
filterF f = foldMap (\x -> if f x then pure x else mempty) 
