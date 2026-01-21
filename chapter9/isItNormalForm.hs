-- are they in normal form, whnf or neither?

-- 1. [1, 2, 3, 4, 5]
-- normal form and whnf

-- 2. 1 : 2 : 3 : 4 : _
-- whnf 

-- 3. enumFromTo 1 10
-- neither

-- 4. length [1, 2, 3, 4, 5]
-- neither

-- 5. sum (enumFromTo 1 10)
-- neither 

-- 6. ["a".."m"] ++ ['n'..'z']
-- neither

-- 7. (_, 'b')
-- whnf