import Data.Char

encode :: String->Int->String
encode "" k = ""
encode (x:xs) k = 
    let 
        base = ord 'a'
        shifted = mod (ord x - base + k) 26 + base 
    in 
        chr shifted : encode xs k


decode :: String->Int->String
decode "" k = ""
decode (x:xs) k = 
    let 
        base = ord 'a'
        shifted = mod (ord x - base - k) 26 + base 
    in 
        chr shifted : decode xs k
