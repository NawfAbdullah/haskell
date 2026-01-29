-- 1. Build your iterate

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)

-- 2. unfoldrs

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f i =
    case f i of
        Nothing -> []
        Just (a,b) -> a : myUnfoldr f b

-- 3. Rewrite myIterate to better Iterate 

betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\a -> Just (a,f a)) x