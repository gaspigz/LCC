import json

def agregar_id_ciudades(archivo_entrada, archivo_salida):
    with open(archivo_entrada, 'r', encoding='utf-8') as f:
        ciudades = json.load(f)
    
    for i, ciudad in enumerate(ciudades, start=1):
        ciudad['id'] = i
    
    with open(archivo_salida, 'w', encoding='utf-8') as f:
        json.dump(ciudades, f, indent=2, ensure_ascii=False)

archivo_entrada = "ciudades_arg.json"
archivo_salida = "ciudades_arg_con_id.json"

agregar_id_ciudades(archivo_entrada, archivo_salida)
