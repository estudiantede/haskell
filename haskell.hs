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

--f)

--g)

--h)

--i)

--j)















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