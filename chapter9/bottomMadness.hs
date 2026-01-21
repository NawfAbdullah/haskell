-- 1. Will the following expression return a value or be ⊥?
-- [x^y | x <- [1..5], y <- [2, undefined]]
-- error

-- take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
-- it will return [1]

-- 3. What will the following return
-- sum [1, undefined, 3]
--- Prelude.undefined

-- 4. length [1, 2, undefined]
-- 3

-- 5. length $ [1, 2, 3] ++ undefined
-- Prelude.undefined

-- 6. take 1 $ filter even [1, 2, 3, undefined]
-- [2]

-- 7. take 1 $ filter even [1, 3, undefined]
-- Prelude.undefined

-- 8. take 1 $ filter odd [1, 3, undefined]
-- [1]

-- 9. take 2 $ filter odd [1, 3, undefined]
-- [1,3]

-- 10. take 3 $ filter odd [1, 3, undefined]
-- Prelude.unudefined


