-- Parte I: Cifrado Caesar

import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

hola :: Int
hola = 2

probarEjesMinuscula = runTestTT testsEjesMinuscula
probarEjletraANatural = runTestTT testsEjletraANatural
probarEjdesplazar = runTestTT testsEjdesplazar
probarEjcifrar = runTestTT testsEjcifrar
probarEjdescifrar = runTestTT testsEjdescifrar
probarEjcifrarLista = runTestTT testsEjcifrarLista
probarEjfrecuencia = runTestTT testsEjfrecuencia
probarEjcifradoMasFrecuente = runTestTT testsEjcifradoMasFrecuente
probarEjesDescifrado = runTestTT testsEjesDescifrado
probarEjtodosLosDescifrados = runTestTT testsEjtodosLosDescifrados
probarEjexpandirClave = runTestTT testsEjexpandirClave
probarEjcifrarVigenere = runTestTT testsEjcifrarVigenere
probarEjdescifrarVigenere = runTestTT testsEjdescifrarVigenere
probarEjpeorCifrado = runTestTT testsEjpeorCifrado
probarEjcombinacionesVigenere = runTestTT testsEjcombinacionesVigenere

testsEjesMinuscula = test [
    "a devuelve True" ~: (esMinuscula 'a') ~?= True,
    "b devuelve True" ~: (esMinuscula 'b') ~?= True,
    "c devuelve True" ~: (esMinuscula 'c') ~?= True,
    "z devuelve True" ~: (esMinuscula 'z') ~?= True,
    "A devuelve False" ~: (esMinuscula 'A') ~?= True,
    "B devuelve True" ~: (esMinuscula 'B') ~?= True,
    "C devuelve True" ~: (esMinuscula 'C') ~?= True,
    "Z devuelve True" ~: (esMinuscula 'Z') ~?= True,
    "Espacio devuelve False" ~: (esMinuscula ' ') ~?= True,
    "? devuelve False" ~: (esMinuscula '?') ~?= True
    ]

testsEjletraANatural = test [
    "a devuelve 0" ~: (letraANatural 'a') ~?= 0,
    "b devuelve 0" ~: (letraANatural 'b') ~?= 1,
    "c devuelve 0" ~: (letraANatural 'c') ~?= 2,
    "g devuelve 0" ~: (letraANatural 'g') ~?= 6,
    "x devuelve 0" ~: (letraANatural 'x') ~?= 23,
    "y devuelve 0" ~: (letraANatural 'y') ~?= 24,
    "z devuelve 0" ~: (letraANatural 'z') ~?= 25
    ]

testsEjdesplazar = test [
    "a desplazado 0" ~: (desplazar 'a' 0) ~?= '',
    "h desplazado 0" ~: (desplazar 'h' 0) ~?= '',
    "z desplazado 0" ~: (desplazar 'z' 0) ~?= '',

    "a desplazado 1" ~: (desplazar 'a' 1) ~?= '',
    "g desplazado 1" ~: (desplazar 'g' 1) ~?= '',
    "z desplazado 1" ~: (desplazar 'z' 1) ~?= '',

    "a desplazado -1" ~: (desplazar 'a' (-1)) ~?= 2,
    "g desplazado -1" ~: (desplazar 'g' (-1)) ~?= 2,
    "z desplazado -1" ~: (desplazar 'z' (-1)) ~?= 2,

    "a desplazado 3" ~: (desplazar 'a' 3) ~?= '',
    "g desplazado 3" ~: (desplazar 'g' 3) ~?= '',
    "z desplazado 3" ~: (desplazar 'z' 3) ~?= '',

    "a desplazado -3" ~: (desplazar 'a' (-3)) ~?= 2,
    "g desplazado -3" ~: (desplazar 'g' (-3)) ~?= 2,
    "z desplazado -3" ~: (desplazar 'z' (-3)) ~?= 2,

    "1 desplazado 1" ~: (desplazar '1' 1) ~?= 2,
    "3 desplazado 1" ~: (desplazar '2' 1) ~?= 2,
    "? desplazado 1" ~: (desplazar '?' 1) ~?= 2,

    "A desplazado 0" ~: (desplazar 'A' 0) ~?= 'C',
    "B desplazado 0" ~: (desplazar 'B' 0) ~?= '',
    "C desplazado 0" ~: (desplazar 'C' 0) ~?= 'A'
    ]

testsEjcifrar = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjdescifrar = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjcifrarLista = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjfrecuencia = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjcifradoMasFrecuente = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjesDescifrado = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjtodosLosDescifrados = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjexpandirClave = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjcifrarVigenere = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjdescifrarVigenere = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjpeorCifrado = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjcombinacionesVigenere = test [
    "hola" ~: (hola) ~?= 2
    ]





-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)
