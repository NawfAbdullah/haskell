import Data.Monoid (Any(..))
import Data.Monoid (All(..))

myReverse :: [a] -> [a]
myReverse = foldl (\acc x -> x : acc) []


data Validation err result = Error err | Ok result

instance Foldable (Validation err) where
    foldr f acc (Error e) = acc
    foldr f acc (Ok r)    = f r acc  
    
    foldMap f (Error e)   = mempty    
    foldMap f (Ok r)      = f r



isPresent :: (Foldable t, Eq a) => a -> t a -> Bool
isPresent target container = getAny (foldMap (\x -> Any (x==target)) container)


data Tree a = Empty | Node (Tree a) a (Tree a)

instance Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node left x right) = (foldMap f left) <> (f x) <> (foldMap f right)


myFilter :: (a -> Bool) -> [a] -> [a]
myFilter pred = foldr (\x acc -> if pred x then x : acc else acc) []

myMinimum :: (Foldable t, Ord a) => t a -> Maybe a
myMinimum = foldr step Nothing
  where
    step x Nothing  = Just x 
    step x (Just y) = Just (min x y)


newtype Identity a = Identity a
instance Foldable Identity where
    foldr f z (Identity x) = f x z 
    foldMap f (Identity x) = f x


-- Return True only if EVERY element satisfies the predicate
allSatisfy :: Foldable t => (a -> Bool) -> t a -> Bool
allSatisfy pred container = getAll (foldMap (\x->All (pred x)) container)


data WeightedTree a = Leaf a 
                    | Branch Int (WeightedTree a) (WeightedTree a)

instance Foldable WeightedTree where
    -- Base Case: Just one element to process
    foldMap f (Leaf x) = f x 
    
    -- Recursive Step: Ignore the Int, combine the sub-trees
    foldMap f (Branch _ left right) = foldMap f left <> foldMap f right
    
    -- Optional Hard Mode: Implement foldr directly (without using foldMap)
    foldr f acc (Leaf x) = f x acc
    foldr f acc (Branch _ left right) = foldr f (foldr f acc right) left