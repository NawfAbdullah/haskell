divide :: Integer -> Integer -> Integer 

divide _ 0 = error "Division by zero"
divide a b = 
    let 
        answerIsNegative = (a < 0) /= (b<0)
        absA = abs a 
        absB = abs b 
    in 
        if answerIsNegative then negate (go absA absB 0)
        else go absA absB 0
    where 
     go n d count
      | n < d  || n == 0   = count      
      | otherwise = go (n-d) d (count+1)
