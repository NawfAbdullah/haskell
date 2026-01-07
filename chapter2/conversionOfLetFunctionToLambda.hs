-- let x = 5 in x
(\x -> x) 5

-- let x = 5 in x*x
(\x -> x*x) 5

-- let x = 5; y = 6 in x * y
(\x y -> x*y) 5 6

-- let x = 3; y = 1000 in x + 3
(\x y -> x + 3) 3 1000