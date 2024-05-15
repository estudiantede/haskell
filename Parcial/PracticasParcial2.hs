{-

¡Vamos Campeones!
En exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas
funcionalidades en Haskell, Los datos con los que contamos para esto son los nombres de los equipos que participan
del torneo, los nombres de los arqueros titulares de cada uno de dichos equipos, y la cantidad de goles recibidos
por esos arqueros. Los nombres de los equipos y sus respectivos arqueros serán modelados mediante tuplas de tipo
(String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre
del arquero titular de dicho equipo.
En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)


1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
	}
}


2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
	}
}


3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
	}
}

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


4) Valla Menos Vencida
problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {
	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles
	}
}

-}

atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes _ golesATitulares golesTotales = golesTotales - (sumaGolesATitulares golesATitulares)

sumaGolesATitulares :: [Int] -> Int
sumaGolesATitulares [] = 0
sumaGolesATitulares (x:xs) = x + sumaGolesATitulares xs


--Ej 2
equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True -- No hay ningún caso donde se inclumpa la especificacion
equiposValidos ((x1, x2):xs) | x1 == x2 = False
                             | not (seRepiteAlguno (x1, x2) xs) = False
                             | otherwise = equiposValidos xs

seRepiteAlguno :: (String, String) -> [(String, String)] -> Bool
seRepiteAlguno (clubABuscar, arqueroABuscar) [] = True
seRepiteAlguno (clubABuscar, arqueroABuscar) ((club, arquero):xs) | clubABuscar == club || clubABuscar == arquero = False
                                                                  | arqueroABuscar == arquero || arqueroABuscar == club = False
                                                                  | otherwise = seRepiteAlguno (clubABuscar, arqueroABuscar) xs

-- 3

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles arquero formulas golesAArqueros = (division (buscarCantGolesArquero arquero formulas golesAArqueros) (sumaGolesATitulares golesAArqueros)) * 100

buscarCantGolesArquero :: String -> [(String, String)] -> [Int] -> Int
buscarCantGolesArquero arqueroABuscar ((_, arquero):formulas) (x:xs) | arqueroABuscar == arquero = x
                                                                     | otherwise = buscarCantGolesArquero arqueroABuscar formulas xs 

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


--Ej 4

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida [(_, arquero)] _ = arquero
vallaMenosVencida ((_, arquero):formulas) (golesRecibidos: xs) | (tieneMenorValla golesRecibidos xs) = arquero
                                                               | otherwise = vallaMenosVencida formulas xs 

tieneMenorValla :: Int -> [Int] -> Bool -- Tiene que ser el minimo de todos los componentes
tieneMenorValla golesRecibidos [] = True
tieneMenorValla golesRecibidos (x:xs) | golesRecibidos <= x = tieneMenorValla golesRecibidos xs
                                      | otherwise = False
