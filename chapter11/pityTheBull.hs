import Data.Int 


data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- 1. what is the cardinality of this datatype?
-- 4
 

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)
myNumba = Numba (-128)

-- 2. What is the cardinality of NumberOrBool? - 127 + 128 + 1 + 2 = 258
--  Numba with Numeric literal larfqrger than 127 - it gives an error
-- same with -129

