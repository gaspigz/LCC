-- A las secuencias las podemos representar como una lista, de esta forma todos los algoritmos tendrán prof.
-- lineal, pero representandolos como arboles, va a ser mejor la profundidad.
-- La representacion de la secuencia como arbol se arma in-order.
 v  z
-- Ej: <-4, 1, 2, 3, 5, -2, -3, 1>

data Tree a = E | Leaf a | Join (Tree a) (Tree a)

mcss' (Num a, Ord a) => Tree a -> (a, a, a, a)
-- Va a devolver el (suma mas larga actual, sufijo mas largo, prefijo mas largo, suma de toda la secuencia)
mcss' E = error "Tratar de calcular sobre nulo" 
mcss' Leaf a = (max 0 a, max 0 a, max 0 a, a)
mcss' (N l r) = let ((s1,suf1,pre1, l1),(s2,suf2,pre2. l2)) = mcss' l ||| mcss' r
                in (max (max s1 s2) (suf1 + pre2), max suf2 (l2 + suf1), max pre1 (l1 + pre2), l1+l2)
mcss = (\(x,y,z,w) -> x) . mcss'

-- Con map reduce:
-- foldr + e [1,2,3,4] = 1 + (2 +(3 + (4 + e)))
-- reduce + e [1,2,3,4] = (e + (1 + 2) + (3 + 4))
-- reduce se puede implementar de manera eficiente pues es paralelizable mientras que foldr no.

combine (Int, Int, Int, Int) -> (Int, Int, Int, Int) -> (Int, Int, Int, Int)
combine (s1, suf1, pre1, l1) (s2, suf2, pre2, l2) = (max (max s1 s2) (suf1 + suf2), max suf2 (l2 + suf1), max pre1 (l1 + pre2), l1+l2)

e = (0,0,0,0)

f x = (max 0 x, max 0 x, max 0 x, x)

mcssMapReduce = mapreduce f combine e