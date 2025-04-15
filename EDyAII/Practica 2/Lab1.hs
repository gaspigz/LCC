module Lab01 where

import Data.List

{-
1) Corregir los siguientes programas de modo que sean aceptados por GHCi.
-}

-- a)
notMio b = case b of
    True -> False
    False -> True

-- b)
inaux [x]         =  []
inaux (x:xs)      =  x : inaux xs
inaux []          =  error "empty list"

-- c)
lengthMio []        =  0
lengthMio (_:l)     =  1 + lengthMio l

-- d)
list123 = 1 : (2 : (3 : []))

-- e)
[]     ++! ys = ys
(x:xs) ++! ys = x : xs ++! ys

-- f)
addToTail x xs = map (+x) (tail xs)

-- g)
listmin xs = (head . sort) xs

-- h) (*)
smap f [] = []
smap f [x] = [f x]
smap f (x:xs) = f x : smap f xs

{-
2. Definir las siguientes funciones y determinar su tipo:

a) five, que dado cualquier valor, devuelve 5


b) apply, que toma una función y un valor, y devuelve el resultado de
aplicar la función al valor dado

c) ident, la función identidad

d) first, que toma un par ordenado, y devuelve su primera componente

e) derive, que aproxima la derivada de una función dada en un punto dado

f) sign, la función signo

g) vabs, la función valor absoluto (usando sign y sin usarla)

h) pot, que toma un entero y un número, y devuelve el resultado de
elevar el segundo a la potencia dada por el primero

i) xor, el operador de disyunción exclusiva

j) max3, que toma tres números enteros y devuelve el máximo entre llos

k) swap, que toma un par y devuelve el par con sus componentes invertidas
-}

five _ = 5

apply f x = f x

ident x = x

first (a,b) = a

derive f x = ((f (x + 0.0001)) - f x) / 0.0001

sign :: Int -> Int
sign n
    | n == 0 = 0
    | n > 0 = 1
    | otherwise = -1

vabs_sign n = n * sign n

vabs n
    | n >= 0 = n
    | otherwise = (-n)

pot :: Num a => Int -> a -> a
pot 0 _ = 1
pot p b = b * (pot (p - 1) b)

xor :: Eq a => a -> a -> Int
xor a b
    | a == b = 0
    | otherwise = 1

max3 :: Ord a => a -> a -> a -> a
max3 a b c
    | (a >= b) && (a >= c) = a
    | (b >= a) && (b >= c) = b
    | otherwise = c

swap :: (a , b) -> (b, a)
swap (x,y) = (y,x)
{- 
3) Definir una función que determine si un año es bisiesto o no, de
acuerdo a la siguiente definición:

año bisiesto 1. m. El que tiene un día más que el año común, añadido al mes de febrero. Se repite
cada cuatro años, a excepción del último de cada siglo cuyo número de centenas no sea múltiplo
de cuatro. (Diccionario de la Real Academia Espaola, 22ª ed.)

¿Cuál es el tipo de la función definida?
-}
esBis n
    | (n `mod` 4) == 0 && (n + 4) < (((n `div` 100) + 1) * 100) = True -- ((n mod 100) + 1) * 100 me da el inicio del siglo siguiente ej si n = 1996 da 2000
    | (n + 4) >= (((n `div` 100) + 1) * 100) && (((n `mod` 1000) `div` 100) `mod` 4) == 0 = True -- Osea estoy en el ultimo de un siglo
    | otherwise = False
-- Consideré 1996 no bisiesto y 2000 si lpm ahi lo hago de la otra forma (NO DEBE SER MULT DE 100)

esBisiesto :: Int -> Bool
esBisiesto n = (mod n 4 == 0) && (mod n 100 /= 0 || mod n 400 == 0)
-- 100 no es pero 2000 si virgo a pedal.

{-
4)

Defina un operador infijo *$ que implemente la multiplicación de un
vector por un escalar. Representaremos a los vectores mediante listas
de Haskell. Así, dada una lista ns y un número n, el valor ns *$ n
debe ser igual a la lista ns con todos sus elementos multiplicados por
n. Por ejemplo,

