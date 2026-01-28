import Data.Char (toUpper)
-- 1. Capitalize Word

capitalizeWord :: String -> String
capitalizeWord (x:xs) = toUpper x : xs


mySentences "" = []
mySentences sentence = takeWhile (/='.') sentence : mySentences (drop 1 (dropWhile (/=' ') sentence))

capitalizeParagraph :: String -> String
capitalizeParagraph x = 
    let 
        words = mySentences x 
    in 
        concat [capitalizeWord a| a<-words]