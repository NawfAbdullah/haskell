--MCQ

-- 1. The Eq class
-- -- c) makes equality tests possible

-- 2. The typeclass Ord 
-- -- a) allows two values to be compared

-- 3. Suppose the typeclass Ord has an operator >. What is the type of >?
-- -- a) Ord a => a -> a-> Bool

-- 4. In x = divMod 16 12
--  -- c) the type of x is a tuple

-- 5. The typeclass Integral includes
-- -- a) Int and Integer Numbers





-- Does it type check?

---------------- 1 ----------------------
-- data Person = Person Bool
data Person = Person Bool deriving Show

printPerson :: Person -> IO()
printPerson person = putStrLn(show person)

-- fixed the code 

---------------- 2 ------------------------

-- data Mood = Blah | Woot deriving Show 

data Mood = Blah | Woot deriving ( Show , Eq ) 
settleDown x = if x == Woot then Blah else x

--- fixed the code 


-- 3. If you were to able to  settleDown to typecheck
--- a)What values are acceptable inputs to that function?
--------- only the type of Mood -> Blah or Woot 
--- b) What will happen if you try to run settleDown 9? Why?
--------- it will give an error as the function doesn't type check with Num 
--- c) What will happen if you try to run Blah > Woot? Why?
--------- it won't work as Mood is not an instance of Ord 

---------------------------- 4 ----------------------

type Subject = String
type Verb = String
type Object = String
data Sentence = Sentence Subject Verb Object deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-------- The code will compile as it is ---------------

data Rocks = 
 Rocks String deriving (Eq, Show)
data Yeah =
 Yeah Bool deriving (Eq, Show)
data Papu =
 Papu Rocks Yeah deriving (Eq, Show)


-- which will compile 

truth = Papu (Rocks "chomskydoz") (Yeah True)
