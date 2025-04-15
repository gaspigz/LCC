setwd("/home/gaspi/Documentos/Carrera/TODOACA/LCC/Probabilidad y Estadística/U2")

datos <- read.table("anorexia.data", sep="\t", header = TRUE)

head(datos) # Chequeo la data bien cargada
str(datos) # Chequeo la data bien cargada

freq_abs <- table(datos$Núm.de.visitas) # Table cuenta la cantidad de veces que aparece cada valor de un vector, en este caso nuestro vector es el de numero de visitas
print(freq_abs)

freq_rel <- round(freq_abs / sum(freq_abs), 4) # 4 es el numero de dig. de precision.
print(freq_rel)

freq_acum <- cumsum(freq_abs) # Da un vector cuyos elementos son la suma acumulada (o producto o max o min con cumprod, cummax o cummin) de los elementos del vector argumento.
print(freq_acum)


freq_rel_acum <- round(cumsum(freq_rel), 4)
print(freq_rel_acum)

freq_abs_sola_no_titles <- as.vector(freq_abs)
tabla_visitas <- cbind(freq_abs, freq_rel, freq_acum, freq_rel_acum)
tabla_visitas



# b)
edades = datos$Edad # Si yo hago table(datos$Edad) cuento CUANTAS VECES aparece cada edad.
print(edades)
rango_edad <- cut(edades, breaks = c(11, 14, 17, 20, 23, 26, 29, 32, 35), right = FALSE) # Divide un vector numerico en intervalos o categorias.
# Divide las edades en intervalos: [11,14), [14,27), ... [32,35)
# RIGHT = FALSE Hace que los intervalos sean abiertos por derecha.
print(rango_edad) 
# No es que rango_edad te da solo los intervalos (Esos serian los Levels), pero lo que tiene son el intervalo en cual esta cada edad.

edad_freq_abs <- table(rango_edad)
print(edad_freq_abs)

edad_freq_rel <- round(edad_freq_abs / sum(edad_freq_abs), 4)

edad_freq_abs_acum <- cumsum(edad_freq_abs)

edad_freq_rel_acum <- cumsum(edad_freq_rel)

tabla_edad <- cbind(edad_freq_abs, edad_freq_rel, edad_freq_abs_acum, edad_freq_rel_acum)
print(tabla_edad)

# Esta en intervalos porque la edad es una variable cuantitativa, no cualitativa. Al dividirla en intervalos podemos ver cada entrada de la tabla como un rango etario, osea como una variable cualitativa.
# No tendria sentido hacerlo por edad porque hay edades con una, cero o multiples entradas.