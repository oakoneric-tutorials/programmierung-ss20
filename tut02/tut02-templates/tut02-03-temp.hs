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



-- (b) Test auf Baum-Gleichheit
equal :: BinTree -> BinTree -> Bool



{- Operatornotation.
   Wir können eine Funktion in backticks "`" schreiben und diese damit in Infixnotation verwenden.
   Operatorpriorität: geringer als Präfixnotation, aber höher als Logikoperatoren
-}
