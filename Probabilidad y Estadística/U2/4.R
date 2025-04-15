setwd("/home/gaspi/Documentos/Carrera/TODOACA/LCC/Probabilidad y Estadística/U2")
datos <- read.table("anorexia.data", sep="\t", header = TRUE)

signosVisibles <- c(
  "0" = "Dieta severa",
  "1" = "Hiperactividad",
  "2" = "Uso de laxantes",
  "3" = "Uso de ropa holgada"
)

print(signosVisibles)

cant_mujeres_por_signo <- table(datos$Signo[datos$Sexo == "F"])
print(cant_mujeres_por_signo)

cant_hombres_por_signo <- table(datos$Signo[datos$Sexo == "M"])
print(cant_hombres_por_signo)

# Otra forma:
tabla_signo_sexo <- table(datos$Signo, datos$Sexo)
print(tabla_signo_sexo)

# Apply permite aplicar funciones a matrices
# si MARGIN = 1 es por filas y si = 2 por columnas.
# FUN puede ser sum, mean, max.
tabla_con_margenes_1 <- apply(tabla_signo_sexo, 1, sum) # Esto me da el margen, no la array.
print(tabla_con_margenes_1)
tabla_con_margenes_2 <- apply(tabla_signo_sexo, 2, sum)
print(tabla_con_margenes_2)
tabla_final <- cbind(tabla_signo_sexo, Total = tabla_con_margenes_1)
print(tabla_final)
# CBIND añade une COLUMNAS

tabla_final <- rbind(tabla_final, Total = tabla_con_margenes_2)
rownames(tabla_final) <- c("Dieta severa", "Hiperactividad", "Uso de laxantes", "Uso de ropa holgada", "Total")

#RBIND añade FILAS



