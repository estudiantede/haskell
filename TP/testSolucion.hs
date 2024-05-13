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
    "hola" ~: (hola) ~?= 2
    ]

testsEjletraANatural = test [
    "hola" ~: (hola) ~?= 2
    ]

testsEjdesplazar = test [
    "hola" ~: (hola) ~?= 2
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
