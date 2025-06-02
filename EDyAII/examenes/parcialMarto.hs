data Color = R | B deriving (Eq,Show)
data AATree a = N Color a (AATree a) (AATree a) | E deriving (Show, Eq)

arbol1 = E

arbol2 = N B 10
            (N R 5 E E)
            (N R 15 E E)

arbol3 = N B 10
            (N R 15 E E)
            (N R 5 E E)

arbol4 = N B 20
            (N R 10
                (N R 5 E E)
                E)
            (N R 30
                E
                (N R 35 E E))

arbol5 = N B 50
            (N R 30
                (N R 20
                    (N R 10 E E)
                    E)
                (N R 40 E E))
            (N R 70
                (N R 60
                    E
                    (N R 65 E E))
                (N R 80 E E))


isE :: AATree a -> Bool
isE E = True
isE (N _ _ _ _) = False

maximo :: AATree a -> a
maximo (N _ a l r)
    | isE r = a
    | otherwise = maximo r

minimo :: AATree a -> a
minimo (N _ a l r)
    | isE l = a
    | otherwise = minimo l

isBST :: Ord a => AATree a -> Bool

isBST E = True
isBST (N _ a l r) = isBST l && isBST r && (isE l || a > maximo l) && (isE r || a < minimo r)

isRorE :: AATree a -> Bool
isRorE E = True
isRorE (N R _ _ _) = True
isRorE (N B _ _ _) = False

isR :: AATree a -> Bool
isR E = False
isR (N R _ _ _) = True
isR (N B _ _ _) = False

alturaNegra :: AATree a -> Int
alturaNegra E = 0
alturaNegra (N R a l r) = 0 + max (alturaNegra l) (alturaNegra r)
alturaNegra (N B a l r) = 1 + max (alturaNegra l) (alturaNegra r)

inv1 :: AATree a -> Bool
inv1 E = True
inv1 nodo@(N c a l r)
    | isR nodo = (not(isR l) || isE l) && (not(isR r) || isE r) && inv1 l && inv1 r
    | otherwise = inv1 l && inv1 r 


inv2 :: AATree a -> Bool
inv2 E = True
inv2 (N c a l r) = inv2 l && inv2 r && (alturaNegra l == alturaNegra r || isE l || isE r)

inv3 :: AATree a -> Bool
inv3 E = True
inv3 (N c a E r) = inv3 r
inv3 (N c a l r) = not(isR l) && inv3 l && inv3 r

isAATree :: Ord a => AATree a -> Bool

isAATree E = True
isAATree t@(N c a l r) = isBST t && inv1 t && inv2 t && inv3 t

aaValido1 :: AATree Int
aaValido1 = N R 10 (N B 5 E E) (N B 15 E E)

aaInvalido1 :: AATree Int
aaInvalido1 = N B 10 (N R 5 (N R 2 E E) E) (N R 15 E E)

aaInvalido2 :: AATree Int
aaInvalido2 = N B 20 (N B 10 E E) (N B 30 E (N B 40 E E))

aaInvalido3 :: AATree Int
aaInvalido3 = N B 10 (N R 5 E E) (N B 15 E E)

aaValido2 :: AATree Int
aaValido2 = N B 20 (N B 10 E E) (N R 30 E (N B 40 E E))

aaGrandeValido :: AATree Int
aaGrandeValido = N B 50
                    (N B 25
                        (N B 10
                            (N B 5 E E)
                            (N R 15 E E))
                        (N R 35
                            (N B 30 E E)
                            (N B 40 E E)))
                    (N R 75
                        (N B 60
                            (N B 55 E E)
                            (N R 65 E E))
                        (N B 85
                            (N B 80 E E)
                            (N B 90 E E)))

--                              (50, B)
--                        /                \
--                  (25, B)                (75, R)
--                 /      \             /          \
--           (10, B)   (35, R)       (60, B)        (85, B)
--           /    \     /   \        /    \         /     \
--       (5, B) (15, R)(30,B)(40,B) (55,B)(65,R) (80,B)(90,B)

aaGrandeValidoFix :: AATree Int
aaGrandeValidoFix = N R 20
    (N B 15
        E
        (N R 18
            E
            (N B 19 E E)))
    (N B 50
        (N B 40
            E E)
        (N R 70
            (N B 60 E E)
            (N B 80 E E)))


member :: Ord a => a -> AATree a -> Bool
member a E = False
member x (N _ a l r)
    | x < a = member x l
    | x > a = member x r
    | otherwise = True

ins :: Ord a => a -> AATree a -> AATree a
ins x E = N R x E E
ins x (N c y l r)
    | x < y = split (skew (N c y (ins x l) r))
    | x > y = split (skew (N c y l (ins x r)))
    | otherwise = (N c y l r)

skew :: Ord a => AATree a -> AATree a
skew (N B y (N R x a b) c) = N B x a (N R y b c)
skew t = t

split :: Ord a => AATree a -> AATree a
split (N B x a (N R y b (N R z c d))) = (N R y (N B x a b) (N B z c d))
split t = t

makeBlack :: Ord a => AATree a -> AATree a
makeBlack (N _ l x r) = N B l x r
makeBlack t = t

insert :: Ord a => a -> AATree a -> AATree a
insert a t = makeBlack (ins a t)