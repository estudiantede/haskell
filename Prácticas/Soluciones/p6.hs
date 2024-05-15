
import math

def imprimir_hola_mundo ():
    print("Hola mundo")

def imprimir_un_verso(): 
    print("Un verso\nUn verso")

def raizDe2():
    return round (math.sqrt(2), 4)

def factorialDe2():
    return 2

def perimetro ():
    return math.pi * 2

def raiz_cuadrada_de_un_numero (numero):
    return (math.sqrt (numero))

def fahrenheit_a_celsius(numero):
    return (((numero - 32) * 5) / 9)

def imprimir_dos_veces(estribillo):
    print(estribillo)
    print(estribillo)

def es_multiplo_de(n, m):
    return ((n % m == 0))

def es_par(n):
    return (es_multiplo_de (n,2))

def cantidad_de_pizzas(comensales, min_cant_porciones):
    return ((comensales * min_cant_porciones) // 8)

def alguno_es_0(n,m):
    return ((n == 0) or (m == 0))

def ambos_son_0(n,m):
    return ((n == 0) and (m == 0))

def es_nombre_largo(nombre):
    return ((3 <= len(nombre)) and (len(nombre) <= 8))

def es_bisiesto(year):
    return ((year % 400) == 0) or (((year % 4) == 0) and (not ((year % 100) == 0)))

def peso_pino(altura):
    return altura


def esMayorQue3(altura):
    return altura > 3

def es_peso_util(peso):
    return ((peso >= 400) and (peso <= 1000))

def sirve_pino(altura):
    return (es_peso_util(peso_pino(altura)))

def devolver_el_doble_si_es_par(numero):
    if (es_par(numero)):
        return numero * 2
    return numero

def devolver_valor_si_es_par_sino_el_que_sigue(numero):
    if (es_par(numero)):
        return numero
    return numero + 1

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero):
    if (numero % 3 == 0):
        return ((numero % 9 == 0) * numero * 3) or numero * 2
    else:
        return numero    
    


def lindo_nombre(nombre):
    if (len(nombre) >= 5): return "Tu nombre tiene muchas letra"
    return "Tu nombre tiene menos de 5 caractere"

def elRango(numero):
    if (numero < 5):
        print("Menor a 5")
    elif(numero >= 5 and numero <= 10):
        print("Numero entre 5 y 10")
    elif (numero >= 20):
        print("Numero mayor a 20")

def autoritarismo(sexo, edad):
    if (sexo == 'F' and edad >= 60):
        print("Anda de vacaciones")
    elif (sexo == 'M' and edad >= 65):
        print("Andá de vacaciones")
    elif (edad < 18):
        print("Anda de vacaciones")
    else:
        print("A trabajar!")

def numeros_del_1_al_10():
    i = 0
    while (i < 10):
        i = i + 1
        print(i)

def numeros_pares_de_10_al_40():
    i = 10
    while (i < 40):
        if (i % 2 == 0):
            print(i)
        i = i + 1

def imprimir_eco_10_veces():
    i = 0
    while (i < 10):
        print("eco!")
        i = i + 1

def cuenta_regresiva(numero):
    while (numero > 0):
        print(numero)
        numero = numero - 1
    print("Despegue!")

def viaje_en_el_tiempo(partida, llegada):
    while (partida > llegada):
        partida = partida - 1
        print("Viajó un año al pasado, estamos en el año: " + str(partida))
        
def viaje_hasta_aristoteles(partida):
    while (partida > (-384)):
        
        print("Viajó 20 años al pasado, estamos en el año: " + str(partida))
        partida = partida - 20


viaje_hasta_aristoteles(0)
