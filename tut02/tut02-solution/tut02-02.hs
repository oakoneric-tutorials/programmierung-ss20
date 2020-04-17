-- Aufgabe 2

-- (a) Wörter aneinanderfügen

join :: [String] -> String
join [] = ""
join [x] = x 
join (x:xs) = x  ++ ' ' : join xs
-- oder: join (x:xs) = x  ++ " " ++ join xs


-- (b) Wörter trennen
unjoin :: String -> [String]
unjoin s = f [] s
    where
        f save [] = [save]
        f save (c:cs)
            | c == ' ' = save : f [] cs
            | otherwise = f (save ++ [c]) cs


-- oder:
unjoin' :: String -> [String]
unjoin' [] = []
unjoin' (' ':cs) = unjoin' cs
unjoin' cs = let (w, cs') = takeWord cs in w : unjoin' cs'
    where
        takeWord [] = ([], [])
        takeWord (' ':cs) = ([], cs)
        takeWord (c:cs) = let (w, cs') = takeWord cs in (c:w, cs')


-- oder (Musterlösung)
unjoin'' :: String -> [String]
unjoin''     [] = []
unjoin''    [c] = if c == ' ' then [[], []] else [[c]]
unjoin'' (c:cs)
  | c == ' '  = [] : unjoin'' cs
  | otherwise = let (s:ss) = unjoin'' cs
                in ((c:s):ss)