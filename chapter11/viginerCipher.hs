import Data.Char

shift :: Int -> Char -> Char
shift n c
  | isUpper c = chr $ ord 'A' + (ord c - ord 'A' - n) `mod` 26
  | c == ' ' = c
  | otherwise = chr $ ord 'a' + ((ord c - ord 'a' - n) `mod` 26)

encodeV :: String -> String -> String 
encodeV key plainText = 
    let 
        infiniteKey = cycle key
        shifts = map (\k -> if isUpper k then ord 'A' - ord k else ord 'a' - ord k) infiniteKey
    in 
        zipWith shift shifts plainText

decodeV :: String -> String -> String 
decodeV key plainText = 
    let 
        infiniteKey = cycle key
        shifts = map (\k -> negate (if isUpper k then ord 'A' - ord k else ord 'a' - ord k))  infiniteKey
    in 
        zipWith shift shifts plainText