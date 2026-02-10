data Sum a b = First a | Second b deriving (Eq,Show)

instance Functor (Sum a) where
    fmap :: (a2 -> b) -> Sum a1 a2 -> Sum a1 b
    fmap _ (First a) = First a
    fmap f (Second b) = Second (f b)

-- No we can't apply f to First a because Functor expects kind * -> *, but First a is of kind *



