data T123 a = E 
    | N1 a (T123 a) (T123 a)
    | N2 a a (T123 a) (T123 a) (T123 a)
    | N3 a a a (T123 a) (T123 a) (T123 a) (T123 a)

data Color = R | B
data RBT a = Empty | N Color a (RBT a) (RBT a)

rbt2t123 :: RBT a -> T123 a
rbt2t123 Empty = E
rbt2t123 (N B x (N R y h1 h2) (N R z h3 h4)) = 
    let ((r1,r2),(r3,r4)) = ( rbt2t123 h1 ||| rbt2t123 h2) ||| (rbt2t123 h3 ||| rbt2t123 h4)
    N3 y x z r1 r2 r3 r4
rbt2t123 (N B x (N R y h1 h2) r) = N2 y x (rbt2t123 h1) (rbt2t123 h2) (rbt2t123 r)
rbt2t123 (N B x l (N R y h1 h2)) = N2 y x (rbt2t123 h1) (rbt2t123 h2) (rbt2t123 l)
rbt2t123 (N B x l r) = N1 x (rbt2t123 l) (rbt2t123 r)

-- Donde hi sera NEGRO O HOJA nunca ROJO pues tienen padres rojos. Siempre mete los rojos en los nodos.
-- Hay cuatro computos independientes, todas las recursivas de rbt2t123