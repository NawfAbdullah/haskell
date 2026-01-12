--MCQ

-- 1. A value of type [a] is
-- c) a list whose elements are all of some type a 

-- 2. A function of type [[a]] -> [a] could
-- a) take a list of strings as an argument

-- 3. A function of type [a] -> Int -> a 
-- b) return one element of type a from a list

-- 4. A function of type (a, b) -> a 
-- c) takes a tuple argument and returns the first value




--Determine the type
-- 1) determine the value reurned by these function
--      a) (*9) 6 - 54
--      b) head [(0, "doge"),(1,"kitteh")] - (0, "doge")
--      c) head [(0 :: Integer ,"doge"),(1,"kitteh")] - (0, "doge")
--      d) if False then True else False - False
--      e) length [1,2,3,4,5] - 5
--      f) (length [1, 2, 3, 4]) > (length "TACOCAT") - False


-- 2. Give x = 5; y = x+5; w = y*10, what is type of w? 
-- Num a=> a 

-- 3. Given x = 5; y = x+5; z y = y*10, what is the type of z?
-- Num a=> a -> a 

-- 4. Give x =5; y = x + 5; f = 4/y what is the type of f?
-- Fractional a=> a 

-- 5. Given 
-- x = "Julie"; y = " <3 "; z="Haskell"; f = x++y++z
-- f :: [Char]




-- Does it Compile?
-- 1. No
-- 2. Yes
-- 3. No
-- 4. No




-- 1. Type variable or specific type constructor?
-- f:: Num a=> a-> b -> Int -> Int 
-- Num a=> constrained polymorphism
-- b fully polymorphic
-- Int concrete type constructor 

-- 2. f:: zed -> Zed -> Blah
-- zed polymorphic 
-- Zed -- concrete
-- Blah -- concrete 

--3. f:: Enum b=> a -> b-> C 
-- Enum b => constrained polymorphic
-- a - polymorphic
-- C - Concrete 

-- 4. f :: f -> g -> C 
-- f :: f -> g -> C 
-- f polymorphic
-- g polymorphic
-- C concrete


-- Write a type signature for the function
-- 1. functionH :: [a] -> a
-- functionH (x:_) = x

-- 2. functionC :: Ord a=> a -> a -> Bool
-- functionC x y if (x > y) then True else False

-- 3. functionS :: (a,b) -> a 
-- functionS (x, y) = y 



-- Given a type, write the function 

-- 1. i :: a -> a 
-- i x = x

-- 2. c :: a -> b -> a 
-- c a b = a

-- 3. Given alpha equivalence are c'' and c the same thing
-- c'' :: b-> a-> b 
-- c'' b a = b
-- yes they are same 

-- 4. c' :: a -> b -> b;
-- c' a b = b

-- 5. r :: [a] -> [a]
-- r x = tail x

-- 6. co :: (b -> c) -> (a -> b) -> (a -> c)
-- co f g x = f (g x)

-- 7. a :: (a -> c) -> a -> a 
-- a x y =  y

-- 8. a' :: (a -> b) -> a -> b 
-- a x y = x y


-- Fix it 
fstString :: [Char] -> [Char] 
fstString x = x ++ "in the rain"

sndString :: [Char] -> [Char] 
sndString x = x ++ " over the rainbow"

sing = if (x < y) then fstString x else sndString y 
            where x = "Singin"
                  y = "Somewhere"

-- (The above is the fixed code and the solution to second also)


main :: IO ()
main = do
    print (1 + 2)
    putStrLn "10"
    print (negate (-1)) 
    print ((+) 0 blah)
      where blah = negate 1

-- The above is the fixed code and the solution for question 3