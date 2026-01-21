-- 1. fill the multiples of 3 from 1 to 30 
-- filter (\x-> mod x 3 == 0) [1..30]

-- tell us how many multiples of 3 exists with 1,30
-- length $ filter (\x-> mod x 3 == 0) [1..30]
-- 10

-- 3. remove the artiles in a sentence 

myWords :: String -> [String]

myWords "" = []
myWords sentence = takeWhile (/=' ') sentence : myWords (drop 1 (dropWhile (/=' ') sentence))

myFilter x = filter (\x->not (elem x ["a","an","the"])) $ myWords x