module Solucion where

hayQueCodificar :: Char -> [(Char, Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((x1,x2):xs) = c == x1 || hayQueCodificar c xs

--Ej 1

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar c frase mapa | not (hayQueCodificar c mapa) = 0
                                         | otherwise = cantidadDeApariciones c frase

cantidadDeApariciones :: Char -> [Char] -> Int
cantidadDeApariciones c [] = 0
cantidadDeApariciones c (x:xs) | c == x = 1 + cantidadDeApariciones c xs
                               | otherwise = cantidadDeApariciones c xs

--Ej 3

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar frase mapa = buscarMaximo (contarCuantasVecesHayQueCodificar frase mapa)

contarCuantasVecesHayQueCodificar :: [Char] -> [(Char, Char)] -> [(Char, Int)]
contarCuantasVecesHayQueCodificar frase [] = []
contarCuantasVecesHayQueCodificar frase ((x1,x2):xs) = (x1, (cuantasVecesHayQueCodificar x1 frase ((x1,x2):xs))) : contarCuantasVecesHayQueCodificar frase xs

buscarMaximo :: [(Char, Int)] -> Char
buscarMaximo ((c,i):xs) = (buscarMaximoAux c i xs)

buscarMaximoAux :: Char -> Int -> [(Char, Int)] -> Char
buscarMaximoAux c i [] = c
buscarMaximoAux c i ((x1,x2):xs) | i >= x2 = buscarMaximoAux c i xs
                                 | otherwise = buscarMaximoAux x1 x2 xs

--Ej 4
codificarFrase :: [Char] -> [(Char, Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (x:xs) mapa | hayQueCodificar x mapa = (buscarXEnMapa x mapa) : codificarFrase xs mapa
                           | otherwise = x : codificarFrase xs mapa
                        

buscarXEnMapa :: Char -> [(Char, Char)] -> Char
buscarXEnMapa c [] = c
buscarXEnMapa c ((x1,x2):xs) | c == x1 = x2
                             | otherwise = buscarXEnMapa c xs