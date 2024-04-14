-- PRÁCTICA 4

--Ej 1

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

--Ej 2

--Ej 3

{-
    problema esDivisible (x, y: Integer) : Bool {
        requiere: {x e y deben ser > 0}
        asegura: {res devuelve true sii x es visible por y. En caso contrario, devolverà false}
    }
-}

esDivisible :: Integer -> Integer -> Bool 
esDivisible 0 y = True
esDivisible x y | x < 0 = False
esDivisible x y = esDivisible (x- y) y

--Ej 4

--Ej 5

--Ej 6

--Ej 7

--Ej 8

--Ej 9

--Ej 10

--Ej 11

--Ej 12

--Ej 13

--Ej 14

--Ej 15

--Ej 16

--Ej 17

--Ej 18

--Ej 19

--Ej 20

--Ej 21
