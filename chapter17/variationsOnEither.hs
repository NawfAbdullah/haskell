data Sum a b =
    First a
    | Second b
    deriving (Eq, Show)

data Validation e a =
    Error e
    | Success a
    deriving (Eq, Show)


instance Functor (Sum a) where
    fmap _ (First a) = First a
    fmap f (Second b) = Second (f b)

instance Applicative (Sum a) where
    pure = Second
    (<*>) (First e) _ = First e
    (<*>) _ (First e) = First e    
    (<*>) (Second a) (Second b) = Second (a b) 
    

instance Functor (Validation e) where
    fmap f (Success a) = Success (f a) 
    fmap f (Error b) = Error b

instance Monoid e => Applicative (Validation e) where
    pure = Success 
    (<*>) (Error a) (Error b)      = Error (a <> b)
    (<*>) _ (Error b)    = Error b
    (<*>) (Error a) _              = Error a 
    (<*>) (Success a) (Success b)  = Success (a b) 

