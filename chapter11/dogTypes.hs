data Doggies a = Husky a | Mastiff a deriving (Eq, Show)
data DogueDeBordeaux doge = DogueDeBordeaux doge

-- 1. Is Doggies a type constructor or a data constructor?
-- Doggies is a type constructor

-- 2. What is the kind of doggies?
-- * -> *

-- 3. What is the kind of Doggies String?
-- Doggies String :: *

-- 4. What is the type of Husky 10?
-- Num a => Doggies a

-- 5. What is the type of Husky (10::Integer)
--  Doggies Integer

-- 6. What is the type of Mastiff "Scooby Doo"?
-- Doggies String

-- 7.Is DogueDeBordeaux a type constructor or a data constructor?
-- is both a type costructor and data constructor

-- 8. What is the type of DogueDeBordeaux?
-- DogueDeBordeaux :: doge -> DogueDeBordeaux doge

-- 9. What is the type of DogueDeBordeaux "doggie!"
-- DougeDeBordeaux String
