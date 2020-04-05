-- Aufgabe 2(a)
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

-- Aufgabe 2(b)
sumFacs :: Int -> Int -> Int
sumFacs n m
    | n > m = 0
    | otherwise = fac n + sumFacs (n+1) m