## Grupos Desaventajados: Ingresos tramos


sjmisc::frq(procjv$ingreso_tramos)


### Recodificacion


# Recoficiacion NA
procjv$ingreso_tramos<- set_na(procjv$ingreso_tramos, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)

# Creacion variable factor
procjv$ingreso_tramos_factor <- factor(procjv$ingreso_tramos, levels = c(1:16), labels = c("Menos de $40.000 mensuales liquidos",
                                                                                           "De $40.001 a $85.000 mensuales liquidos",
                                                                                           "De $85.001 a $125.000 mensuales liquidos",
                                                                                           "De $125.001 a $170.000 mensuales liquidos",
                                                                                           "De $170.001 a $210.000 mensuales liquidos",
                                                                                           "De $210.001 a $230.000 mensuales liquidos",
                                                                                           "De $230.001 a $280.000 mensuales liquidos",
                                                                                           "De $280.001 a $320.000 mensuales liquidos",
                                                                                           "De $320.001 a $360.000 mensuales liquidos",
                                                                                           "De $360.001 a $400.000 mensuales liquidos",
                                                                                           "De $400.001 a $465.000 mensuales liquidos",
                                                                                           "De $465.001 a $540.000 mensuales liquidos",
                                                                                           "De $540.001 a $665.000 mensuales liquidos",
                                                                                           "De $665.001 a $850.000 mensuales liquidos",
                                                                                           "De $850.001 a $1.300.000 mensuales liquidos",
                                                                                           "Mas de $1.300.001 a mensuales liquidos"))

# Etiquetado variable factor
procjv$ingreso_tramos_factor <- sjlabelled::set_label(procjv$ingreso_tramos_factor, label = "Ingreso mensual del entrevistado en tramos")

# Imputar marcas de clase de ingreso tramo a ingreso monto

# Pero antes, saquemos el promedio de la gente que tiene ingresos mayores al monto del último tramo de ingreso (1.300.001)

ingresos <- procjv$ingreso[procjv$ingreso > 1300001]
ingresos.base <- data.frame(ingresos)
ingresos.base <- na.omit(ingresos.base)
mean(ingresos.base$ingresos)

# El promedio de las 103 personas que tienen ingresos mayores a 1.300.001 es de 2.221.359, por lo que ese será el valor a imputar
# 
# procjv$ingreso[procjv$ingreso_tramos == 1] <- 20000
# procjv$ingreso[procjv$ingreso_tramos == 2] <- 62500
# procjv$ingreso[procjv$ingreso_tramos == 3] <- 105000
# procjv$ingreso[procjv$ingreso_tramos == 4] <- 147500
# procjv$ingreso[procjv$ingreso_tramos == 5] <- 190000
# procjv$ingreso[procjv$ingreso_tramos == 6] <- 220000
# procjv$ingreso[procjv$ingreso_tramos == 7] <- 255000
# procjv$ingreso[procjv$ingreso_tramos == 8] <- 300000
# procjv$ingreso[procjv$ingreso_tramos == 9] <- 340000
# procjv$ingreso[procjv$ingreso_tramos == 10] <- 380000
# procjv$ingreso[procjv$ingreso_tramos == 11] <- 432500
# procjv$ingreso[procjv$ingreso_tramos == 12] <- 502500
# procjv$ingreso[procjv$ingreso_tramos == 13] <- 602500
# procjv$ingreso[procjv$ingreso_tramos == 14] <- 757500
# procjv$ingreso[procjv$ingreso_tramos == 15] <- 1075000
# procjv$ingreso[procjv$ingreso_tramos == 16] <- 2221359

# Crear variable de quintiles

# Construccion ingresos per capita quintiles
procjv <- procjv %>% mutate(quintiles_ingreso = ntile(ingreso,5))

## Recuperar NA
procjv$quintiles_ingreso[is.na(procjv$quintiles_ingreso)] <- 99

# Construccion ingresos per capita quintiles factor
procjv$quintiles_ingreso_factor <- factor(procjv$quintiles_ingreso, levels = c(1,2,3,4,5,99), labels = c("Quintil 1", "Quintil 2", "Quintil 3", "Quintil 4", "Quintil 5", "No sabe/No responde"))
procjv$quintiles_ingreso_factor <- set_label(procjv$quintiles_ingreso_factor,label = "Quintiles de ingreso del entrevistado ")

# Construccion ingresos per capita quintiles factor con NS/NR al medio para correlaciones
procjv$quintiles_ingreso_factor_cor <- factor(procjv$quintiles_ingreso, levels = c(1,2,99,3,4,5), labels = c("Quintil 1", "Quintil 2", "Quintil 3", "No sabe/No responde", "Quintil 4", "Quintil 5"))
procjv$quintiles_ingreso_factor_cor <- set_label(procjv$quintiles_ingreso_factor,label = "Quintiles de de ingreso del entrevistado (NS/NR al medio) ")



### Descriptivo final


sjmisc::frq(procjv$ingreso_tramos)

sjmisc::frq(procjv$ingreso_tramos_factor)


