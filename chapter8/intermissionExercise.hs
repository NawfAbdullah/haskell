applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b

-- applyTimes 0 f b = b
-- applyTimes n f b = f . applyTimes (n-1) f $ b

-- convert the above recursive function without using (.)

applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)
