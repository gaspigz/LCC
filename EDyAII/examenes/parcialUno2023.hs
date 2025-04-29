type Interval = (Int, Int)
data ITree = E | N ITree Interval ITree

right :: ITree -> Int
right E = -1
right N _ (a,b) E = b
right N _ _ r = right r

inv1 :: ITree -> Bool
inv1

inv2 :: ITree -> Bool


inv3 :: ITree -> Bool




checkIT :: ITree -> Bool
checkIT E = True
checkIT n = inv1 n && inv2 n %% inv3 n
