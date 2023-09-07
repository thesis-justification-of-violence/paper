## Grupos desaventajados: Satisfaccion con los ingresos

### Descriptivo


sjmisc::frq(procjv$ingreso_satisfact)


### Recodificacion


# Recoficiacion NA
procjv$ingreso_satisfact<- set_na(procjv$ingreso_satisfact, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)

# # Aplicar inversión
# procjv$ingreso_satisfact <- car::recode(procjv$ingreso_satisfact,"
#                                               c(5) = 1;
#                                               c(4) = 2;
#                                               c(3) = 3;
#                                               c(2) = 4;
#                                               c(1) = 5")
# 
# procjv$ingreso_satisfact <- sjlabelled::set_labels(procjv$ingreso_satisfact, labels = c(
#   "Totalmente insatisfecho" = 5,
#   "Insatisfecho" = 4,
#   "Ni satisfecho ni insatisfecho" = 3,
#   "Satisfecho" = 2,
#   "Totalmente satisfecho" = 1
# ))
# 
# 
# # Creación variable factor
# procjv$ingreso_satisfact_factor <- factor(procjv$ingreso_satisfact, levels = c(1:5), labels = c("Totalmente satisfecho", "Satisfecho", "Ni satisfecho ni insatisfecho", "Insatisfecho", "Totalmente insatisfecho"))
# 

# Creacion variable factor
procjv$ingreso_satisfact_factor <- factor(procjv$ingreso_satisfact, levels = c(1,2,3,4,5), labels = c("Totalmente insatisfecho",
                                                                                                      "Insatisfecho",
                                                                                                      "Ni satisfecho ni insatisfecho",
                                                                                                      "Satisfecho",
                                                                                                      "Totalmente satisfecho"))

frq(procjv$ingreso_satisfact_factor)

procjv$ingreso_satisfact_factor <- factor(procjv$ingreso_satisfact_factor, levels = c("Totalmente satisfecho",
                                                                                      "Satisfecho",
                                                                                      "Ni satisfecho ni insatisfecho",
                                                                                      "Insatisfecho",
                                                                                      "Totalmente insatisfecho")
)

frq(procjv$ingreso_satisfact_factor)



# Etiquetado variable factor
procjv$ingreso_satisfact_factor <- sjlabelled::set_label(procjv$ingreso_satisfact_factor, label = "Satisfaccion Ingresos")

sjmisc::frq(procjv$ingreso_satisfact)

sjmisc::frq(procjv$ingreso_satisfact_factor)