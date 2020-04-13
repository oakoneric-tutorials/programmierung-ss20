-- Aufgabe 1

-- (a) Produkt der Listenelemente
prod :: [Int] -> Int

-- cons Operator ":" trennt head und tail einer Liste

------------------------------------------------------------------------

-- (b) Umkehrung einer Liste
rev :: [Int] -> [Int]

-- mit ++ können Listen zusammengeführt werden

------------------------------------------------------------------------

-- (c) Entfernen von Listenelementen
excl :: Int -> [Int] -> [Int]

-- /= wird verwendet, um auf Ungleichheit zu prüfen
-- Es gilt: not (x == n) <=> x /= n

------------------------------------------------------------------------

-- (d) Sortierung prüfen
isOrd :: [Int] -> Bool


------------------------------------------------------------------------

-- (e) sortiertes Zusammenfügen zweier Listen
merge :: [Int] -> [Int] -> [Int]


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


fibs' :: [Int]


fibs'' :: [Int]


-- take 7 fibs liefert die ersten 7 Fibonacci-Zahlen
-- interessant sind insbesondere die Werte größer als 30