newtype Goats = Goats Int deriving Show
class TooMany a where 
    tooMany :: a -> Bool
instance TooMany Goats where
    tooMany (Goats n) = n > 43


---- 1 ----------
instance TooMany (Int, String) where
  tooMany (n, _) = n > 42
  
---------- 2 ------------
instance TooMany (Int, Int) where
  tooMany (n1, n2) = (n1+n2) > 42
  
------- 3 ---------

instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany (a, b) = tooMany (a+b)