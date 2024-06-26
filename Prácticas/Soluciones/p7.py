#PRIMERA PARTE

# Ej 1

  # 1
def perteneceWhile(s: list[int], e: int) -> bool:
    estaEnLista: bool = False
    i: int = 0
    while (i < len(s) and estaEnLista == False):
        estaEnLista = s[i] == e
        i += 1
    return estaEnLista        

def perteneceForEach(s: list[int], e: int) -> bool:
    for i in s:
        if (i == e):
            return True
    return False
        
def perteneceFor(s: list[int], e: int) -> bool:
    estaEnLista: bool = False
    for i in range (len(s)):
        if s[i] == e:
            estaEnLista = True
    return estaEnLista

#Dicen que haya muchos returns es mala pràctica de programacion. A tener en cuenta, pero si es por manejo de memoria, hasta serìa mejor por una iteracion menos, pero es medio al pedo

  # 2

def divide_a_todos(s: list[int], e: int) -> bool:
    divide_e_a_todos: bool = True
    for i in s:
        if i % e != 0:
            divide_e_a_todos = False
    return divide_a_todos

  # 3

def suma_totales(s: list[int]) -> int:
    a: int = 0
    for i in s:
        a += i
    return a

  # 4

def ordenados(lista: list[int]) -> bool:
    esta_ordenado: bool = True
    for i in range(len(lista) - 1):
        if (lista[i] > lista[i + 1]):
            esta_ordenado = False
    return esta_ordenado

  # 5

def alguna_tiene_longitud_mayor_a_7(s: list[str]):
    hay_alguna_longitud_mayor_a_7 = False
    for i in s:
        if len(i) > 7:
            hay_alguna_longitud_mayor_a_7: True
    return hay_alguna_longitud_mayor_a_7

  # 6

def es_capicua(s: str) -> bool:
    print(inverso (s))
    print(s)
    return str(inverso(s)) == s

def inverso(s: str) -> str:
    res = ""
    for i in range (len(s), 0, -1):
        res += s[i - 1]
    return res

  # 7

#Devuelve true <--> la primer componente es minuscula 
def esMinuscula(c: str) -> bool:
    return (c[0] >= 'a' and c[0] <= 'z')

def esMayuscula(c: str) -> bool:
    return (c[0] >= 'A' and c[0] <= 'Z')

def esNumero(c: str) -> bool:
    return (c[0] >= '0' and c[0] <= '9')

def tieneMinuscula(c: str) -> bool:
    es_minuscula: bool = False
    i: int = 0
    while (es_minuscula == False and i < len(c)):
        if (esMinuscula(c[i])):
            es_minuscula = True
        i += 1
    return es_minuscula

def tieneMayuscula(c: str) -> bool:
    es_mayuscula: bool = False
    i: int = 0
    while (es_mayuscula == False and i < len(c)):
        if (esMayuscula(c[i])):
            es_mayuscula = True
        i += 1
    return es_mayuscula

def tieneNumero(c: str) -> bool:
    es_numero: bool = False
    i: int = 0
    while (es_numero == False and i < len(c)):
        if (esNumero(c[i])):
            es_numero = True
        i += 1
    return es_numero

def fortaleza(contra: str) -> str:
    if (len(contra) < 5):
        return "ROJA"
    elif (tieneMayuscula(contra) and tieneMinuscula(contra) and tieneNumero(contra) and len(contra) > 8):
        return "VERDE"
    else:
        return "AMARILLA"

  # 8

  # 9

#SEGUNDA PARTE

# Ej 2

  # 1

  # 2

  # 3

  # 4

  # 5

  # 6

# Ej 3

# Ej 4

  # 1

def nombreso_ingresados() -> list[str]:
    rta = input("Ingrese un nombre. Lista para agregar")
    res = []
    while (rta != "listo"):
        res.append(rta)
        rta = input("Ingrese un nombre. Lista para agregar")
    return res


  # 2

  # 3

# Ej 5

  # 1

def pertenece_a_cada_uno(s:list[list[int]], e:int, res: list[bool]):
    res.clear()
    for lista in s:
        res.append(perteneceWhile(lista, e))

  # 2

  # 3

  # 4

  # 5
