module WordNumber where 

import Data.List (intersperse)

digitToWord :: Int -> String 
digitToWord n 
    | n == 0 = "zero"
    | n == 1 = "one"
    | n == 2 = "two"
    | n == 3 = "three"
    | n == 4 = "four"
    | n == 5 = "five"
    | n == 6 = "six"
    | n == 7 = "seven"
    | n == 8 = "eight"
    | n == 9 = "nine"
    | otherwise = "error"

digit :: Int -> [Int]
digit n = 
    go n []
    where go n arr 
            | n < 10 = [n] ++ arr
            | otherwise = go (div n 10) ([mod n 10]++ arr)

wordNumber :: Int -> String 
wordNumber n =
    let digits = digit n in 
        concat $ intersperse "-" $ map digitToWord digits
        

