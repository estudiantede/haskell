from queue import LifoQueue as Pila
from queue import Queue as Cola
import random


#Archivoss

#1
    #1
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, 'r')
    res = len(archivo.readlines())
    archivo.close()
    return res

    #2

def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, "r")
    res: bool = False
    linea_cache: str = archivo.readline()

    while (linea_cache != ''):
        lista_palabras: list[str] = separarPalabras(linea_cache)

        if pertenece_a_lista(palabra, lista_palabras):
            res = True
        linea_cache = archivo.readline()
    archivo.close()
    return res

def pertenece_a_lista(palabra_a_buscar: str, lista_palabras: list[str]) -> bool:
    res: bool = False
    for i in lista_palabras:
        if (i == palabra_a_buscar):
            res = True
    return res


def separar_palabras(linea: str) -> list[str]:
    palabras = ''
    res: list[str] = []
    for i in linea:
        if es_espacio(i) and palabras != '':
             res.append(palabras)
        if (es_espacio(i)):
            palabras = ''
        else:
            palabras += i

    if (palabras != ''):
        res.append(palabras)
    return res
    
def es_espacio(caracter: str) -> bool:
    return caracter == ' ' or caracter == '\n' or caracter == '\t'

    #3

def cantidad_apariciones(palabra_a_contar: str, nombre_de_archivo: str) -> int: 
    archivo = open(nombre_de_archivo, "r")
    res: int = 0

    linea_cache: str = archivo.readline()

    while (linea_cache != ''):
        lista_palabras: list[str] = separarPalabras(linea_cache)
        res += contar_apariciones(lista_palabras, palabra_a_contar)
        linea_cache = archivo.readline()
    
    archivo.close()
    return res

def contar_apariciones(lista_palabras:list[str], palabra_a_buscar: str) -> int:
    res: int = 0
    for i in lista_palabras:
        if i == palabra_a_buscar:
            res += 1
    
    return res

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
    archivo_out.writelines(lista)
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

#20

#21

#22

#23

def agregar_producto(inventario: dict[(str, dict[(str, str|int|float)])],nombre: str, precio: int, cantidad: int) -> None:
    res_a_agregar: dict[(str, str|int)] = {}
    res_a_agregar["nombre"] = nombre
    res_a_agregar["precio"] = precio
    res_a_agregar["cantidad"] = cantidad

    inventario[nombre] = res_a_agregar

def actualizar_stock(inventario: dict[(str, dict[(str, str|int)])], nombre: str, cantidad: int)  -> None:
    inventario[nombre]["cantidad"] = cantidad

def actualizar_precios(inventario: dict[(str, dict[(str, str|int)])], nombre: str, precio: float) -> None:
    inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario: dict[(str, dict[(str, str|int)])]) ->  float:
    res: float = 0
    for i in inventario:
        cantidad_producto: int = inventario[i]["cantidad"]
        precio_producto: float = inventario[i]["precio"]
        res += cantidad_producto * precio_producto
    return res