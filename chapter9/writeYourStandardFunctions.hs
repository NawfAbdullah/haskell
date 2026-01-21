-- 1. implement or function 
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x then True else myOr xs 

-- 2. myAny 
myAny :: (a-> Bool) -> [a] -> Bool 
myAny _ [] = True
myAny f (x:xs) = if f x then myAny f xs else False

-- 3. elemFunction 

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False 
myElem el (x:xs) = if el == x then True else myElem el xs

-- 4. myReverse

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 5. squish

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6. squishMap

squishMap :: (a->[b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7. recreate squish with squish maps

squishAgain :: [[a]] -> [a]
squishAgain x = squishMap (\x -> x) x

-- 8. myMaximumBy

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "Maximum of empty list"

myMaximumBy _ [x] = x

myMaximumBy cmp (x:xs) = 
    let 
        maxItem = myMaximumBy cmp xs
    in 
        case cmp x maxItem of
            GT -> x            
            _  -> maxItem 

-- 9. myMinimumBy


myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "Minimum of empty list"

myMinimumBy _ [x] = x

myMaximumBy cmp (x:xs) = 
    let 
        maxItem = myMaximumBy cmp xs
    in 
        case cmp x maxItem of
            LT -> x            
            _  -> maxItem 