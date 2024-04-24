module SimulacroParcial  where


relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas [(a,b)] | (a == b) = False
                          | otherwise = True
relacionesValidas (x : xs) | compararTodasTuplas x xs = relacionesValidas x
                           | otherwise = False

compararTodasTuplas :: (String, String) -> [(String, String)] -> Bool
compararTodasTuplas _ [] = True
compararTodasTuplas q (x : xs) | tuplasIguales q x = False
                               | tuplaMismoComponente q || tuplaMismoComponente x = False
                               | otherwise = compararTodasTuplas q xs

tuplasIguales :: (String, String) -> (String, String) -> Bool
tuplasIguales (x1, x2) (y1, y2) | x1 == y1 && x2 == y2 = True
                                | x1 == y2 && x2 == y1 = True
                                | otherwise = False

tuplaMismoComponente :: (String, String) -> Bool
tuplaMismoComponente (x, y) = x == y


personas :: [(String, String)] -> [String]
personas [] = ["nadie"] 
personas xs = eliminarRepetidos (todasPersonas xs)

--Por requiere mio, no puede ser vacio
todasPersonas :: [(String, String)] -> [String]
todasPersonas [(x1,x2)] = [x1, x2]
todasPersonas ((x1,x2) : xs) = x1 : x2 : (todasPersonas xs)

eliminarRepetidos :: [String] -> [String]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | estaDeNuevoDespues x xs = eliminarRepetidos xs
                         | otherwise = x : eliminarRepetidos xs

estaDeNuevoDespues :: String -> [String] -> Bool
estaDeNuevoDespues _ [] = False
estaDeNuevoDespues q (x:xs) | q == x = True
                            | otherwise = estaDeNuevoDespues q xs


amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe q ((x1, x2):xs) | q == x1 = x2 : amigosDe q xs
                         | q == x2 = x1 : amigosDe q xs
                         | otherwise = amigosDe q xs


personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo"
personaConMasAmigos xs = snd (compTuplas (amigosDeTodos (personas xs) xs))


--Primer elemento es personas
--2do elemento todas las relaciones
--3er elemento devuelve numeros y su string

amigosDeTodos :: [String] -> [(String, String)] -> [(Int, String)]
amigosDeTodos [a] xs = [(longitud (amigosDe a xs), a)]
amigosDeTodos (y:ys) xs = (longitud (amigosDe y xs), y) : amigosDeTodos ys xs

longitud :: [String] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

compTuplas :: [(Int, String)] -> (Int, String)
compTuplas [] = (1, "yo")
compTuplas (x:xs) = compararTuplas x xs

compararTuplas :: (Int, String) -> [(Int, String)] -> (Int, String)
compararTuplas q [] = q 
compararTuplas (q1, q2) ((x1,x2):xs) | q1 < x1 = compararTuplas (x1, x2) xs
                                     | otherwise = compararTuplas (q1, q2) xs

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
import SimulacroParcial
import Test.HUnit

ejecutar = runTestTT testRelacionesValidas

testRelacionesValidas = test ["Caso base: relacionesValidas []" ~: (relacionesValidas []) ~?= True,"Caso relacion bien hecha" ~: (relacionesValidas [("Pedro", "Javier"), ("Sofia", "Mascherano"), ("Javier", "Juanito"), ("Pepito", "Juan Pablo II"), ("Pedro", "Mascherano"), ("Pedro", "Mia")]) ~?= True,"Caso relaicon mal hecha repetido nombre" ~: (relacionesValidas [("Judas", "Judas")]) ~?= False,"Caso relaicon mal hecha dos relaciones repetidas" ~: (relacionesValidas [("Pedro", "Mateo"), ("Mateo", "Pedro"), ("Pedro", "Sofia")]) ~?= False]
