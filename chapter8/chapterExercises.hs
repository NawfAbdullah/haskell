-- Review the types

-- 1. What is the type of [[True,False],[True, True],[True,True]]
-- d) [[Bool]]

-- 2. Which of the following has the same type as [[True, False],[True, True], [False, True]]?
-- b) [[3 == 3], [6 > 5], [3 < 4]]

-- 3. Which is True for the following function?
func :: [a] -> [a] -> [a]
func x y = x ++ y

-- d) all the above 


-- 4. For the func code above, which is a valid application of func to both of its arguments?
-- b)func "Hello" "World"

-- tell us the results for the function 

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny
appedCatty = cattyConny "woops"

frappe = flippy "haha"


-- 1. What is the value of appedCatty "woohoo!" ?
-- "woops mrow woohoo!"

-- 2. frappe "1"
-- "1 mrow haha"

-- 3. frappe (appedCatty "2")
-- "woops mrow 2 mrow haha"

-- 4. appedCatty (frappe "blue")
-- "woops mrow blue mrow haha"

-- 5. cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))
-- "pink mrow haha mrow green mrow woops mrow blue"

-- 6. cattyConny (flippy "Pugs" "are") "awesome"
-- "are mrow Pugs mrow awesome"

