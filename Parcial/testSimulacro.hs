import Solucion
import Test.HUnit

pruebaEj1 = runTestTT testHayQueCodificar

testHayQueCodificar = test [
    "Caso base: mapa vacio" ~: (hayQueCodificar 'a' []) ~?= False,
    "Prueba unico elemento. Sin presencia del elemento" ~: (hayQueCodificar 'a' [('e','f')]) ~?= False,
    "Prueba unico elemento. Elemento a buscar pertenece a la lista" ~: (hayQueCodificar 'a' [('a','f')]) ~?= True,
    "Prueba varias elementos. Elemento no pertenece a la lista" ~: (hayQueCodificar 'a' [('e','a'),('g','b'),('h','c')]) ~?= False
    ] 