-- find the how many unique values
data Quad =
    One
    | Two
    | Three
    | Four
    deriving (Eq, Show)

-------------------- 1 ---------------

---eQuad :: Either Quad Quad 
--  eQuad = undefined
--  8

-- 2. prodQuad :: (Quad, Quad)
-- 4 x 4 = 16

-- 3. funcQuad :: Quad -> Quad
-- 4 ^ 4 = 256

-- 4. prodTBool :: (Bool, Bool, Bool)
-- 2 * 2 * 2 = 8

-- 5. gTwo :: Bool -> Bool -> Bool
-- 2 ^ 2 ^ 2 = 16

-- 6. fTwo :: Bool -> Quad -> Quad
-- (2 * 4) ^ 4 = 65538