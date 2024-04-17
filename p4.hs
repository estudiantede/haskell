-- PRÁCTICA 4

--Ej 1

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

--Ej 2

parteEntera :: Float -> Int
parteEntera x | x < 1 = 0
parteEntera x | x > 0 = 1 + parteEntera (x - 1)

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

{-
    problema sumaImpares (x: Integer) : Integer {
        requiere: {x debe ser > 0}
        asegura: {res devuelve la suma de los números impares menos a x}
    }
-}

sumaImpares :: Int -> Int 
sumaImpares x | mod x 2 == 0 = sumaImparesImpar (x - 1)
              | otherwise = sumaImparesImpar x

sumaImparesImpar :: Int -> Int 
sumaImparesImpar x | x <= 0 = 0
                 | otherwise = x + sumaImparesImpar (x - 2)

--Ej 5

medioFact :: Integer -> Integer
medioFact x | x <= 0 = 1
            | otherwise = x * medioFact (x - 2)

--Ej 6

{-
    problema sumaDigitos (x,y: Integer) :  {
        requiere: {true}
        asegura: {res devuelve la suma de todos los dìgitos de un nùmero}
    }
-}

sumaDigitos :: Int -> Int
sumaDigitos 0 = 0
sumaDigitos x = (mod x 10) + sumaDigitos (div x 10)

--Ej 7

todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | igualSiguiente x (mod x 10) == 1 = True
                      | otherwise = False

igualSiguiente :: Int -> Int -> Int
igualSiguiente x y | x < 10 && x == y = 1
                   | x < 10 && x /= y = 0
                   | mod x 10 == y = igualSiguiente (div x 10) y
                   | otherwise = 0

--Ej 8

iesimoDigito :: Int -> Int -> Int 
iesimoDigito x y = mod (div x 10 ^ (cantDigitos x - y)) 10


cantDigitos :: Int -> Int 
cantDigitos 0 = 1
cantDigitos x | x < 10 = 1
cantDigitos x | otherwise =  1 + cantDigitos (div x 10)

--Ej 9

{-
    problema esCapicua (x: Z) : Bool {
        requiere: {x tiene que ser >= 0}
        asegura: {res devuelve true si por cada número en la posición i hay un digito en la pos x - i que sea el mismo. 
        En caso contrario, devuelve false}
    }
-}

--esCapicua :: Integer -> Bool

esCapicua :: Int -> Bool
esCapicua x = x == inverso x

inverso :: Int -> Int
inverso x | x < 10 = x
inverso x | otherwise =  (mod x 10) * (10 ^ ((cantDigitos x) - 1)) + inverso (div x 10)

--Ej 10

--a)

{-
    problema  () :  {
        requiere: {}
        asegura: {}
    }
-}

f1 :: Int -> Int
f1 0 = 1
f1 x = 2 ^ x + f1 (x - 1)

--b)
{-
    problema  () :  {
        requiere: {}
        asegura: {}
    }
-}

f2 :: Int -> Int -> Int
f2 1 q = q
f2 n q = q ^ n + f2 (n - 1) q

--c)

{-
    problema  () :  {
        requiere: {}
        asegura: {}
    }
-}

f3 :: Int -> Int -> Int
f3 x y = g3 (2 * x) y 

g3 :: Int -> Int -> Int
g3 1 y = y
g3 x y = y ^ x + g3 (x - 1) y

--d)

{-
    problema  () :  {
        requiere: {}
        asegura: {}
    }
-}

f4 :: Int -> Int -> Int
f4 x y = g4 (2 * x) y 

g4 :: Int -> Int -> Int
g4 x y | x == y = y ^ x
       | otherwise = y ^ x + g3 (x - 1) y

--Ej 11

eAprox :: Int -> Float
eAprox 0 = 1
eAprox x = 1.0 / (fromIntegral (factorial x)) + eAprox (x - 1)

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


e :: Float
e = eAprox 10

--Ej 12

raizDe2Aprox :: Int -> Float
raizDe2Aprox x = raizDe2 (x - 1)

raizDe2 :: Int -> Float
raizDe2 0 = 2
raizDe2 n = 1 + (1.0 / raizDe2 (n - 1))

raiz :: Integer -> Float
raiz n = sucecionA n - 1

sucecionA :: Integer -> Float
sucecionA n | n == 0 = 2
            | otherwise = 2 + (1 / raiz (n-1))

--Ej 13

{-
    problema f13 (n,m: Z) :  {
        requiere: {n y m >= 1}
        asegura: {devuelve la sumatoria de todos los números que vayan de 1 a n elevados a j todos ellos}
        asegura: {va desde el n a 1 elevandolo a tal j, luego, se resta j por 1 y se repita hast qeu j sea 0}
    }
-}

f13 :: Int -> Int -> Int
f13 0 y = 0
f13 x y = auxiliar x y + f13 (x - 1) y


--Funcion que sume todos los nùmeros n ^ m hasta 1^m
auxiliar1 :: Int -> Int -> Int
auxiliar1 1 y = 1
auxiliar1 x y = x ^ y + auxiliar1 (x -1) y

auxiliar :: Int ->Int -> Int
auxiliar x 1 = x
auxiliar x y = x ^ y + auxiliar x (y - 1)


--Ej 14

--Ej 15

--Ej 16

menorDivisor :: Int -> Int
menorDivisor x = menDiv x 2

menDiv :: Int -> Int -> Int
menDiv x y | x == y = x
           | mod x y == 0 = y
           | otherwise = menDiv x (y+1)

esPrimo :: Int -> Bool 
esPrimo x | menorDivisor x == x = True
          | otherwise = False

sonCoprimos :: Int -> Int -> Bool
sonCoprimos x y = coprimos x y 2

coprimos :: Int -> Int -> Int -> Bool
coprimos x y z | mod x z == 0 && mod y z == 0 = False
               | z > x && z > y = True
               | otherwise = coprimos x y (z + 1)

nEsimoPrimo :: Int -> Int
nEsimoPrimo x = primoNum 1 0 x

-- x numero por el que voy buscando
-- y es el numero de primos encontrados
-- z es el numero de primo a buscar
primoNum :: Int -> Int -> Int -> Int
primoNum x y z | y == z = x - 1 ---Porque ya se sabe 
               | esPrimo x = primoNum (x + 1) (y + 1) (z)
               | otherwise = primoNum (x + 1) (y) (z)


--Ej 17

--Ej 18

--Ej 19

--Ej 20

--Ej 21

{-
    problema  () :  {
        requiere: {}
        asegura: {}
    }
-}
