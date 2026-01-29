-- 1. Simple boolean checks for Maybe values.


isJust :: Maybe a -> Bool 
isJust Nothing = False 
isJust (Just a) = True 


isNothing :: Maybe a -> Bool 
isNothing Nothing = True 
isNothing (Just a) = False 

--2. The following is the Maybe catamorphism. You can turn a Maybe
--value into anything else with this.

mayybee :: b -> (a->b) -> Maybe a -> b 
mayybee b _ Nothing = b
mayybee _ f (Just a) = f a  


-- 3. In case you just want to provide a fallback value.

fromMaybe :: a -> Maybe a -> a
fromMaybe a Nothing = a 
fromMaybe _ (Just a) = a 

-- 4. Converting between List and Maybe.

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing 
listToMaybe x = Just (head x)

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just a) = [a]

-- 5. For when we just want to drop the Nothing values from our list.
catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing:xs) = catMaybes xs
catMaybes ((Just x):xs) = x : catMaybes xs

-- 6. You'll see this called "sequence" later
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (x:xs) = 
    case x of
        Nothing -> Nothing
        Just val -> 
            case flipMaybe xs of
                Nothing -> Nothing      
                Just rest -> Just (val : rest) 