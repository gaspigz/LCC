
-- Ejercicio 3

data CList a = EmptyCL | CUnit a | Consnoc a (CList a) a deriving Show

lista1 = Consnoc 1 (Consnoc 2 (CUnit 3) 4) 5
lista2 = CUnit 1
lista3 = EmptyCL
lista4 = Consnoc 6 (Consnoc 2 EmptyCL 5) 3

snocCL :: CList a -> a -> CList a
snocCL EmptyCL a = CUnit a
snocCL (CUnit a) b = Consnoc a EmptyCL b
snocCL (Consnoc a l b) c = Consnoc a (snocCL l b) c

snocCLInverso :: a -> CList a -> CList a
snocCLInverso a EmptyCL = CUnit a
snocCLInverso b (CUnit a) = Consnoc a EmptyCL b
snocCLInverso c (Consnoc a l b) = Consnoc a (snocCL l b) c

consCL :: a -> CList a -> CList a
consCL a EmptyCL = CUnit a
consCL a (CUnit b) = Consnoc a EmptyCL b
consCL a (Consnoc b l c) = Consnoc a (consCL b l) c

headCL :: CList a -> a
headCL (CUnit a) = a
headCL (Consnoc a b c) = a

tailCL :: CList a -> CList a
tailCL EmptyCL = EmptyCL
tailCL (CUnit a) = EmptyCL
tailCL (Consnoc a l c) = snocCL l c

isEmptyCL :: CList a -> Bool
isEmptyCL EmptyCL = True
isEmptyCL _ = False

isCUnit :: CList a -> Bool
isCUnit (CUnit a) = True
isCUnit _ = False

reverseCL :: CList a -> CList a
reverseCL EmptyCL = EmptyCL
reverseCL (CUnit a) = CUnit a
reverseCL (Consnoc a l c) = Consnoc c (reverseCL l) a

mapCL :: (a -> b) -> CList a -> CList b
mapCL f EmptyCL = EmptyCL
mapCL f (CUnit a) = CUnit (f a)
mapCL f (Consnoc a l b) = Consnoc (f a) (mapCL f l) (f b)

inits :: CList a -> CList (CList a)
inits EmptyCL = EmptyCL
inits (CUnit a) = Consnoc EmptyCL EmptyCL (CUnit a)
inits (Consnoc a l b) = let zs = inits (snocCL l b)
                            ys = mapCL (consCL a) zs
                        in
                            consCL EmptyCL ys


tails :: CList a -> CList (CList a)
tails EmptyCL = EmptyCL
tails (CUnit a) = Consnoc EmptyCL EmptyCL (CUnit a)
tails (Consnoc a l b) = let zs = tails (consCL a l)
                            ys = mapCL (snocCLInverso b) zs
                        in
                            consCL EmptyCL ys

appendCL :: CList a-> CList a -> CList a
appendCL a EmptyCL = a
appendCL EmptyCL a = a
appendCL (CUnit a) l = consCL a l
appendCL l (CUnit a)  = snocCL l a
appendCL (Consnoc a l b) c = consCL a (appendCL l (consCL b c))


concatCL :: CList (CList a) -> CList a
concatCL EmptyCL = EmptyCL
concatCL (CUnit a) = a
concatCL (Consnoc a l c) = appendCL a (appendCL (concatCL l) c)

listadelista = Consnoc (CUnit 1) (Consnoc (Consnoc 2 EmptyCL 3) EmptyCL (CUnit 4)) EmptyCL


-- Ejercicio 4

eval :: Exp -> Int
data Exp = Lit Int | Add Exp Exp | Sub Exp Exp | Prod Exp Exp | Div Exp Exp

eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2
eval (Prod e1 e2) = eval e1 * eval e2
eval (Div e1 (Lit 0)) = 0
eval (Div e1 e2) = div (eval e1) (eval e2)

-- 6)
seval :: Exp -> Maybe Int
seval (Lit e) = Just e
seval (Add e1 e2) = case seval e1 of 
    Nothing -> Nothing
    Just n -> case seval e2 of
        Nothing -> Nothing
        Just m -> Just (n + m)

seval (Sub e1 e2) = case seval e1 of
    Nothing -> Nothing
    Just n -> case seval e2 of
        Nothing -> Nothing
        Just m -> Just (n - m)

seval (Prod e1 e2) = case seval e1 of
    Nothing -> Nothing
    Just n -> case seval e2 of
        Nothing -> Nothing
        Just m -> Just (n * m)

seval (Div e1 e2) = case seval e2 of
    Nothing -> Nothing
    Just 0 -> Nothing
    Just m -> case seval e1 of
        Nothing -> Nothing
        Just n -> Just (div n m)

-- Ejercicio 5)

parseRPN :: String -> Exp
parseRPN s = parseS [] s-- parseS de parse stack.

opTop :: (Exp -> Exp -> Exp) -> [Exp] -> String -> Exp
opTop op (x:y:p) s = parseS ((op y x) : p) s
opTop _ _ _ = error "La expresion esta mal formada. "

getFirst :: String -> (String, String) -- Lo primero que encuentra y el resto del string.
getFirst s = aux "" (deleteSp s)
    where
        deleteSp (' ' :s) = deleteSp s
        deleteSp s = s
        aux actual_leido "" = ((reverse actual_leido) , "")
        aux actual_leido (' ' : s) = ((reverse actual_leido), (deleteSp s)) -- Aprovecho y le saco los espacios
        aux actual_leido ('+' : s) = if (actual_leido == []) then ("+", deleteSp s) else error "Mal formada. " 
        aux actual_leido ('-' : s) = if (actual_leido == []) then ("-", deleteSp s) else error "Mal formada. " 
        aux actual_leido ('*' : s) = if (actual_leido == []) then ("*", deleteSp s) else error "Mal formada. " 
        aux actual_leido ('/' : s) = if (actual_leido == []) then ("/", deleteSp s) else error "Mal formada. " 
        aux actual_leido (c : s) = aux (c : actual_leido) s -- Voy formando el numero. Se forma al reves por eso el reverse.


parseS :: [Exp] -> String -> Exp
parseS p "" = if (length p == 1) then head p else error "La expresion esta mal formada. "
parseS p s = case x of
    "+" -> opTop Add p s'-- Opera los de arriba
    "-" -> opTop Sub p s'
    "*" -> opTop Prod p s'
    "/" -> opTop Div p s'
    n -> parseS ((Lit (read n)) : p) s' -- Read convierte el string "5" al Int 5, o el "69" a 69. Etc.
    where (x,s') = getFirst s






