-- Si un árbol binario es dado como un nodo con dos subárboles idénticos, 
-- se puede aplicar la técnica sharing para que los subárboles sean representados por el mismo árbol. 
-- Definir las siguientes funciones de manera que se puedan compartir la mayor cantidad posible 
-- de elementos de los árboles creados:

-- a) completo :: a → Int → Tree a, tal que dado un valor x de tipo a y un entero d, crea un árbol binario 
--    completo de altura d con el valor x en cada nodo.

-- b) balanceado :: a → Int → Tree a, tal que dado un valor x de tipo a y un entero n, crea un árbol
--    binario balanceado de tamaño n, con el valor x en cada nodo.

data Tree a = E | N (Tree a) a (Tree a)

completo 0 x = E
completo d x = let t = completo (d-1) x
               in N t x t

balanceado x 0 = E
balanceado x 1 = N E x E
balanceado x n = 
    let (q, r) = divMod (n - 1) 2
        left = balanceado x q
        right = balanceado x (q + r)
    in N left x right

mostrar :: Show a => Tree a -> String
mostrar = unlines . mostrarAux 0
  where
    mostrarAux _ E = []
    mostrarAux indent (N izq x der) =
      mostrarAux (indent + 4) der ++
      [replicate indent ' ' ++ show x] ++
      mostrarAux (indent + 4) izq

instance Show a => Show (Tree a) where
  show = mostrar

main = print (balanceado 'a' 8)

-- Definir las siguientes funciones sobre árboles binarios de búsqueda (BST):
-- 1. maximum :: Ord a ⇒ BST a → a, que calcula el máximo valor en un BST.
-- 2. checkBST :: Ord a ⇒ BST a → Bool, que verifica si un árbol binario es un BST.
-- 3. splitBST :: Ord a ⇒ BST a → a → (BST a, BST a), que dado un árbol BST t y un elemento x, devuelva una
--    tupla con un BST con los elementos de t menores o iguales a x y un BST con los elementos de t mayores a x.
-- 4. join :: Ord a ⇒ BST a → BST a → BST a, que una los elementos de dos árboles BST en uno.


data BST a = E | N (BST a) a (BST a)

maximum :: Ord a => BST a -> a
maximum E = error "Maximo de una hoja. "
maximum (N l a E) = a
maximum (N l a r) = maximum r

minimum :: Ord a => BST a -> a
minimum E = error "Minimo de una hoja. "
minimum (N E a R) = a
minimum (N l a r) = minimum l

isE :: Ord a => BST a -> Bool
isE E = True
isE (N _ _ _) = False

checkBST :: Ord a => BST a -> Bool
checkBST E = True
checkBST (N l r a) = checkBST l && checkBST R && (isE l || a > maximum l) && (isE r || a < minimum r)

splitBST :: Ord a => BST a -> a -> (BST a, BST a)
splitBST E t = (E, E)
splitBST (N l a r) t
    | a == t = ((BST l a E), r)
    | a > t =
        let (l',r') = (splitBST l t)
        in (l', (N r' a r))
    | otherwise =
        let (l', r') = (splitBST r t)
        in ((N l' a l), r')

join :: Ord a ⇒ BST a → BST a → BST a

-- Uso como raiz

join E E = E
join l E = l
join E r = r
join t1@(N l a r) t2@(N l' a' r') =
    let (L, R) = splitBST t2 a
    in (N (join l L) a (join r R))
    