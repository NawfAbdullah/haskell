import Data.Time
data DatabaseItem = DbString String
                    | DbNumber Integer
                    | DbDate UTCTime
                    deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    , DbDate (UTCTime
                (fromGregorian 2020 5 1)
                (secondsToDiffTime 34123))
    , DbDate (UTCTime
                (fromGregorian 2003 5 1)
                (secondsToDiffTime 34123))
    ]

-- 1. write a function that filters for DbDate values and returns a list of the UTCTime values inside them

filterDbDate :: [DatabaseItem] -> [UTCTime]

filterDbDate db = foldr f [] db
    where 
        f (DbDate time) acc = time:acc 
        f _             acc = acc

-- 2. Write a function that filters for DbNumber values and returns a list of the Integer values inside them.
filterDbNumber :: [DatabaseItem] -> [Integer]

filterDbNumber db = foldr f [] db 
    where 
        f (DbNumber x) acc = x : acc 
        f _            acc = acc 


-- 3. Write a function that gets the most recent date.

mostRecent :: [DatabaseItem] -> UTCTime

mostRecent  db = foldr f (UTCTime (fromGregorian 1700 1 1) (secondsToDiffTime 0))  db 
    where 
        f (DbDate x) acc =  max x acc  
        f _           acc = acc 

-- 4. Write a function that sums all of the DbNumber values.

sumDb :: [DatabaseItem] -> Integer
sumDb db = foldr f 0 db 
    where 
        f (DbNumber x) acc = x + acc 
        f _            acc = acc 

-- 5. 5. Write a function that gets the average of the DbNumber values.

avgDb :: [DatabaseItem] -> Double
avgDb db = 
    let
      (totalSum,count) = foldr f (0,0) db 
    in 
    if count == 0 then  0 else fromIntegral totalSum / fromIntegral count
    where 
        f (DbNumber x) (a, b) = (x + a, 1 + b)    
        f _            acc = acc 
