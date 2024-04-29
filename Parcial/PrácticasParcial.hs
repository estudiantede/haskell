--Parcial que pasaron por el ws

--1 
--Votos es el numero que recibio cada formula, entonces tengo que sumar los votos que sean >= 0
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos _ _ 0 = 0
porcentajeDeVotosAfirmativos formulas votos cantVotos = (division (porcentajeDeVotosAfirmativosAux votos cantVotos) cantVotos) * 100

porcentajeDeVotosAfirmativosAux :: [Int] -> Int -> Int
porcentajeDeVotosAfirmativosAux [] cantVotos = 0
porcentajeDeVotosAfirmativosAux (x:xs) cantVotos = x + porcentajeDeVotosAfirmativosAux xs cantVotos

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

--2

formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = False
formulasInvalidas ((pres, vice):formulas) | pres == vice = True
                                          | (formulasInvalidasAux pres formulas) || (formulasInvalidasAux vice formulas) = True
                                          | otherwise = formulasInvalidas formulas

formulasInvalidasAux :: String -> [(String, String)] -> Bool
formulasInvalidasAux candidato [] = False
formulasInvalidasAux candidato ((pres, vice):formulas) | candidato == pres = True
                                                       | candidato == vice = True
                                                       | otherwise = formulasInvalidasAux candidato formulas

--3
--Voy a contar desde el 1

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos viceABuscar formulas votos = (division (conseguirVotosDeVice (porcentajeDeVotosAux viceABuscar formulas) votos) (cantVotosTotales votos)) * 100

porcentajeDeVotosAux :: String -> [(String, String)] -> Int
porcentajeDeVotosAux viceABuscar [(pres,vice)] = 1
porcentajeDeVotosAux viceABuscar ((pres,vice):formulas) | viceABuscar == vice = 1
                                                        | otherwise = 1 + porcentajeDeVotosAux viceABuscar formulas

conseguirVotosDeVice :: Int -> [Int] -> Int
conseguirVotosDeVice 1 [votos] = votos
conseguirVotosDeVice 1 (x:xs) = x
conseguirVotosDeVice viceNum (x:xs) = conseguirVotosDeVice (viceNum - 1) xs
  
cantVotosTotales :: [Int] -> Int
cantVotosTotales [] = 0
cantVotosTotales (x:xs) = x + cantVotosTotales xs


--4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [(pres, vice)] votos = pres
menosVotado formulas (y:ys) = nombreCandidatoPosX (numCandidatoMenosVotado y 1 1 (y:ys)) formulas

numCandidatoMenosVotado :: Int -> Int -> Int -> [Int] -> Int
numCandidatoMenosVotado num pos posActual [] = pos
numCandidatoMenosVotado num pos posActual (x:xs) | num < x = numCandidatoMenosVotado num pos (posActual + 1) xs
                                                 | otherwise = numCandidatoMenosVotado x posActual (posActual + 1) xs

nombreCandidatoPosX :: Int -> [(String, String)] -> String
nombreCandidatoPosX 1 [(pres, vice)] = pres
nombreCandidatoPosX 1 ((pres, vice):formulas) = pres
nombreCandidatoPosX x ((pres, vice):formulas) = nombreCandidatoPosX (x-1) formulas