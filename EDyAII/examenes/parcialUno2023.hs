type Interval = (Int, Int)
data ITree = E | N ITree Interval ITree

right :: ITree -> Int
right E = error "No hay elementos en E"
right (N l (a,b) E) = b
right (N l (a,b) r) = right r

rightNode :: ITree -> Interval
right E = error "No hay elementos en E"
right (N l (a,b) E) = (a,b)
right (N l (a,b) r) = right r

left :: ITree -> Int
left E = error "No hay elementos en E"
left (N E (a,b) r) = a
left (N l (a,b) r) = left l


isE :: ITree -> Bool
isE E = True
isE (N _ _ _) = False

checkIT :: ITree -> Bool
checkIT E = True
checkIT (N l (a,b) r) = (a <= b) && checkIT l && checkIT r && ((a - 1 > right l) || isE l) && ((b + 1 < left r) || isE r)

splitMax :: ITree -> (Interval, ITree)
splitMax E = error "No se puede splitear una E"
splitMax (N l (a,b) r) = let
                        maxInt = rightNode (N l (a,b) r)
                        deleted = deleteMax (N l (a,b) r)
                        in (maxInt, deleted)

deleteMax :: ITree -> ITree
deleteMax E = E
deleteMax (N E i E) = E
deleteMax (N l i E) = l
deleteMax (N l i r) = (N l i (deleteMax r))

merge :: ITree -> ITree -> ITree -- Va a ser usado en un N l i r como merge l r osea que vos sabes que todos los elementos de l son menores a todos los de r
merge E E = E 
merge E r = r
merge l E = l
merge l r = let (MaxInt, ArbolDeletedMaxInt) = splitMax l
            in N ArbolDeletedMaxInt MaxInt r

--             maxl
--          /       \
-- (l-maxl)           r

delElem :: ITree -> Int -> ITree
delElem E _ = E
delElem (N l (a,b) r) d
    | d > b = (N l (a,b) (delElem r d))
    | d < a = (N (delElem l d) (a,b) r)
    | a == b = merge l r
    | a == d = (N l (a+1,b) r)
    | b == d = (N l (a, b-1) r)
    | otherwise = (N l (a, d-1) (N E (d+1, b) r)) -- d esta entre a y b pero no es a ni b

