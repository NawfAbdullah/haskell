-- 1. write a function to convert the given input to given output
-- a)"Curry is awesome" -> "Curry is awesome!"
--   ANS:"Curry is awesome"++"!"
-- b) "Curry is awesome!" -> "y"
--   ANS: "Curry is awesome!" !! 4
-- c) "Curry is awesome!" -> "awesome!"
--   ANS: drop 9 "Curry is awesome!"

-- 2. Write the above function in a generalized way

-- "Curry is awesome" -> "Curry is awesome!"
addString = (\x y-> x++y)

-- "Curry is awesome!" -> "y"
findIndex = (\x y -> x!!y)

-- "Curry is awesome!" -> "awesome!"
removePart = (\x y-> drop x y)

-- 3. write a function to return the thrid character of the given addString
getThirdLetter :: String-> Char
getThirdLetter = \x -> x !! 2

-- 4. get given character in a fixed String
getGivenCharacter :: Int -> Char
getGivenCharacter = \x -> "Curry is awesome" !! x

-- 5. reverse the words in the string "Curry is awesome" to "awesome is Curry"  
rvrs :: String -> String
rvrs = \x -> concat [drop 9 x ," ", take 2 (drop 6 x), " " , (take 6 x)  ]

-- 6. write the above question as seperate module
-- written in seperate file