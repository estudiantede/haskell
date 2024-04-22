-- PRÁCTICA 5

-- Ej 1

    -- I)
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

    -- II)

ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

    -- III)

principio :: [t] -> [t]
principio [] = []
principio (x:xs) | longitud xs == 1 = [x]
                 | otherwise = x : principio xs

    -- IV)

inverso :: [t] -> [t]
inverso [] = []
inverso (x:xs) = concat [(inverso xs), [x]]

-- Ej 2

    --I) 

pertenece :: (Eq a) => a -> [a] -> Bool
pertenece n [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

    -- II)

todosIguales :: (Eq a) => [a] -> Bool
todosIguales [] = True
todosIguales (x:xs) = todosIgualesAux x xs

todosIgualesAux :: (Eq a) => a -> [a] -> Bool
todosIgualesAux q [] = True
todosIgualesAux q (x:xs) | q == x = todosIgualesAux q xs
                         | otherwise = False

    -- III)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | todosDistintosAux x xs = todosDistintos xs    
                      | otherwise = False

todosDistintosAux :: (Eq t) => t -> [t] -> Bool
todosDistintosAux q [] = True
todosDistintosAux q (x:xs) | q /= x = todosDistintosAux q xs
                           | otherwise = False


    -- IV)

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos x = not (todosDistintos x)

    -- V)

quitar :: (Eq t) => t -> [t] -> [t]
quitar q [] = []
quitar q (x:xs) | q /= x = concat [[x], (quitar q xs)]
                | otherwise = xs

    -- VI)
    
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos q [] = []
quitarTodos q (x:xs) | q /= x = x : (quitarTodos q xs)
                     | otherwise = quitarTodos q xs
                     
    -- VII)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

    -- VIII)

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = mismoTamañoSinRepetidos xs ys && mismosElementosAux (eliminarRepetidos xs) (eliminarRepetidos ys)

mismoTamañoSinRepetidos :: (Eq t) => [t] -> [t] -> Bool
mismoTamañoSinRepetidos x y = (longitud (eliminarRepetidos x)) == (longitud (eliminarRepetidos y))

mismosElementosAux :: (Eq t) => [t] -> [t] -> Bool
mismosElementosAux [] _ = True --Se que es True, porque deben de tener la misma longitud
mismosElementosAux (x:xs) ys | pertenece x ys = mismosElementosAux xs ys
                             | otherwise = False

    -- IX)

capicua :: (Eq t) => [t] -> Bool
capicua x = (inverso x) == x

-- Ej 3

    --I) 

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

    -- II)

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

    -- III)
maximo :: [Int] -> Int
maximo [x] = x
maximo [x, y] | x > y = x
              | otherwise = y
maximo (x:xs) | x > (head xs) = maximo (x : (tail xs))
              | otherwise = maximo ((head xs) : (tail xs))

--Forma alternativa, con 2 funciones

maximo1 :: [Int] -> Int
maximo1 [a] = a
maximo1 (x:xs) = maximoAux x xs



maximoAux :: Int -> [Int] -> Int
maximoAux q [] = q
maximoAux q (x:xs) | q > x = maximoAux q xs
                   | otherwise = maximoAux x xs


    -- IV)

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN q (x:xs) = (q + x) : sumarN q xs

    -- V)
    
sumarElPrimero :: [Int] -> [Int] 
sumarElPrimero (x:xs) = (x + x) : (sumarN x xs)

    -- VI)

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo x = sumarN (ultimo x) x

    -- VII)

    -- VIII)

    -- IX)

-- Ej 4

-- a)
       --a)
       
       --b)
       
       --c)

       --d)

       --e)

       --f)

       --g)

--b)

--Ej 5)

    -- 1)

    -- 2)
