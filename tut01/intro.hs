-- einzeiliger Kommentar
{- 
mehrzeiliger
Kommentar
-}

-- simple equation
square :: Int -> Int
square x = x*x

-- Pattern matching
add :: Int -> Int -> Int
add n 0 = n
add n m = 1 + add n (m-1)


{-
add 3 0 = 3 (erste Zeile)
add 3 1     (zweite Zeile)
-}

-- conditional equation
max' :: Int -> Int -> Int
max' x y | x > y     = x
         | otherwise = y 

max'' :: Int -> Int -> Int
max'' x y = if x > y
            then x
            else y
            
            
            
            
            
            
            
            