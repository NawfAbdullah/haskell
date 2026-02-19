data Validation err result = Left' err | Right' result

instance Foldable (Validation err) where 
    foldr g acc (Left' x) = acc
    foldr f acc (Right' x) = f x acc
 
    foldMap f (Left' x ) = mempty
    foldMap f (Right' x) = f x 

instance Traversable (Validation err) where
    traverse g (Left' e) = pure (Left' e)
    traverse g (Right' x) = Right' <$> g x