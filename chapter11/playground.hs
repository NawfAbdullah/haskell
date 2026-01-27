
data Sum a b =
    First a
    | Second b
    deriving (Eq, Show)




type Name = String
type Age = Int
type LovesMud = Bool
-- Sheep can produce between 2 and 30
-- pounds (0.9 and 13 kilos) of wool per year!
-- Icelandic sheep don't produce as much
-- wool per year as other breeds but the
-- wool they do produce is a finer wool.
type PoundsOfWool = Int
data CowInfo =
    CowInfo Name Age
    deriving (Eq, Show)
data PigInfo =
    PigInfo Name Age LovesMud
    deriving (Eq, Show)
data SheepInfo =
    SheepInfo Name Age PoundsOfWool
    deriving (Eq, Show)
data Animal =
    Cow CowInfo
    | Pig PigInfo
    | Sheep SheepInfo
    deriving (Eq, Show)

type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)