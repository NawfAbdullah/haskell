data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f a = 
    case f a of 
        Nothing -> Leaf 
        Just (a,b,c) -> Node (unfold f a) b (unfold f c) 


treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (\b -> 
    if b == 0 
    then Nothing 
    else Just (b-1, b-1, b-1)) n