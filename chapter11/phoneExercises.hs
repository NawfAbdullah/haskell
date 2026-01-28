import Data.List (elemIndex, sort, maximumBy, group)
import Data.Char (isUpper, toLower)
import Data.Function (on)

-- dedine the dataStture 

type Digit = Char 
type Presses = Int 

data DaPhone = DaPhone [(Digit,String)] deriving Show 

phone :: DaPhone
phone = DaPhone
    [
        ('1',"1"),
        ('2',"abc2"),
        ('3',"def3"),
        ('4',"ghi4"),
        ('5',"jkl5"),
        ('6',"mno6"),
        ('7',"pqrs7"),
        ('8',"tuv8"),
        ('9',"wxyz9"),
        ('*',"^"),
        ('0',"+ _0"),
        ('#',".,#")
    ]

convo :: [String] 
convo = [
    "Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol lol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Haha thanks just making sure rofl ur turn"
    ]
-- encode the convo to stuffs

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps (DaPhone layout) c = 
    let 
        match = filter (\(digit,letters)-> c `elem` letters) layout

    in 
        case match of 
            [] -> []
            ((digit,letter):_) ->
                case elemIndex c letter of 
                    Just idx -> [(digit, idx+1)]
                    Nothing -> []

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone str = concatMap (go phone) str 
    where 
        go ph single 
            | isUpper single = ('*',1) : reverseTaps ph (toLower single)
            | otherwise = reverseTaps ph single



encodeConv :: [[(Digit, Presses)]]
encodeConv = map (\x -> cellPhonesDead phone x) convo

--- 3. how many times fo up need to press for each timreverseTaps ph single

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr (\(_, presses) acc -> presses + acc ) 0 

totalPresses = map fingerTaps encodeConv

--- 4. most popular letter in the string
mostPopularLetter :: String -> Char
mostPopularLetter str = 
    let 
        sortedStr = sort str
     
        countList = foldr (\x acc ->
            case acc of 
                [] -> [(x,1)]
                ((y,n):rest) ->
                    if x == y 
                    then (y, n +1) : rest
                    else (x,1):acc
             ) [] sortedStr
        (winnerChar,winnerCount) = maximumBy (compare `on` snd) countList
    in 
        winnerChar


coolestLtr :: [String] -> Char
coolestLtr sentences = mostPopularLetter (concat sentences)



coolestWord :: [String] -> String
coolestWord sentences = 
    let 
       allWords = concatMap words sentences

       normalize = map (map toLower) allWords
       sortedWords = sort normalize 
       groupedWords = group sortedWords
    in 
        head (maximumBy (compare `on` length) groupedWords)