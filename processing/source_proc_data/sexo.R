## Grupos Desaventajados: Sexo

### Descriptivo


sjmisc::frq(procjv$sexo)


### Recodificacion


# Recoficiacion NA
procjv$sexo<- set_na(procjv$sexo, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)

# Creacion variable factor
procjv$sexo_factor <- factor(procjv$sexo, levels = c(1,2), labels = c("Hombre", "Mujer"))

# Etiquetado variable factor
procjv$sexo_factor <- sjlabelled::set_label(procjv$sexo_factor, label = "Sexo")


### Desriptivo final


sjmisc::frq(procjv$sexo)

sjmisc::frq(procjv$sexo_factor)
