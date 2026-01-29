data Nat =
    Zero
    | Succ Nat
    deriving (Eq, Show)

natToInteger' :: Nat->Integer->Integer
natToInteger' Zero count = count 
natToInteger' (Succ x) count =  natToInteger' x (count + 1)

natToInteger :: Nat -> Integer
natToInteger x = natToInteger' x 0

integerToNat' 0 = Zero
integerToNat' x  = Succ( integerToNat' (x - 1) ) 

integerToNat :: Integer -> Maybe Nat
integerToNat x 
    | x < 0     = Nothing 
    | otherwise =  Just (integerToNat' x)
