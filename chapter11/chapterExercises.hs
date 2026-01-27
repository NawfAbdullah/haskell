-- MCQ
-- 1. What can we say of the given datypes
data Weekday =
    Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday

-- a) Weekday is a type with five data constructors

-- 2. with the same datatype definition in mind, what is the type of the following function, f?
f Friday = "Miller Time"
-- f :: Weekday -> String

-- 3. Types defined with the data keywords
-- b) must begin with a capital letter

-- 4. 4. The function g xs = xs !! (length xs - 1)
-- delivers the final element of xs