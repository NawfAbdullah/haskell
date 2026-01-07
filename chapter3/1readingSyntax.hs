-- correct the syntax if wrong
-- a) concat [[1, 2, 3], [4, 5, 6]] - correct

-- b) ++ [1, 2, 3] [4, 5, 6] - incorrect
--(++) [1, 2, 3] [4, 5, 6]

-- c) (++) "hello" "world" - correct

-- d) ["hello" ++ " world] - incorrect
--    ["hello" ++ "world"]

-- e) 4 !! "hello" - incorrect
--   "hello" !! 4

-- f) (!!) "hello" 4 - correct

-- g) take "4 lovely" -- incorrect
--    take 4 "lovely"

-- h) take 3 "awesome" -- correct