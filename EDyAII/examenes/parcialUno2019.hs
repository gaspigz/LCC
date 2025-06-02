data Treap p k = E | N (Treap p k) p k (Treap p k)

-- Mirando las claves es un BST

-- Mirando las prioridades es un max-heap

key :: Treap p k -> k
key E = error "Una hoja no tiene key"
key (N _ p k _) = k

priority :: Treap p k -> p
priority E = error "Una hoja no tiene prioridad"
priority (N _ p k _) = p

isTreap :: (Ord p, Ord k) => Treap p k -> Bool
isTreap E = True
isTreap (N l p k r) =
                     (isTreap r) && (isTreap l) && 
                     (isE l || (key l < k && priority l <= p)) &&
                     (isE r || (k < key r && priority r <= p))


rotateL (N l' p' k' (N l p k r)) = N (N l' p' k' l) p k r
rotateL r = r 
rotateR (N (N l p k r) p' k' r') = N l p k (N r p' k' r')
rotateR l = l

isE :: Treap p k -> Bool
isE E = True
isE(N _ _ _ _) = False


insert :: (Ord k) => Treap Int k -> Int -> k -> Treap Int k
insert E p k = N E p k E
insert (N l prioridad clave r) p k
    | k == clave = (N l (prioridad + 1) clave r)
    | k > clave = 
        let nueva_derecha = (insert r p k) in
            if isTreap nueva_derecha
            then N l p k nueva_derecha
            else N l p k (rotateL nueva_derecha)
    | otherwise = let nueva_izquierda = (insert l p k) in
        if isTreap nueva_izquierda
        then N nueva_izquierda p k r
        else N (rotateR nueva_izquierda) p k r

showTreap :: (Show p, Show k) => Treap p k -> String
showTreap t = go t 0
  where
    go E _ = ""
    go (N l p k r) indent =
      go r (indent + 4) ++
      replicate indent ' ' ++ show (p, k) ++ "\n" ++
      go l (indent + 4)

ejemplo :: Treap Int Char

ejemplo = N (N (N E 2 'a' E) 4 'c' (N E 0 'e' E)) 9 'h' (N E 7 'j' E)

main = putStrLn $ showTreap ejemplo