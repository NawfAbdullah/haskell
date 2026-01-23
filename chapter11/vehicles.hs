data Price = Price Integer deriving (Eq, Show)
data Airline = PapuAir| CatapultsR'Us| TakeYourChancesUnited deriving (Eq, Show)
data Manufacturer = Mini| Mazda| Tata deriving (Eq, Show)
data Size = Size Integer deriving (Eq, Show)
data Vehicle = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge :: Size -> Vehicle
doge = Plane PapuAir

-- 1. What is the type of myCar?
-- Vehicle

-- 2. Given the following, define the functions:

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False 

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True 
isPlane _ = False 

areCars :: [Vehicle] -> [Bool]
areCars x = map isCar x


-- 3. Now we’re going to write a function to tell us the manufacturer of a piece of data:
getManu :: Vehicle -> Maybe Manufacturer
getManu (Car x _) = Just x 
getManu _ = Nothing

-- 4. Given that we’re returning the Manufacturer, what will happen if you use this on Plane data?
-- It will give an error