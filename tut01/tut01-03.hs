-- Aufgabe 3
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' :: Int -> Int
fib' n = fib_help 1 1 n

fib_help :: Int -> Int -> Int -> Int
fib_help x _ 0 = x
fib_help x y n = fib_help y (x+y) (n-1)