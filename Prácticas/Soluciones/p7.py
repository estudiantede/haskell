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

  # 3

def suma_totales(s: list[int]) -> int:
    a: int = 0
    for i in s:
        a += i
    return a

  # 4

  # 5

  # 6

  # 7

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

  # 2

  # 3

# Ej 5

  # 1

  # 2

  # 3

  # 4

  # 5
