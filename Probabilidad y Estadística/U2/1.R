setwd("/home/gaspi/Documentos/Carrera/TODOACA/LCC/Probabilidad y Estadística/U2")

# a) 
# Abra la base de datos con alg´un editor de texto.3 ¿De qu´e tama˜no es la muestra? 
# ¿Cu´antas variables se encuentran? ¿C´omo se llaman? ¿De qu´e tipo son? 
# ¿C´omo est´a separada una columna de otra?

# La muestra es de 59 unidades. Hay 4 variables. Signo y Sexo cualitativas, Edad y Cantidad de visitas cuantitativas.
# Separadas por una tabulación

# b)
anorexia <- read.table("anorexia.data", sep='\t', header = TRUE)


#2)
#a) 
attach(anorexia)
print(Signo)
print(Sexo)
print(Edad)
print(Núm.de.visitas)
#b)
class(Sexo)
class(Edad)

#c)
Sexo = as.factor(Sexo) # Aca hace dos levels
summary(Sexo)["M"]
summary(Edad[Sexo == "M"])



