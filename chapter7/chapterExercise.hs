-- MCQ 

-- 1. A polymorphic function
-- d) may resolve to values of different types, depending on inputs

-- 2. Two functions named f and g have types Char -> String and String -> [String] respectively. The composed function g . f has the type
-- Char -> [String]

-- 3. A function f has the type Ord a => a -> a -> Bool and we apply it to one numeric value. What is the type now?
-- a) ord a => a -> Bool 

-- 4. A function with the type (a -> b) -> c 
-- b) is a higer order function 

-- 5. Given the following definition of f, what is the type of f True?
f :: a -> a
f x = x
-- a) f True :: Bool 



-- 1. The following function returns the tens digit of an integral argument.
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d = xLast `mod` 10

-- a) rewrite it using divMod 
tensDigit :: Integral a => a -> a
tensDigit x = d
    where 
        (xLast, _) = divMod x 10
        (_, d) = divMod xLast 10

-- b) yes
-- c) change it to 100 digits

hunsDigit :: Integral a => a -> a
hunsDigit x = d
    where 
        (xLast, _) = divMod x 100
        (_, d) = divMod xLast 100


-- 2. Implement it with guard 

foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y

foldBool3 :: a -> a -> Bool -> a
foldBool3 x y val 
    | val = x 
    | otherwise = y

-- 3. write the function 
g :: (a-> b) -> (a,c) -> (b, c)
g f (a,c)  = (f a, c)


-- 4. understanf the code 

module Arith4 where 

roundTrip :: (Show a, Read a) => a -> a 
roundTrip a = read (show a)

main = do 
  print ( roundTrip 4)
  print (id 4)

-- 5. write the point free version
roundTrip :: (Show a, Read a) => a -> a 
roundTrip a = read.show a

-- 6. 

roundTrip :: (Show a, Read b) => a -> b 
roundTrip = read.show

main :: IO()
main = do 
    print ((roundTrip) :: Int)