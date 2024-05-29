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

#9

#10

#11

#12

#Colas

#13

#14

#15

#16

#17

#18

#Diccionarios

#19

#20

#21

#22

#23
