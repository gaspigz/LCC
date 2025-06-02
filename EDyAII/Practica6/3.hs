data Tree a = E | Leaf a | Join (Tree a) (Tree a) deriving Show

(|||) :: a -> b -> (a,b)
x ||| y = (x,y)

sufijos' :: Tree Integer -> Tree Integer -> Tree (Tree Integer)
sufijos' E _ = E
sufijos' (Leaf _) sufijosAcarreados = Leaf (sufijosAcarreados)
sufijos' (Join l r) sufijosAcarreados = let
                                        (sufl, sufr) = (sufijos' l (Join r sufijosAcarreados)) ||| sufijos' r sufijosAcarreados
                                        in Join sufl sufr

sufijos :: Tree Integer -> Tree (Tree Integer)
sufijos t = sufijos' t E

conSufijos :: Tree Integer -> Tree (Integer, Tree Integer)
conSufijos' :: Tree Integer -> Tree (Tree Integer) -> Tree (Integer, Tree Integer)

conSufijos' E _ = E
conSufijos' (Leaf a) (Leaf sufijos) = Leaf (a, sufijos)
conSufijos' (Join l r) (Join sufl sufr) = let
                                            (conSufijosL, conSufijosR) = (conSufijos' l sufl) ||| (conSufijos' r sufr)
                                        in Join (conSufijos' l sufl) (conSufijos' r sufr) 

conSufijos t = conSufijos' t (sufijos t)

arbolPrueba = Join (Join (Leaf 10) (Leaf 15)) (Leaf 20)

maxT :: Tree Int -> Int
maxT E = error "maxT de hoja"
maxT (Leaf a) = a
Maxt (N l r) = reduce max 