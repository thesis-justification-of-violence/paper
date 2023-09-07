## Grupos Desaventajados: Pertenencia a Pueblos indigenas


### Descriptivo


sjmisc::frq(procjv$indigena)


### Recodificacion


# Recoficiacion NA
procjv$indigena <- set_na(procjv$indigena, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)

# Crear variable de pertenencia a grupos indigenas recodificada

procjv$indigena_rec <- car::recode(procjv$indigena, "c(10)=1; 
                                   c(2,3,4,5,6,7,8,9,11)=2;
                                   c(1)=3")

procjv$indigena_rec <- sjlabelled::set_label(procjv$indigena_rec, label = "Pertenencia a Pueblo Indigena")

# Creacion variable factor
procjv$indigena_rec_factor <- factor(procjv$indigena_rec, levels = c(1,2,3), labels = c("Ninguno", "Otro pueblo", "Mapuche"))

# Etiquetado variable factor
procjv$indigena_rec_factor <- sjlabelled::set_label(procjv$indigena_rec_factor, label = "Pertenencia a Pueblo Indigena")


### Desriptivo final


sjmisc::frq(procjv$indigena)

sjmisc::frq(procjv$indigena_rec_factor)






