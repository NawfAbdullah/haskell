data DayOfTheWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Ord, Show)

data Date = Date DayOfTheWeek Int 

instance Eq DayOfTheWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date weekday month) (Date weekday2 month2) =
        weekday == weekday2 && month == month2