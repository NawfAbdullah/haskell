-- 1. Give the following sets of consonants and vowels

stops = "pdtdkg"
vowels = "aeiou"

arr :: [(Char, Char, Char)]
arr = [ (x1,v,x2) | x1 <- stops, v <- vowels,x2 <- stops ]

filArr = [ (x1,v,x2) | x1 <- stops, v <- vowels,x2 <- stops, x1 == 'p' ]


nouns :: [String]
nouns = ["nawf", "cat", "dog"]

verbs :: [String]
verbs = ["codes", "mews", "barks"]

sentences :: [(String, String, String)]
sentences = [ (n1, v, n2) | n1 <- nouns, v <- verbs, n2 <- nouns ]


seekritFunc x = div (sum (map length (words x))) (length (words x))
-- the function just gives the length of the words in a sentence

-- write this using fractional division
seekritFunc' x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))


-- rewrite the following functions to folds

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = if x == False then False else myAnd xs

myAnd' x = foldr (&&) True x


-- 1. myOr returns True if any Bool in the list is True

myOr :: [Bool] -> Bool 
myOr x = foldr (||) False x

-- 2. myAny returns True if a -> Bool applied to any of the values in the list returns True.

myAny :: (a -> Bool) -> [a] -> Bool
myAny f x = foldr ((||).f ) False x

-- 3.In addition to the recursive and fold based myElem, write a version that uses any.
myElem :: Eq a => a -> [a] -> Bool
myElem t x = foldr (\x acc -> x == t || acc) False x
myElem' t x = any (== t) x 


-- 4. Implement myReverse, don’t worry about trying to make it lazy.
myReverse :: [a] -> [a]
myReverse x = foldl (\acc x -> x:acc) [] x

-- 5. Write myMap in terms of foldr. It should have the same behavior as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f x = foldr (\x acc -> (f x): acc  ) [] x

-- 6. Write myFilter in terms of foldr. It should have the same behav-ior as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f x = foldr (\x acc -> if f x then x : acc else acc  ) [] x


-- 7. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish x = foldr (\x acc -> x ++ acc) [] x


-- 8. squishMap maps a function over a list and concatenates the re-sults.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f x = foldr (\x acc ->(f x) ++ acc) [] x

-- 9. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain x = squishMap id x 

-- 10. myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldr step x xs
  where 
    step x acc = 
      case f x acc of
        GT -> x  
        _  -> acc

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = foldr step x xs
  where 
    step x acc = 
      case f x acc of
        LT -> x  
        _  -> acc