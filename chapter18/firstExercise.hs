import Control.Monad (join)
andOne :: Int -> [Int]
andOne x = [x, 1]

bind :: Monad m => (a -> m b) -> m a -> m b
bind f x = join (fmap f x)



twiceWhenEven' :: [Integer] -> [Integer]
twiceWhenEven' xs = do
    x <- xs
    if even x
    then [x*x, x*x]
    else [x*x]

twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
    x <- xs
    if even x
    then [x*x, x*x]
    else []