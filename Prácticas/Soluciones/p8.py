def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, 'r')
    res = len(archivo.readlines())
    archivo.close()
    return res

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
