-- 1. If the type of f is a -> a -> a -> a, and the type of x is Char then the type of f x is
-- a) Char -> Char -> Char

-- 2. If the type of g ias a -> b -> c -> b, then the type of g 0 'c' "woot" is
-- d) Char

-- 3. If the type of h is (Num a, Num b) => a -> b -> b, then the type of h 1.0 2 is
-- b) Integer

-- 4. If the type of b is (Num a, Num b) => a-> b-> b, then the type of h 1 (5.5 :: Double) is
-- c) Double

-- 5. If the type if jackal is (Ord a, Eq b) => a-> b -> a, then the type of jackal "keyboard" "has the word jackal in it"
-- a) [Char] 

-- 6. If the type of jackal is (Ord a, Eq b) => a -> b -> a, then the type of
-- c) [Char]

-- 7. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel 1 2 is
-- b) Integer

-- 8. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel 1 (2::Integer) is 
-- f) Integer


-- 9. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel (1::Integer) 2 is
-- c) Integer

