-- Willkommen, dies ist eine hs datei.
-- Zeilen die mit 2 minus-Symbolen beginnen sind kommentare
{- geschweifte Klammer und Minus beginnen mehrzeilige
Kommentare... Also hier immer
noch ein Kommentar.
geschlossen wird mit -}
-- Zur Einleitung: Haskell ist funktional, also ist alles was
-- wir definieren (fast) immer eine funktion.
-- Zum aufrufen kann entweder die interaktive umgebung genutzt werden,
-- Zum beispiel zum testen,
-- ansonsten kann auch der compiler selbst genutzt werden. 
-- BEGINN:
-- Eine Funktion kann einfach einen Wert ausgeben
funktiondrei = 3
{- AUFRUF:
> funktiondrei
3 
-}
-- Eine Funktion kann (beliebig viele Parameter kriegen) 
-- diese Parameter oder auch Argumente stehen mit leerzeichen getrennt
-- VOR dem gleichheitszeichen.
summiere_vier a b c d = a + b + c + d
{- AUFRUF:
*Main> summierevier 3 4 5 6
18
*Main> summierevier 1 2 1 1
5
-}
--Eine funktion kann feste werte bei bestimmten eingaben haben
beidreiseivier 3 = 4
-- oder ansonsten immer nur unveraendert.
beidreiseivier x = x
-- Auch wenn das jetzt erstmal unsinnig erscheint, ist diese Fallunterscheidung
-- sehr praktisch im weiteren.
{- AUFRUF:
*Main> beidreiseivier 2
2
*Main> beidreiseivier 3
4
*Main> beidreiseivier 4
4
*Main> beidreiseivier 5
5
-}

-- Als letztes Beispiel wollen wir die funktion hoch_drei realisieren:
hochdrei x = x*x*x
{- AUFRUF:
*Main> hochdrei 5
125
*Main> hochdrei 2
8
-}

-- Das nutzen wir nun fuer unsere Aufgaben:
-- Wir simulieren Binaerzahlen durch eine funktion, die die ziffern
-- an festen stellen wiedergibt. zahla sei also 1101
-- Damit ist sie folgendermassen zu definieren:
zahla 1 = 1
zahla 2 = 1
zahla 3 = 0
zahla 4 = 1

-- und jetzt nutzen wir haskells unterstrich. der ignoriert die eingabe (behandelt sie als egal)
-- damit setzen wir alle anderen ziffern auf 2, somit sind 1 und 0 die interessanten Zahlen und alles
-- ausserhalb auf 2, das bedeutet, von ziffer 1 bis zum Auftritt von einer 2 sind es relevante ziffern

zahla _ = 2

-- schauen wir uns das mal an:
-- *Main> zahla 1
-- 1
-- *Main> zahla 4
-- 1
-- *Main> zahla 5
-- 2

--Hier definieren wir noch eine weitere Zahl:
zahlb 1 = 0
zahlb 2 = 0
zahlb 3 = 0
zahlb 4 = 1
zahlb 5 = 1
zahlb _ = 2

-- Fast alle Aufgaben werden in haskell rekursiv bearbeitet.
-- dafuer nutzen wir rekursive aufrufe mit einer fallunterschiedung.
-- Beispiel: wie oft kann eine zahl halbiert werden,
-- bis sie kleiner als 2 ist.
anzahlhalbierungen x = rekursiverteil x 0
rekursiverteil zahl bisherhalbiert =
            if zahl <2 then bisherhalbiert
            else rekursiverteil (zahl/2) (bisherhalbiert+1)
-- der rekursive teil wird abgebrochen, oder wird mit dem halben wert
-- und einer halbierung mehr aufgerufen.
-- das Argument bisherhalbiert ist also quasi unsere Zaelvariable.

{- einige Tests:
*Main> anzahlhalbierungen 3
1
*Main> anzahlhalbierungen 4
2
*Main> anzahlhalbierungen 5
2
*Main> anzahlhalbierungen 9
3
*Main> anzahlhalbierungen 7
2
*Main> anzahlhalbierungen 30
4
*Main> anzahlhalbierungen 32
5
-}
-- So genug zum Anfang wir wollen auch was schaffen.
-- _____________________________________________________________
-- AUFGABEN
-- =============================================================
{- AUFGABE 1
schreibe eine Funktion getexp2 die einen parameter n erwartet und die Zweierpotenz dazu ausgibt (Also 2^n)
Wir nehmen einfach an, n ist immer eine positive ganze Zahl.
Ziel: Schreibe diese Funktion rekursiv mit Start/Endwert getexp2 0 = 1
Bsp:
getexp2 2
4
getexp2 4
16
 
  AUFGABE 2
Schreibe eine Funktion getziffer die 2 argumente - eine zahl und eine zifferposition -  erwartet und
die Ziffer an dieser Stelle zurückgibt:
Bsp:
getziffer zahlb 2
0

  AUFGABE 3
Schreibe eine Funktion getbits die die Anzahl der belegten Ziffern einer Zahl ausgibt:
Bsp:
getbits zahlb
5
getbits zahla
4

  Aufgabe 4, jetzt wirds ernst:
Schreibe eine Funktion getdezimal, die die dezimalzahl errechnet,
die durch eine gegebene binaerzahl dargestellt wird.
(Wichtig, keine Typstruktur, kein Vorzeichen Bit, kein Komplement... nur 2er Potenzen)

ALso getdezimal zahlb
3

Aufgabe 5 : ui, der Bonus
Schreibe Die Funktion invertiere, die eine binaerzahl bekommt
und alle 1en zu 0en macht und alle 0en zu 1en...
Das Ergebnis ist also eine Funktion ähnlich zu den definierten Zahlen....
stichwort anonyme Funktion ;)
getziffer (invertiere zahla) 2
0

getziffer (invertiere zahlb) 3
1
-}


   