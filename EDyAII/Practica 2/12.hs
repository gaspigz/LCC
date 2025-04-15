type NumBin = [Bool]
-- donde el valor False representa el n´umero 0 y True el 1. 
-- Definir las siguientes operaciones tomando como convenci´on
-- una representaci´on Little-Endian (i.e. el primer elemento de las lista de d´ıgitos es el d´ıgito 
-- menos significativo del n´umero representado).

-- and_lista_tuplas :: [(Bool, Bool)] -> NumBin



suma_binaria :: NumBin -> NumBin -> NumBin

suma_binaria a [] = a
suma_binaria [] b = b

suma_binaria (x:xs) (y:ys)
    | (not x) && (not y) = False : (suma_binaria xs ys)
    | (not x) && y = True : (suma_binaria xs ys)
    | x && (not y) = True : (suma_binaria xs ys)

    | x && y = False : suma_binaria (suma_binaria [True] xs) ys

comp_binaria :: NumBin -> NumBin -> Bool
comp_binaria [] [] = True
comp_binaria a [] = False
comp_binaria [] b = False
comp_binaria (x:xs) (y:ys)
    | x == y = True && (comp_binaria xs ys)
    | otherwise = False

prod_binario :: NumBin -> NumBin -> NumBin

prod_binario a [] = [False]
prod_binario [] b = [False]
prod_binario a [False] = [False]
prod_binario [False] b = [False]

prod_binario a b = prod_binario_aux a b [True]

prod_binario_aux :: NumBin -> NumBin -> NumBin -> NumBin
prod_binario_aux x y z
    | comp_binaria z y = x
    | otherwise = suma_binaria x (prod_binario_aux x y (suma_binaria [True] z))

nB1 = [True, False, False]
nB2 = [False, False, False]
nB3 = [True, True, True]
nB4 = [True, False, True]

cocientePorDos :: NumBin -> NumBin
cocientePorDos [] = []
cocientePorDos (x:xs) = xs

moduloDos :: NumBin -> NumBin
moduloDos [] = []
moduloDos (x:xs) = [x]