[ 2, 3 ] *$ 5 == [ 10 , 15 ].

El operador *$ debe definirse de manera que la siguiente
expresión sea válida:

-}

infixl 6 *$

(*$) :: [Int] -> Int -> [Int]

[] *$ _ = []
(x:xs) *$ n = (n*x : (xs *$ n))

v = [1, 2, 3] *$ 2 *$ 4


{-
5) Definir las siguientes funciones usando listas por comprensión:

a) 'divisors', que dado un entero positivo 'x' devuelve la
lista de los divisores de 'x' (o la lista vacía si el entero no es positivo)

b) 'matches', que dados un entero 'x' y una lista de enteros descarta
de la lista los elementos distintos a 'x'

c) 'cuadrupla', que dado un entero 'n', devuelve todas las cuadruplas
'(a,b,c,d)' que satisfacen a^2 + b^2 = c^2 + d^2,
donde 0 <= a, b, c, d <= 'n'

(d) 'unique', que dada una lista 'xs' de enteros, devuelve la lista
'xs' sin elementos repetidos
-}

unique :: [Int] -> [Int]
unique xs = [x | (x,i) <- zip xs [0..], not (elem x (take i xs))]

{- 
6) El producto escalar de dos listas de enteros de igual longitud
es la suma de los productos de los elementos sucesivos (misma
posición) de ambas listas.  Definir una función 'scalarProduct' que
devuelva el producto escalar de dos listas.

Sugerencia: Usar las funciones 'zip' y 'sum'. -}
mult_list_tup :: Num a => [(a,a)] -> [a]
mult_list_tup [] = [0]
mult_list_tup ((a,b):xs) = (a*b) : (mult_list_tup xs)

scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct xs ys = sum (mult_list_tup (zip xs ys))

-- Ignora si una lista tiene mas elementos que la otra solo mira los primeros n (n siendo el menor entre los largos de ambas listas)

{-
7) Definir mediante recursión explícita
las siguientes funciones y escribir su tipo más general:

a) 'suma', que suma todos los elementos de una lista de números

b) 'alguno', que devuelve True si algún elemento de una
lista de valores booleanos es True, y False en caso
contrario

c) 'todos', que devuelve True si todos los elementos de
una lista de valores booleanos son True, y False en caso
contrario

d) 'codes', que dada una lista de caracteres, devuelve la
lista de sus ordinales

e) 'restos', que calcula la lista de los restos de la
división de los elementos de una lista de números dada por otro
número dado

f) 'cuadrados', que dada una lista de números, devuelva la
lista de sus cuadrados

g) 'longitudes', que dada una lista de listas, devuelve la
lista de sus longitudes

h) 'orden', que dada una lista de pares de números, devuelve
la lista de aquellos pares en los que la primera componente es
menor que el triple de la segunda

i) 'pares', que dada una lista de enteros, devuelve la lista
de los elementos pares

j) 'letras', que dada una lista de caracteres, devuelve la
lista de aquellos que son letras (minúsculas o mayúsculas)

k) 'masDe', que dada una lista de listas 'xss' y un
número 'n', devuelve la lista de aquellas listas de 'xss'
con longitud mayor que 'n' -}

suma :: Num a => [a] -> a
suma [] = 0
suma (x:xs) = x + suma xs

algunos :: [Bool] -> Bool
algunos [] = False
algunos (x:xs)
    | x = x
    | otherwise = algunos xs

todos :: [Bool] -> Bool
todos [] = False
todos (x:xs) = x && (todos xs)

restos :: Integral a => [a] -> a -> [a]
restos [] _ = []
restos _ 0 = error "Div cero"
restos (x:xs) d = (mod x d) : (restos xs d)

long_list :: [a] -> Int
long_list [] = 0
long_list (x:xs) = 1 + long_list xs

masDe :: [[a]] -> Int -> [[a]]
masDe _ 0 = [[]]
masDe [[]] _ = [[]]
masDe (xs:xss) n
    | (long_list xs) > n = xs : (masDe xss n)
    | otherwise = (masDe xss n)