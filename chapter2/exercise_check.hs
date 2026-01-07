let calPiSquare :: Int -> Float

calPiSquare  x = 3.14 * (x * x)

foo x = 
    let y = x * 2
        z = x ^ 2
    in 2 * y * z
     