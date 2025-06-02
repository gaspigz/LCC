
-- Definir las siguientes funciones sobre árboles binarios de búsqueda (BST):
-- 1. maximum :: Ord a ⇒ BST a → a, que calcula el máximo valor en un BST.
-- 2. checkBST :: Ord a ⇒ BST a → Bool, que verifica si un árbol binario es un BST.
-- 3. splitBST :: Ord a ⇒ BST a → a → (BST a, BST a), que dado un árbol BST t y un elemento x, devuelva una
--    tupla con un BST con los elementos de t menores o iguales a x y un BST con los elementos de t mayores a x.
-- 4. join :: Ord a ⇒ BST a → BST a → BST a, que una los elementos de dos árboles BST en uno.


data BST a = E | N (BST a) a (BST a)

maximum' :: Ord a => BST a -> a
maximum' E = error "Maximo de una hoja. "
maximum' (N l a E) = a
maximum' (N l a r) = maximum' r

minimum' :: Ord a => BST a -> a
minimum' E = error "Minimo de una hoja. "
minimum' (N E a r) = a
minimum' (N l a r) = minimum' l

isE :: Ord a => BST a -> Bool
isE E = True
isE (N _ _ _) = False

-- checkBST :: Ord a => BST a -> Bool
-- checkBST E = True
-- checkBST (N l r a) = checkBST l && checkBST r && (isE l || a > (maximum' l)) && (isE r || a < (minimum' r))

splitBST :: Ord a => BST a -> a -> (BST a, BST a)
splitBST E t = (E, E)
splitBST (N l a r) t
    | a == t = ((N l a E), r)
    | a > t =
        let (l',r') = (splitBST l t)
        in (l', (N r' a r))
    | otherwise =
        let (l', r') = (splitBST r t)
        in ((N l' a l), r')

join :: Ord a => BST a -> BST a -> BST a

-- Uso como raiz

join E E = E
join l E = l
join E r = r
join t1@(N l a r) t2@(N l' a' r') =
    let (ll, rr) = splitBST t2 a
    in (N (join l ll) a (join r rr))
    