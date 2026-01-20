eftBool :: Bool -> Bool -> [Bool]
eftBool start stop
    | start > stop = []
    | start == stop = [start]
    | otherwise = [start] ++ (eftBool (succ start) stop)
 
eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd start stop
    | start > stop = []
    | start == stop = [start]
    | otherwise = [start] ++ (eftOrd (succ start) stop)

eftInt :: Int -> Int -> [Int]
eftInt start stop
    | start > stop = []
    | start == stop = [start]
    | otherwise = [start] ++ (eftInt (succ start) stop)
 

eftChar :: Char -> Char -> [Char]
eftChar start stop
    | start > stop = []
    | start == stop = [start]
    | otherwise = start : eftChar (succ start) stop
 