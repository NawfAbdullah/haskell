import Data.Monoid (Sum(getSum, Sum), Product (getProduct, Product), Any (getAny, Any))

sum :: (Foldable t, Num a) => t a -> a
sum x = getSum ( foldMap Sum x)

product :: (Foldable t, Num a) => t a -> a
product x = getProduct (foldMap Product x) 

elem :: (Foldable t, Eq a) => a -> t a -> Bool
elem x = getAny . foldMap (\y -> Any (x == y))

minimum :: (Foldable t, Ord a) => t a -> Maybe a
minimum = foldr step Nothing
  where
    step x Nothing = Just x
    step x (Just m) = Just (min x m)

maximum :: (Foldable t, Ord a) => t a -> Maybe a
maximum = foldr step Nothing
  where
    step x Nothing = Just x
    step x (Just m) = Just (max x m)

null :: (Foldable t) => t a -> Bool
null = foldr nullFinder True
    where 
        nullFinder _ _ = False

length :: (Foldable t) => t a -> Int
length = foldr (\_ acc -> acc + 1) 0

toList :: (Foldable t) => t a -> [a]
toList = foldr (:) []

fold :: (Foldable t, Monoid m) => t m -> m
fold = foldr mappend mempty

foldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
foldMap = foldr (\x acc -> f x <> acc) mempty