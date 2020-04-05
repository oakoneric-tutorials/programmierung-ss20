# Übung 1: Einführung in Haskell

## Übungsinhalt
Implementierung elementarer Funktionen in Haskell
- Fakutltät
- Fibonacci-Zahlen
- Operationen auf Listen (Aufmultiplizieren, Löschen, Sortierung, Umkehren, Zusammenfügen)

## Einstieg in Haskell
Haskell-Dateien können in einem beliebigen Editor geschrieben werden. Zum Ausführen benötigt man z.B. den Glasgow Haskell Compiler ([Download hier](https://www.haskell.org/ghc/)). Dessen interaktive Oberfläche startet man in einem Terminal mit `ghci`. Anschließend kann man ähnlich wie in Matlab bereits Befehle mit den Standardfunktionen aus der Prelude-Bibliothek aufrufen (z.B. liefert die Eingabe `2+3` die Ausgabe `5`).

Wir schreiben unsere Funktionen meist in Module, die bereits beim Start von `ghci` geladen werden können mit `ghci <modulname>`. Später ist das Laden von Modulen mit `:load <modulname>` möglich. Bereits geladenen Module können mit `:r` neu geladen werden. Für weitere Informationen kann man mit dem Befehl `:?` die Hilfefunktion starten.

Ist das gewünscht Modul geladen, so können wir unsere Funktionen einfach mit den entsprechenden Argumenten ausführen, beispielsweise liefert die Eingabe `fac 3` das Ergebnis `6` (vgl. Aufgabe 1, `01_01_solution.hs`).

## Listen

Listen sind in Haskell homogene Datentypen, d.h. alle Elemente einer Liste sind vom gleichen Datentyp. Wichtige Operatoren:
* Der **cons-Operator** `:` trennt den _head_ vom _tail_ einer Liste, z.B.
```haskell
[x1 , x2 , x3 , x4 , x5] = x1 : [x2 , x3 , x4 , x5] = x1 : x2 : [x3 , x4 , x5] = x1 : (x2 : [x3 , x4 , x5])
```
Beim Pattern Matching ist zu beachten, dass `[x]` auf das Pattern `(x:xs)` matched (da `x:[]`), aber `[]` matched nicht auf dieses Pattern, da kein abspaltbares Element `x` in `[]` existiert.

* Der **Verkettungsoperator** `++` verknüpft zwei Listen gleichen Typs miteinander, z.B.
```haskell
[x1 , x2 , x3] ++ [x4 , x5] = [x1 , x2 , x3 , x4 , x5]
```
Dabei müssen alle Operatoren vom Typ Liste sein, d.h. um ein einzelnes Element anzuhängen, muss es in eine Liste geschrieben werden. Man beachte dabei den Unterschied zum cons-Operator.
```haskell
[x1] ++ [x2 , x3 , x4] = [x1 , x2 , x3 , x4] = x1 : [x2 , x3 , x4]
```

Insbesondere sind beide Operatoren _rechtsassoziativ_, d.h. `a : b : c = a : (b : c)` und `a ++ b ++ c = a ++ (b ++ c)`.

## Laufzeit der Fibonacci-Funktion
Bei der rekursiven Implementierung `fib` der Fibonacci-Zahlen sind ab `n > 30` deutliche Laufzeitdefizite zu bemerken. Man beachte dabei die exponentielle Laufzeitzunahme. Deswegen kann man die Fibonacci-Zahlen auch nicht-rekursiv implementieren (vgl. `fib'`).

Ein Laufzeittest lohnt sich vor allem in Zusammenhang mit der Funktion aus der ersten Zusatzaufgabe (`01_04Z_solution.hs`). Dort kann man sich mit `take <anzahl> fibs` eine Liste mit `<anzahl>` vielen Fibonacci-Zahlen generieren lassen.
Es sind bereits beide Varianten fertig implementiert, d.h. `fibs` sollte deutlich langsamer sein als `fibs'`.

Um die exakten Laufzeiten zu erhalten, kann man vor dem Ausführen der Funktion mit dem Befehl `:set +s` die Laufzeitmessung in `ghci` aktivieren.
