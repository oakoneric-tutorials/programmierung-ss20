-- Aufgabe 1

-- (a) Produkt der Listenelemente
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs
-- cons Operator ":" trennt head und tail einer Liste

-- oder:
prod' :: [Int] -> Int
prod' x = foldl (*) 1 x

------------------------------------------------------------------------

-- (b) Umkehrung einer Liste
rev :: [Int] -> [Int]
rev [] = []
rev (x:xs) = rev xs ++ [x]
-- mit ++ können Listen zusammengeführt werden

------------------------------------------------------------------------

-- (c) Entfernen von Listenelementen
excl :: Int -> [Int] -> [Int]
excl _ [] = []
excl n (x:xs)
  | x /= n = x : excl n xs -- ebenso moeglich: x /= n = [x] ++ excl n xs
  | otherwise = excl n xs

-- /= wird verwendet, um auf Ungleichheit zu prüfen
-- Es gilt: not (x == n) <=> x /= n

-- oder:
excl' :: Int -> [Int] -> [Int]
excl' _ [] = []
excl' n (x:xs)
  | x == n = excl' n xs
  | otherwise = x : excl' n xs

-- oder etwas kürzer:
excl'' :: Int -> [Int] -> [Int]
excl'' n list = [x | x <- list , x /= n]

------------------------------------------------------------------------

-- (d) Sortierung prüfen
isOrd :: [Int] -> Bool
isOrd [] = True
isOrd [x] = True
isOrd (x:y:xs)
  | x <= y = isOrd (y:xs)
  | otherwise = False

-- oder etwas kürzer:
isOrd' :: [Int] -> Bool
isOrd' [] = True
isOrd' [x] = True
isOrd' (x:y:xs) = x <= y && isOrd' (y:xs)

------------------------------------------------------------------------

-- (e) sortiertes Zusammenfügen zweier Listen
merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x < y = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

-- oder:
merge' :: [Int] -> [Int] -> [Int]
merge' [] ys = ys
merge' xs [] = xs
merge' xxs@(x:xs) yys@(y:ys)
  | x < y = x : merge' xs yys
  | otherwise = y : merge' xxs ys

------------------------------------------------------------------------

-- (f) Fibonacci-Liste
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' :: Int -> Int
fib' i = stack 1 1 i
    where stack f0 f1 0 = f0
          stack f0 f1 i = stack f1 (f0 + f1) (i-1)


fibs :: [Int]
fibs = fibAppend 0
  where
    fibAppend x = fib x : fibAppend (x+1)

fibs' :: [Int]
fibs' = fibAppend 0
  where
    fibAppend x = fib' x : fibAppend (x+1)

fibs'' :: [Int]
fibs'' = fibs' 0 1
  where
    fibs''' n m = n : fibs''' m (n+m)

-- take 7 fibs liefert die ersten 7 Fibonacci-Zahlen
-- interessant sind insbesondere die Werte größer als 30