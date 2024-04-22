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
-- Debe de verse a todos los elementos que esten en frente de sí
-- No hace falta verificar los de atras, porque ya fue verificado
--Entonces hacia delante, como los burros

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos


    -- IV)

    -- V)

    -- VI)

    -- VII)

    -- VIII)

    -- IX)

-- Ej 3

    --I) 

    -- II)

    -- III)

    -- IV)

    -- V)

    -- VI)

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
