-- 1. Write a recursive function that takes a text/string, breaks it into words and replaces each instance of
-- "the" with "a", It's intended only to replace exactly the word "the"

notThe :: String -> Maybe String
notThe "the" = Nothing 
notThe a = Just a

replaceThe' :: [String] -> [String]
replaceThe' [] = []
replaceThe' (x:xs) 
    | x == "the" = "a" : replaceThe' xs
    | otherwise  = x : replaceThe' xs

replaceThe :: String -> String
replaceThe x = 
    let 
        stuffs = words x 
    in 
        unwords (replaceThe' stuffs)


         
-- 2. Write a recursive function that takes a text/string, breaks it into words, and counts the number of instances of ”the” followed by  vowel-initial word.

countTheBeforeVowel' :: [String] -> Integer -> Integer
countTheBeforeVowel' [] count = count 
countTheBeforeVowel' (x:xs) count 
    | x == "the" && head xs !! 0 `elem` "aeiou" = countTheBeforeVowel' xs count+1
    | otherwise =  countTheBeforeVowel' xs count

countTheBeforeVowel :: String -> Integer

countTheBeforeVowel x =
    let 
        stuffs = words x 
    in 
        countTheBeforeVowel' stuffs 0


-- 3. return the number of vowels in the string

countVowels' :: String -> Integer  -> Integer
countVowels' "" count = count 
countVowels' (x:xs) count
    | x `elem` "aeiou" = countVowels' xs count + 1
    | otherwise        = countVowels' xs count


countVowels :: String -> Integer
countVowels x = countVowels' x 0 