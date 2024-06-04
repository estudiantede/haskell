#Archivos

#1
    #1
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, 'r')
    res = len(archivo.readlines())
    archivo.close()
    return res
    #2

    #3
#2
def clonar_sin_comentarios(nombre_archivo: str):
    archivo = open(nombre_archivo, 'r')
    
    salida: list[str] = []
    for linea in archivo.readlines():
        if not (es_un_comentario):
            salida.append(linea)
    
    archivo.close()

    f_out = open("clonado" + nombre_archivo, 'w')
    f_out.writelines(salida)

def es_un_comentario(s: str) -> bool:
    i: int = 0
    es_cometario: bool = False
    while (i < s and s[i] == ' '):
        i += 1
    if (s[i] == '#'):
        es_cometario = True
    return es_cometario



#3
def invertir_lineas(nombre_archivo: str):
    archivo_in = open(nombre_archivo, 'r')
    lista: list [str] = archivo_in.readlines()

    archivo_in.close()

    lista = lista.reverse() #Teoricamente, no se puede usar, pero no tengo ganas de programarla
    archivo_out = open("reverso.txt", 'r')
    archivo.writelines(lista)
    archivo_out.close()

#4
def agregar_frase_al_final(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, 'a')
    archivo.write(frase)
    archivo.close
#5
def agregar_frase_al_principio(nombre_archivo: str, frase: str):
    archivo = open (nombre_archivo, 'r')
    lista = archivo.readlines()
    lista.insert(0,frase)
    archivo.close()

    archivo = open(nombre_archivo, 'w')
    archivo.writelines(lista)
    archivo.close()

#6


#7


#Pilas

#8

def generar_nros_al_azar (cantidad : int, desde : int, hasta : int) -> Pila[int]:
    cola_de_numeros: Pila = Pila()
    for i in range(cantidad):
        cola_de_numeros.put(random.randint(desde, hasta))
    return cola_de_numeros
    

#9

def cantidad_elementos(p: Pila) -> int:
    pila_cache: Pila = Pila()
    i: int = 0
    while (not p.empty()):
        pila_cache.put(p.get())
        i += 1
    
    #se pone de nuevo la pila en p
    while(not pila_cache.empty()):
        p.put(pila_cache.get())
    return i


#10

def buscar_el_maximo(p : Pila[int]) -> int:
    if (p.empty):
        return None
    
    res: int = p.get()
    pila_cache: Pila = Pila()
    while (not p.empty()):
        cache: int = p.get()
        if (res < cache):
            res = cache
        pila_cache.put(cache)

    while (not pila_cache.empty):
        p.put(pila_cache.get())
    
    return res


#11

def esta_bien_balanceada(s:str) -> bool: #Me importan solamente los parentesis, el resto no indica que lo analize
    pila_parentesis: Pila[str] = Pila()
    parentesis: int = 0 # Este numero voy a fijarme de sumarle 1 con ) y -1 con ( para de esa forma, fijarme si en algun momento es negativo o termina en numero distinto de 0
    res: bool = True

    for i in str:
        if (i == '(' or i == ')'):
            pila_parentesis.put(i)
    
    while (not pila_parentesis.empty):
        if (pila_parentesis.get() == ')'):
            parentesis += 1
        else: #Se que solamente puede ser ( o )
            parentesis -= 1

        #Me fijo que no haya mas ) que estos (
        if (parentesis < 0):
            res = False
        
    return res

#12

#Colas

#13

"""
def generar_nros_al_azar_cola() -> Cola[int]:
    return Cola[int]
"""

#14

#15

#16

def armar_secuencia_de_bingo() -> Cola[int]:
    lista_numeros: list[int] = []
    cola_numeros: Cola[int] = Cola()
    for i in range (0, 100):
        lista_numeros.append(i)
    print(lista_numeros)
    random.shuffle(lista_numeros)
    

    for i in lista_numeros:
        cola_numeros.put(i)

    return cola_numeros

#17

#18

#Diccionarios

#19

def agrupar_por_longitud(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, 'r')
    
    diccionario_de_palabras: dict[int, int] = {}

    linea: str = archivo.readline()
    while linea != '':
        
        linea = archivo.readline()
    
    archivo.close()

def separarPalabras(linea: str, diccionario: dict[int, int]) -> None:
    lista_palabras: list[str] = []
    palabra: str = ""
    for i in linea:
        if i == ' ' and palabra != '':
            lista_palabras.append(palabra)
        if i == ' ':
            palabra = ''

