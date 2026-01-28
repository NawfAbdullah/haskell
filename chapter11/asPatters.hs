import Data.Char (toUpper)
-- return true if all the elements in the list belongs in the list 
isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool 

isSubsequenceOf [][] = True
isSubsequenceOf _ [] = False
isSubsequenceOf [] _ = True
isSubsequenceOf  t@(x:xs) (y:ys)
                | x == y    =  isSubsequenceOf xs ys
                | otherwise = isSubsequenceOf t ys 


-- capitalize the first letters
myWords "" = []
myWords sentence = takeWhile (/=' ') sentence : myWords (drop 1 (dropWhile (/=' ') sentence))

capitalizeWords :: String -> [(String, String)]
capitalizeWords "" = []
capitalizeWords x = 
    let 
        words = myWords x 
    in 
        [(a,toUpper x : xs)| a@(x:xs)<-words]