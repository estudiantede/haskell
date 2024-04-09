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


--3)

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y = mod x y == 0



--4) 

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

--g)

--h)






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