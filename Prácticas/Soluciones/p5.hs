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
maximo (x:y:xs) | x > (y) = maximo (x : xs)
              | otherwise = maximo (y : xs)

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

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

    -- VIII)

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN q [] = []
multiplosDeN q (x:xs) | mod x q == 0 = x : multiplosDeN q xs
                      | otherwise = multiplosDeN q xs

    -- IX)

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar xs = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

-- Ej 4

-- a)
       --a)

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [a] = [a]
sacarBlancosRepetidos [a, b]   | a == b && a == ' ' = [a]
                                  | otherwise = [a, b]
sacarBlancosRepetidos(n:m:xs) | n /= ' ' && m /= ' ' = n : sacarBlancosRepetidos (m : xs)
                                 | n == ' ' && m /= ' ' = n : sacarBlancosRepetidos (m : xs)
                                 | n /= ' ' && m == ' ' = n : sacarBlancosRepetidos (m : xs)
                                 | otherwise = sacarBlancosRepetidos (m:xs)

       
       --b)
contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras xs = contarEspacios (limpiarPalabra xs) + 1

limpiarPalabra :: [Char] -> [Char]
limpiarPalabra xs = sacarBlancoFinal (sacarBlancoPrincipio (sacarBlancosRepetidos xs))

sacarBlancoPrincipio :: [Char] -> [Char]
sacarBlancoPrincipio [] = []
sacarBlancoPrincipio (x:xs) | x == ' ' = xs
                            | otherwise = x : xs

sacarBlancoFinal :: [Char] -> [Char]
sacarBlancoFinal [] = []
sacarBlancoFinal [a] | a == ' ' = []
                     | otherwise = [a]
sacarBlancoFinal (x:xs) = x : sacarBlancoFinal xs

contarEspacios :: [Char] -> Int
contarEspacios [] = 0
contarEspacios (x:xs) | x == ' ' = 1 + contarEspacios xs
                      | otherwise = contarEspacios xs

       --c)
palabras :: [Char] -> [[Char]]
palabras [] = [[]]
palabras xs = palabrasAux (' ' : limpiarPalabra xs)

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux (x:xs) | x == ' ' = (sacarPalabra xs) : palabrasAux xs
                   | otherwise = palabrasAux xs

sacarPalabra :: [Char] -> [Char]
sacarPalabra [] = []
sacarPalabra (' ':xs) = []
sacarPalabra (x:xs) = x : sacarPalabra xs

       --d)



       --e)

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

       --f)

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [a] = a
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

       --g)

aplanarConNBlancos :: [[Char]] -> Int -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos [a] _ = a
aplanarConNBlancos (x:xs) n = x ++ (devolverNBlancos n) ++ aplanarConNBlancos xs n

devolverNBlancos :: Int -> String
devolverNBlancos x | x <= 0 = ""
                   | otherwise = ' ' : devolverNBlancos (x - 1)

--b)
-- Los ejercicios no cambiarían nada, ya que seguirìan siendo los mismas funciones, en donde, en este caso, serìan lo mismo
--Ej 5)

    -- 1)

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [a] = [a]
sumaAcumulada (x1:x2:xs) = x1 : sumaAcumulada ((x1 + x2):xs)


    -- 2)

descomponerEnPrimos :: [Int] -> [[Int]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = (descomponerEnPrimosAux x 1) : descomponerEnPrimos xs


descomponerEnPrimosAux :: Int -> Int -> [Int]
descomponerEnPrimosAux 1 _ = []
descomponerEnPrimosAux num primoN | mod num nPrimo == 0 = nPrimo : descomponerEnPrimosAux (div num nPrimo) primoN
                                  | otherwise = descomponerEnPrimosAux num (primoN + 1)
                                  where nPrimo = nEsimoPrimo1 primoN

menorDivisor :: Int ->Int
menorDivisor n = menorDivisorHasta n 2

menorDivisorHasta :: Int -> Int -> Int -- se requiere que q == 2
menorDivisorHasta n q | mod n q == 0 = q
                      | otherwise = menorDivisorHasta n (q+1)


esPrimo :: Int ->Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False

nEsimoPrimo1 :: Int -> Int
nEsimoPrimo1 n = nEsimoPrimoAux1 n 2 0

nEsimoPrimoAux1 :: Int -> Int -> Int -> Int
nEsimoPrimoAux1 n i k | n == k = i-1
                     | esPrimo i = nEsimoPrimoAux1 n (i+1) (k+1)
                     | otherwise = nEsimoPrimoAux1 n (i+1) k
