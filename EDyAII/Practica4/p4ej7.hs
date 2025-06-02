data PHeaps a = Empty | Root a [PHeaps a ] deriving Show

getRoots :: [PHeaps a] -> [a]
getRoots [] = []
getRoots (Empty : xs) = getRoots xs
getRoots ((Root a xs) : ys) = a : (getRoots ys)

isPHeap :: Ord a => PHeaps a -> Bool
isPHeap Empty = True
isPHeap (Root a (x:xs)) = 
    let roots = getRoots (x:xs)
    in and (map isPHeap (x:xs)) && (length(roots) == 0 || a <= minimum((roots)))

arb1 = Root 5 [Root 10 [Empty], Root 15 [Root 25 [Empty], Root 30 [Empty]]]
arb2 = Root 3 [Root 5 [Empty], Root 7 [Empty]]
arb3 = Root 1 [Root 2 [Root 4 [Empty], Root 5 [Empty]], Root 3 [Root 6 [Empty], Root 7 [Root 8 [Empty], Root 9 [Empty]]]]
arb4 = Root 10 [Root 10 [Empty], Root 10 [Root 10 [Empty], Root 10 [Empty]]]
arb5 = Root 1 [Root 2 [Root 3 [Root 4 [Empty]]]]

arbErr = Root 10 [Root 5 [Empty], Root 15 [Root 20 [Empty], Root 12 [Empty]]]  -- 10 > 5 y 15 > 12
arbErr2 = Root 1 [Root 2 [Empty], Root 0 [Empty]]                             -- 1 > 0
arbErr3 = Root 8 [Root 9 [Empty], Root 7 [Empty]]                             -- 8 > 7
arbErr4 = Root 0 [Root (-1) [Empty]]                                         -- 0 > (-1)

merge :: Ord a => PHeaps a -> PHeaps a -> PHeaps a
merge Empty Empty = Empty
merge l Empty = l
merge Empty r = r
merge (Root a xs) (Root b ys)
    | a <= b = (Root a ((Root b ys) : xs))
    | otherwise = (Root b ((Root a xs) : ys))
