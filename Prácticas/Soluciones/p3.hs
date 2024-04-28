-- PRÁCTICA 3

--Ej 1

f :: Int -> Int
f x | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16

--b)

g :: Int -> Int
g x | x == 8 = 16
    | x == 16 = 4
    | x == 131 = 1

--c)
h :: Int -> Int
h x = f (g x)

k :: Int -> Int
k x = g (h x)

-----------------------------------------------------------------------------------------------------------------

--Ej 2

--a)
absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | x < 0 = (-x)

--b)

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y | absoluto x > absoluto y = absoluto x
                   | otherwise = absoluto y

--c)

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x >= y && x >= z = x
              | y >= z = y
              | otherwise = z

--d)

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x 0 = True
algunoEs0 0 y = True
algunoEs0 x y = False

--e)

ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 x y = False

--f)

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | x <= 7 && y <= 7 && x > 3 && y > 3 = True
                   | x > 7 && y > 7 = True
                   | otherwise = False

--g)

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | x == y && x == z = 0
                    | x == y = z
                    | x == z = y
                    | y == z = x
                    | otherwise = x + y +z

--h)

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod x y == 0

--i)

digitoUnidades :: Int -> Int 
digitoUnidades x = mod x 10

--j)

digitoDecenas :: Int -> Int
digitoDecenas x = mod (div x 10) 10  

-----------------------------------------------------------------------------------------------------------------
--Ej 3)

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y = mod x y == 0
-----------------------------------------------------------------------------------------------------------------
--4) 

{- 
problema prodInterno (x, y: R x R) : Z {
    requiere: {true}
    asegura: {res = x.0 * y.0 + x.1 * y.1}
}

problema todoMenor (t1, t2: R × R) : Bool {
    requiere: {true}
    asegura: {res = True <--> la primer coordenada de t1 es menor a la 1ra de t2 Y la segunda coordenada de t1 es menor que la segunda coordenada de t2}
}

problema distanciaPuntos (x, y: R x R) : R {
    requiere: {true}
    asegura: {res = sqrt ((x.0 - y.0) ^ 2) + (x.1 - y.1) ^ 2 )}
}

problema sumaTerna (x: R x R x R) : R {
    requiere: {true}
    asegura: {res = la suma de los 3 elementos de x}
}

problema sumarSoloMultiplos (x: Z x Z x Z, y : Z) : Z {
    requiere: {true}
    asegura: {res = la suma de los núméros cuyo modulo entre cada coordena e y sea 0}
}

problema posPrimerPar (x: Z x Z x Z) : Z {
    requiere: {true}
    asegura: {Res = posición (0 index) en donde se encuentre el primer número par. Si son todos impar, devolver 4}
}

problema crearPar (x, y) : t {
    requiere: {true}
    asegura: {res devuelve una tupla en donde el primer elemento sea x y su segundo elemento sea y, sin importar su tipo}
}

problema invertir (x: a x b) : (b,a) {
    requiere: {true}
    asegura: {res = a la dupla x invertida en su orden}
}

-}

--a)
prodInterno :: (Int, Int) -> (Int, Int) -> Int
prodInterno x y = (fst x) * (fst y) + (snd x) * (snd y)

--b)
todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor x y = (fst x) < (fst y) && (snd x) < (snd y)

--c)
distanciaPuntos :: (Float, Float) -> (Float, Float)  -> Float
distanciaPuntos x y = sqrt ( ((fst x) - fst (y))  ^ 2 + ((snd x) - snd (y))  ^ 2)

--d)
thrd:: (Int,Int,Int) -> Int
thrd (_,_,c) = c

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x, y, z) = x + y + z

--e)
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos(x, y, z) a | ((mod x a) == 0) && ((mod y a) == 0) && ((mod z a) == 0) = x + y + z
                              | ((mod x a) == 0) && ((mod y a)) == 0 = x + y
                              | ((mod x a) == 0) && ((mod z a)) == 0 = x + z
                              | ((mod x a) == 0) = x
                              | ((mod y a) == 0) && (mod z a) == 0 = y + z
                              | ((mod z a) == 0) = z
                              | ((mod y a) == 0) = y
                              | otherwise = 0

--f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x, y, z) | (mod x 2) == 0 = 0
                       | (mod y 2) == 0 = 0
                       | (mod z 2) == 0 = 0
                       | (mod x 2) == 1 && (mod y 2) /= 0 && (mod z 2) /= 0 = 4

--g) 
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

--h) 
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)

-----------------------------------------------------------------------------------------------------------------
--Ej 5
todosMenores :: (Int, Int, Int) -> Bool
todosMenores (a, b, c) = 2

f :: Int -> Int
f x | x <= 7 = x ^ 2 
    | x > 7 = 2n - 1

g:: Int -> Int
g x | mod x 2 == 0 = div x 2
    | otherwise = 3 * n + 1
-----------------------------------------------------------------------------------------------------------------
--Ej 6

bisiesto :: Int -> Bool
bisiesto x | (mod x 4 /= 0) = False
           | (mod x 100 == 0 && mod x 400 /= 0) = False
           | otherwise = True

-----------------------------------------------------------------------------------------------------------------
--Ej 7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a, b, c) (x, y ,z) = abs (a - x) + abs (b - y) + abs (c - z)

-----------------------------------------------------------------------------------------------------------------
--Ej 8
comparar :: Int -> Int -> Int
comparar x y | sumaUltimosDosDigitos(x) < sumaUltimosDosDigitos(y) = 1
             | sumaUltimosDosDigitos(x) = sumaUltimosDosDigitos(y) = 0
             | otherwise = -1

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10 

-----------------------------------------------------------------------------------------------------------------
--Ej 9

{-
problema f1 (x: R) : Float {
    requiere: {true}
    asegura: {res devuelve 1 si x es 0. En caso contrario devuelve 0}
}

problema f2 (x: R) : R {
    requiere: {(x == 1) || (x == -1)}
    asegura: {res = 15 <--> x == 1}
    asegura: {res = -15 <--> x == -1}
}

problema f3 (x: R): R {
    requiere: {true}
    asegura: {res = 7 <--> n <= 9. En caso contrario, verificar si x >= 3 <--> res = 5}
}

problema f4 (x, y: R) : R {
    requiere: {true}
    asegura: {res = (x+y)/2}
}

problema f5 (x: (R, R)) : R {
    requiere: {true}
    asegura: {res es la division entre la suma de la primera coordenada y la segunda coordenada y 2 }
}

problema f6 (x: R, y: Z) : Bool {
    requiere: {true}
    asegura: {res = True <--> truncate (x) == b}
}

problema truncate (x: R) : Z {
    requiere: {true}
    asegura: {res = al nùmero entero màs cercano de x a 0}
}

-}















--a)

--b)

--c)

--d)

--e)

--f)

--g)

--h)

--i)

--j)
