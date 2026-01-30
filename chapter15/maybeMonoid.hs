import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)



newtype First' a =
    First' { getFirst' :: Optional a }
    deriving (Eq, Show)

instance Semigroup (First' a) where
    (<>) (First' Nada) x = x
    (<>) (First' a) _ = First' a  

instance Monoid (First' a) where
    mempty = First' Nada  
    mappend = (<>)

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend
type FirstMappend =
    First' String
    -> First' String
    -> First' String
    -> Bool
