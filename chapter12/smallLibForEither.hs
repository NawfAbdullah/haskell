-- get the lefts 

lefts' :: [Either a b] -> [a]
lefts' = foldr (\stuff acc -> case stuff of
                    Left x -> x: acc 
                    Right x -> acc
                ) []

-- get the rights

rights' :: [Either a b] -> [b]
rights' = foldr (\stuff acc -> case stuff of
                    Left x -> acc 
                    Right x -> x : acc
                ) []

-- seperate eitherss

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr (\stuff (l,r) -> case stuff of
                    Left x ->  (x:l,r)
                    Right x -> (l ,x:r)
                ) ([],[])


eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f (Left a) = Nothing 
eitherMaybe' f (Right a) = Just (f a )



either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f g (Left a) = f a 
either' f g (Right a) = g a 

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f a = either' (\_ -> Nothing) (\x -> Just (f x)) a 
