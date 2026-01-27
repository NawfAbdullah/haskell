data Example = MakeExample deriving Show

-- 1. What is the type of data constructor MakeExample? What happens when you request the type of Example?
-- :t MakeExample - MakeExample :: Example
-- we can't request :t on Example as it is a typeConstructor

--2. what is :info of Example?
-- type Example :: *
-- data Example = MakeExample
        -- Defined at <interactive>:12:1
-- instance [safe] Show Example -- Defined at <interactive>:12:37
