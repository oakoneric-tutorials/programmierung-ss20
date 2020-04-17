-- Aufgabe 3

data BinTree = Branch Int BinTree BinTree | Nil deriving (Show)

BinTree1 :: BinTree -- Suchbaum
BinTree1 = Branch 5
        (   Branch 3
            (Branch 2 Nil Nil)
            (Branch 4 Nil Nil)
        )
        (
            Branch 8
            (   Branch 7
                (Branch 6 Nil Nil)
                (Nil)
            )
            (   Branch 10
                (Nil)
                (Branch 13 Nil Nil)
            )
        )

BinTree2 :: BinTree -- kein Suchbaum
BinTree2 = Branch 5
    (Branch 3
        (Branch 2 Nil Nil)
        (Branch 6 Nil Nil)
    )
    (Branch 8
        (Branch 7
            (Branch 8 Nil Nil)
            Nil)
        (Branch 10
            (Branch 15 Nil Nil)
            (Branch 1 Nil Nil)
        )
    )

-- (a) Schlüssel einfügen
insert :: BinTree -> [Int] -> BinTree
insert t     [] = t
insert t (x:xs) = insert t' xs
  where
    t' = insertSingle t x
    insertSingle Nil            x = Branch x Nil Nil
    insertSingle (Branch y l r) x
      | x < y     = Branch y (insertSingle l x) r
      | otherwise = Branch y l                  (insertSingle r x)
      

-- oder:
insert' :: BinTree -> [Int] -> BinTree
insert' t   []     = t
insert' Nil (x:xs) = insert' (Branch x Nil Nil) xs
insert' (Branch n t1 t2) (x:xs)
    | x < n     = insert' (Branch n (insert t1 [x]) t2) xs
    | otherwise = insert' (Branch n t1 (insert t2 [x])) xs



-- (b) Test auf Baum-Gleichheit
equal :: BinTree -> BinTree -> Bool
equal Nil              Nil              = True
equal Nil              (Branch y l2 r2) = False
equal (Branch x l1 r1) Nil              = False
equal (Branch x l1 r1) (Branch y l2 r2)
      = (x == y) && (equal l1 l2) && (equal r1 r2)


{- Operatornotation.
   Wir können eine Funktion in backticks "`" schreiben und diese damit in Infixnotation verwenden.
   Operatorpriorität: geringer als Präfixnotation, aber höher als Logikoperatoren
-}

equal' :: BinTree -> BinTree -> Bool
equal' Nil              Nil              = True
equal' Nil              (Branch y l2 r2) = False
equal' (Branch x l1 r1) Nil              = False
equal' (Branch x l1 r1) (Branch y l2 r2)
      = (x == y) && (l1 `equal'` l2) && (r1 `equal'` r2)
      -- aufgrund der Operatorpriorität könnte man hier auch alle Klammern weglassen

{- Bemerkung zur Nutzung von wildcards in equal
   Die Pattern werden immer von oben nach unten "durchprobiert", d.h. wir können die beiden Fälle, dass je eines der Argumente Nil sind, auch in einen Fall zusammenfassen und diesen *unter* den allgemeinen Fall mit zwei Wildcards schreiben (somit wird dieser Fall nur gemachted, wenn keiner der beiden anderen matched.
   Vertauschen wir die beiden Fälle (wildcards vor allgemeinem Fall), dann meldet ghci auch Redundanz in den Patterns.
-}

equal'' :: BinTree -> BinTree -> Bool
equal'' Nil Nil = True
equal'' (Branch x l1 r1) (Branch y l2 r2)
      = (x == y) && (equal'' l1 l2) && (equal'' r1 r2)
equal'' _   _   = False