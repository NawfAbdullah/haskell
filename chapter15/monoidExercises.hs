import Control.Applicative (Alternative(empty))
import Data.IntMap (member, empty)
------------------------- 1 ----------------------

data Trivial = Trivial deriving (Eq, Show)
instance Semigroup Trivial where
    _ <> _ = Trivial

instance Monoid Trivial where
    mempty = Trivial
    mappend = (<>)
----------------- 2 -------------
newtype Identity a = Identity a


instance Semigroup a => Semigroup (Identity a)  where
    (<>) (Identity a) (Identity b) = Identity (a <> b)

instance Monoid a => Monoid (Identity a) where
    mempty = Identity mempty
    mappend = (<>)

-------------- 3 ---------------
data Two a b = Two a b
instance (Semigroup a, Semigroup b) => Semigroup( Two a b) where 
    (<>) (Two a1 b1) (Two a2 b2) = Two (a1<>a2) (b1<>b2)

instance (Monoid a, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty
    mappend = (<>)

-------------- 4 -----------------

newtype BoolConj = BoolConj Bool
instance Semigroup BoolConj where 
    (<>) (BoolConj a) (BoolConj b) = BoolConj (a && b)


instance Monoid BoolConj where
    mempty = BoolConj True 
    mappend = (<>)

--------------- 5 ----------------------------

newtype BoolDisj = BoolDisj Bool
instance Semigroup BoolDisj where 
    (<>) (BoolDisj a) (BoolDisj b) = BoolDisj (a || b)

instance Monoid BoolDisj where
    mempty = BoolDisj False
    mappend = (<>)
-------------- 6  ------------------------------
newtype Combine a b = Combine { unCombine :: (a -> b) }
instance Semigroup b => Semigroup (Combine a b) where 
    (<>) (Combine f) (Combine g) = Combine (\x -> (f x) <> (g x)) 

instance Monoid b => Monoid (Combine a b) where
    mempty = Combine (\ _->mempty)
    mappend = (<>)

------------------ 7 ---------------------------

newtype Comp a = Comp { unComp :: (a -> a) }
instance Semigroup a => Semigroup (Comp a) where 
    (<>) (Comp f) (Comp g) = Comp (\x -> (f x) <> (g x)) 

instance Monoid a => Monoid (Comp a) where 
    mempty = Comp (\_ -> mempty)
    mappend = (<>)
----------------- 11 ----------------------------

data Validation a b = Failure a | Success b deriving (Eq, Show)
instance Semigroup a => Semigroup (Validation a b) where
    (<>) (Failure a) (Failure b) = Failure (a <> b)
    (<>) (Failure a) _           = Failure a
    (<>) _           (Failure b) = Failure b
    (<>) (Success a) _ = Success a 


--------------- 12 -------------------------------

newtype AccumulateRight a b = AccumulateRight (Validation a b) deriving (Eq, Show)
instance Semigroup b => Semigroup (AccumulateRight a b) where
    (<>) (AccumulateRight (Success a)) (AccumulateRight (Success b)) = AccumulateRight (Success (a <> b))
    (<>) (AccumulateRight (Failure a)) _           = AccumulateRight (Failure a)
    (<>) _           (AccumulateRight (Failure b)) = AccumulateRight (Failure b)

------------ 13 ----------------------------------

newtype AccumulateBoth a b = AccumulateBoth (Validation a b) deriving (Eq, Show)
instance (Semigroup a, Semigroup b) => Semigroup (AccumulateBoth a b) where
    (<>) (AccumulateBoth (Success a)) (AccumulateBoth (Success b)) = AccumulateBoth (Success (a <> b))
    (<>) (AccumulateBoth (Failure a)) (AccumulateBoth (Failure b)) = AccumulateBoth (Failure (a<>b))
    (<>) (AccumulateBoth (Failure a)) _           = AccumulateBoth (Failure a)
    (<>) _           (AccumulateBoth (Failure b)) = AccumulateBoth (Failure b)



----------------------------------------- 8 ----------------------

newtype Mem s a =
    Mem {
        runMem :: s -> (a,s)
    }
instance Semigroup a => Semigroup (Mem s a) where
    (<>) (Mem a) (Mem b) = Mem ( \s ->
        let (a1,s') = a s 
            (a2,s'') = b s'
        in (a1<>a2, s'')
        )

instance Monoid a => Monoid (Mem s a) where
    mempty :: Monoid a => Mem s a
    mempty = Mem (\s -> (mempty,s))
    mappend = (<>)  

main :: IO ()
main = do
    let f' = Mem (\s -> ("Hi", s + 1))
    let g' = Mem (\s -> (" there!", s + 9000)) -- Adds 9000 to state
    
    let combined = f' <> g' -- Should combine strings and add numbers
    
    print $ runMem combined 0
    -- Expected: ("Hi there!", 9001)
    
    -- Expected: ("", 0)