module Solucionnn where 

aproboMasDeNMaterias :: [([Char], [Int])] -> [Char] -> Int -> Bool
aproboMasDeNMaterias alumnos nombre cantidadDeMaterias = aproboNMaterias (buscarString nombre alumnos) cantidadDeMaterias


buscarString :: [Char] -> [([Char], [Int])] -> [Int]
buscarString nombreABuscar [(nombre, materias)] = materias
buscarString nombreABuscar ((nombre, materias): xs) | nombreABuscar == nombre = materias
                                                    | otherwise = buscarString nombreABuscar xs

aproboNMaterias :: [Int] -> Int -> Bool
aproboNMaterias [] _  = False
aproboNMaterias notas cantidad = (cantidadDeMateriasAprobadas notas) > cantidad


cantidadDeMateriasAprobadas :: [Int] -> Int
cantidadDeMateriasAprobadas [] = 0
cantidadDeMateriasAprobadas (x:xs) | x >= 4 = 1 + cantidadDeMateriasAprobadas xs
                                   | otherwise = cantidadDeMateriasAprobadas xs

-- Ej 2

buenosAlumnos :: [([Char], [Int])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((x1,x2):xs) | esBuenAlumno x2 = x1 : buenosAlumnos xs
                           | otherwise = buenosAlumnos xs


esBuenAlumno :: [Int] -> Bool
esBuenAlumno notas | hayAlgunMenorQue4 notas = False
                   | (promedioDeNotas notas) >= (8.0) = True
                   | otherwise = False

hayAlgunMenorQue4 :: [Int] -> Bool
hayAlgunMenorQue4 [] = False
hayAlgunMenorQue4 (x:xs) | x < 4 = True
                         | otherwise = hayAlgunMenorQue4 xs


promedioDeNotas :: [Int] -> Float
promedioDeNotas notas = division (sumaDeNotas notas) (longitudDeNotas notas)

longitudDeNotas :: [Int] -> Int
longitudDeNotas [] = 0
longitudDeNotas (x:xs) = 1 + longitudDeNotas xs

sumaDeNotas :: [Int] -> Int
sumaDeNotas [] = 0
sumaDeNotas (x:xs) = x + sumaDeNotas xs

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

--Ej 4

mejorPromedio :: [([Char], [Int])] -> [Char] 
mejorPromedio notas = calcularMaximo (promedioDeTodos notas)

calcularMaximo ::  [([Char], Float)] -> [Char]
calcularMaximo ((nombre, promedio):xs) = calcularMaximoAux nombre promedio xs

calcularMaximoAux :: [Char] -> Float -> [([Char], Float)] -> [Char]
calcularMaximoAux nombre promedio [] = nombre
calcularMaximoAux nombre promedio ((n, prom):xs) | promedio >= prom = calcularMaximoAux nombre promedio xs
                                              | otherwise = calcularMaximoAux n prom xs


promedioDeTodos :: [([Char], [Int])] -> [([Char], Float)] 
promedioDeTodos [] = []
promedioDeTodos ((nombre, notas):xs) = (nombre, (promedioDeNotas notas)) : promedioDeTodos xs