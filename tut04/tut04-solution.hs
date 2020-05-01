-- Aufgabe 1
data BinTree a = Branch a (BinTree a) (BinTree a) | Leaf a deriving Show

testTree :: BinTree Int
testTree = Branch 5
             (Leaf 1)
             (Branch 12
               (Branch 4
                 (Leaf 0)
                 (Leaf 0))
               (Branch 12
                 (Leaf 0)
                 (Leaf 1)))

-- Aufgabe 1 (b)
depth :: BinTree a -> Int
depth (Leaf   _    ) = 1
depth (Branch _ l r) = 1 + min (depth l) (depth r)
-- Hinweis: Die Funktion min ist in der Haskell-Standardbibliothek vorhanden.

-- Aufgabe 1 (c)
paths :: BinTree a -> BinTree [a]
paths = go []
  where
    go :: [a] -> BinTree a -> BinTree [a]
    go prefix (Leaf   x    ) = Leaf   (prefix ++ [x])
    go prefix (Branch x l r) = Branch (prefix ++ [x]) (go (prefix ++ [x]) l) (go (prefix ++ [x]) r)
-- oder:
-- go prefix (Leaf   x    ) = Leaf   (reverse (x:prefix))
-- go prefix (Branch x l r) = let prefix' = x:prefix
--                            in Branch (reverse prefix') (go (prefix') l) (go (prefix') r)

-- Aufgabe 1 (d)
tmap :: (a -> b) -> BinTree a -> BinTree b
tmap f (Leaf   x    ) = Leaf   (f x)
tmap f (Branch x l r) = Branch (f x) (tmap f l) (tmap f r)

-- Aufgabe 2 (a)
unpairs :: [(a, b)] -> ([a], [b])
unpairs []          = ([], [])
unpairs ((a, b):xs) = let (as, bs) = unpairs xs
                      in (a:as, b:bs)
-- oder:
unpairs' :: [(a, b)] -> ([a], [b])
unpairs' []          = ([], [])
unpairs' ((a,b):xs) = (a:as, b:bs)
    where (as, bs)  = unpairs' xs
    
-- unpairs is als unzip in der Haskell-Standardbibliothek bereits vorhanden

-- Aufgabe 2 (b)
{-
  map (uncurry (+)) [(1,2), (3,4)]
   = map (uncurry (+)) ((1,2):[(3,4)])
   = uncurry (+) (1,2) : map (uncurry (+)) [(3,4)]
   = (1 + 2) : map (uncurry (+)) [(3,4)]
   = 3 : map (uncurry (+)) [(3,4)]
   = 3 : map (uncurry (+)) ((3,4);[])
   = 3 : uncurry (+) (3,4) : map (uncurry (+)) []
   = 3 : (3 + 4) : map (uncurry (+)) []
   = 3 : 7 : map (uncurry (+)) []
   = 3 : 7 : []
   = [3, 7]
-}

-- Zusatzaufgabe 1 (a)
check :: BinTree Bool -> Bool
check (Leaf   False    ) = True
check (Leaf   True     ) = False
check (Branch _     l r) = check l || check r

-- Zusatzaufgabe 1 (b)
toList :: BinTree a -> [a]
toList (Leaf   x    ) = []
toList (Branch _ l r) = toList r ++ toList l

-- Zusatzaufgabe 1 (c)
toTree :: [Int] -> BinTree Int
toTree     [] = Leaf   42
toTree (x:xs) = Branch 23 (Leaf x) (toTree xs)