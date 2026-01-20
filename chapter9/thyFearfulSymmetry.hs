myWords :: String -> [String]

myWords "" = []
myWords sentence = takeWhile (/=' ') sentence : myWords (drop 1 (dropWhile (/=' ') sentence))

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]

myLines "" = []
myLines sentence = takeWhile (/='\n') sentence : myLines (drop 1 (dropWhile (/='\n') sentence))


mySeperator :: String -> Char -> [String]
mySeperator sentence x = takeWhile (/=x) sentence : myLines (drop 1 (dropWhile (/=x) sentence))
