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




{- 

problema todoMenos (t1, t2: R × R) : Bool {
    requiere: {true}
    asegura: {res = True <--> la primer coordenada de t1 es menor a la 1ra de t2 Y la segunda coordenada de t1 es menor que la segunda coordenada de t2}
}

problema crearPar (x, y) : t {
    requiere: {true}
    asegura: {res devuelve una tupla en donde el primer elemento sea x y su segundo elemento sea y, sin importar su tipo}
}

Eq t :: t -> t 

-}

crearPar :: t -> t -> (t, t)
crearPar x y = (x, y)

--todosMenores :: (Int, Int, Int) -> Bool
--todosMenores (a, b, c) = 2

f :: Int -> Int
f x | x <= 7 = x ^ 2
    | x > 7 = 2 * x - 1

g :: Int -> Int 
g x | mod x 2 == 0 = div x 2
    | otherwise = 3 * x + 1

bisiesto :: Int -> Bool
bisiesto x | (mod x 4 /= 0) = False
           | (mod x 100 == 0 && mod x 400 /= 0) = False
           | otherwise = True

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a, b, c) (x, y ,z) = abs (a - x) + abs (b - y) + abs (c - z)

comparar :: Int -> Int -> Int
comparar x y | sumaUltimosDosDigitos(x) < sumaUltimosDosDigitos(y) = 1
             | sumaUltimosDosDigitos(x) = sumaUltimosDosDigitos(y) = 0
             | otherwise = -1

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10 
