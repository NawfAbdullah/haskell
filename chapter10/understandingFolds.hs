-- Understanding Folds
-- 1. which is same as foldr (*) 1 [1..5]
-- b) foldl (flip (*)) 1 [1..5]

-- 2. write out the evaluation steps for
-- foldl (flip (*)) 1 [1..3]
-- 1 * ( 1 * (2 * 3))

-- 3. One difference between foldr and foldl is
-- c) foldr, but not foldl, associates to the right

-- 4. Folds are catamorphisms, which means they are generally used to 
-- a) reduce structure

-- 5. fix the code 

-- a) foldr (++) ["woot","WOOT","woot"]
-- foldr (++) [] ["woot","WOOT","woot"]

-- b) foldr max  [] "fear is the little death"
-- foldr max [] ["fear is the little death"]

-- c) folder and True [False, True]
-- folder (&&) True [False, True]

-- d) can this return a different answer
-- foldr (||) True [False,True]
-- not unless every value is false

-- e) foldl ((++) . show) "" [1..5]
-- foldr ((++) . show) "" [1..5]

-- f) foldr const 'a' [1..5]
-- foldr (flip const) 'a' [1..5]

-- g) foldl const 0 "tacos"
-- foldl const 0 "tacos"

-- h) foldl (flip const) 0 "burritos"
-- foldl const 0 "burritos"

-- i) foldl (flip const) 'z' [1..5]
-- foldl const 'z' [1..5]\s