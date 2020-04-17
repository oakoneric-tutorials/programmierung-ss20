-- Übungsblatt 2

-- Aufgabe 1 (a)
prod :: [Int] -> Int
prod []     = 1
prod (x:xs) = x * prod xs

-- Aufgabe 1 (b)
rev :: [Int] -> [Int]
rev []     = []
rev (x:xs) = rev xs ++ [x]

-- Aufgabe 1 (c)
excl :: Int -> [Int] -> [Int]
excl _  []    = []
excl y (x:xs)
  | x == y    = excl y xs
  | otherwise = x : excl y xs

-- Aufgabe 1 (d)
isOrd :: [Int] -> Bool
isOrd []      = True
isOrd [x]     = True
isOrd (x:y:xs) = x <= y && isOrd (y:xs)

-- Aufgabe 1 (e)
merge :: [Int] -> [Int] -> [Int]
merge []     ys    = ys
merge xs     []    = xs
merge (x:xs) (y:ys)
  | x < y     = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

-- Aufgabe 1 (f)
fibs :: [Int]
fibs = fibs' 0 1
  where
    fibs' n m = n : fibs' m (n+m)

-- Aufgabe 2 (a)
join :: [String] -> String
join [] = ""
join [x] = x 
join (x:xs) = x  ++ ' ' : join xs

-- Aufgabe 2 (b)
unjoin :: String -> [String]
unjoin s = f [] s
    where
        f save [] = [save]
        f save (c:cs)
            | c == ' ' = save : f [] cs
            | otherwise = f (save ++ [c]) cs


-- Aufgabe 3
data BinTree = Branch Int BinTree BinTree | Nil

-- Aufgabe 3 (a)
insert :: BinTree -> [Int] -> BinTree
insert t     [] = t
insert t (x:xs) = insert t' xs
  where
    t' = insertSingle t x
    insertSingle Nil            x = Branch x Nil Nil
    insertSingle (Branch y l r) x
      | x < y     = Branch y (insertSingle l x) r
      | otherwise = Branch y l                  (insertSingle r x)


-- Aufgabe 3 (b)
equal :: BinTree -> BinTree -> Bool
equal Nil              Nil              = True
equal Nil              (Branch y l2 r2) = False
equal (Branch x l1 r1) Nil              = False
equal (Branch x l1 r1) (Branch y l2 r2)
      = (x == y) && (equal l1 l2) && (equal r1 r2)

-- Zusatzaufgabe 1 (a)
pack [] = []
pack (x:xs) = ys : pack zs
  where
    (ys, zs) = takeall x (x:xs)
    takeall _ [] = ([], [])
    takeall x (y:ys)
      | x == y = let (us, vs) = takeall x ys
                 in  (y:us, vs)
      | otherwise = ([], (y:ys))

-- Zusatzaufgabe 1 (b)
encode xs = e' (pack xs)
  where e' [] = []
        e' (y:ys) = (head y, length y) : e' ys

-- Zusatzaufgabe 1 (c)
decode [] = []
decode ((n, x) : xs) = times n x : decode xs
  where
    times 0 x = []
    times n x = x : times (n-1) x

-- Zusatzaufgabe 1 (d)
rotate :: [Int] -> Int -> [Int]
rotate [] _ = []
rotate xss@(x:xs) n
  | n == 0    = xss
  | n < 0     = rotate xss (length xss + n)
  | otherwise = rotate (xs ++ [x]) (n - 1)

-- Zusatzaufgabe 2
data RoseTree = Node String [RoseTree]

-- Zusatzaufgabe 2 (a)
roseTest :: RoseTree
roseTest = Node "6" [Node "5" [], Node "4" [Node "3" [], Node "2" []], Node "1" []]

-- Zusatzaufgabe 2 (b)
level :: Int -> RoseTree -> [String]
level 0 (Node x  _    ) = [x]
level n (Node _  []   ) = []
level n (Node x (t:ts)) = level (n-1) t ++ level n (Node x ts)