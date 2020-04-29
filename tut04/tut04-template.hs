-- Aufgabe 1
data BinTree a = Branch a (BinTree a) (BinTree a) | Leaf a deriving Show

testTree :: BinTree Int
testTree = 

-- Aufgabe 1 (b)
depth :: BinTree a -> Int
depth  = 
depth  = 
-- Hinweis: Die Funktion min ist in der Haskell-Standardbibliothek vorhanden.

-- Aufgabe 1 (c)
paths :: BinTree a -> BinTree [a]
paths = 
  where
    

-- Aufgabe 1 (d)
tmap :: (a -> b) -> BinTree a -> BinTree b
tmap   = 
tmap   = 

-- Aufgabe 2 (a)
unpairs :: [(a, b)] -> ([a], [b])
unpairs  = 
unpairs  = let 
           in 
-- unpairs is als unzip in der Haskell-Standardbibliothek bereits vorhanden

-- Aufgabe 2 (b)
{-
  map (uncurry (+)) [(1,2), (3,4)]
   
-}

-- Zusatzaufgabe 1 (a)
check :: BinTree Bool -> Bool
check  = 
check  = 
check  =  

-- Zusatzaufgabe 1 (b)
toList :: BinTree a -> [a]
toList  = 
toList  = 

-- Zusatzaufgabe 1 (c)
toTree :: [Int] -> BinTree Int
toTree  = 
toTree  =