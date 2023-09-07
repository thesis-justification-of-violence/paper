## Grupos Desaventajados: Nivel educacional

### Descriptivo


sjmisc::frq(procjv$educ)


### Recodificacion


# Recoficiacion NA
procjv$educ<- set_na(procjv$educ, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)
set_na

# Creacion variable factor
procjv$educ_factor <- factor(procjv$educ, levels = c(1:10), labels = c("Sin estudios",
                                                                       "Educacion Basica o Preparatoria incompleta",
                                                                       "Educacion Basica o Preparatoria completa",
                                                                       "Educacion Media o Humanidades incompleta",
                                                                       "Educacion Media o Humanidades completa",
                                                                       "Tecnica Superior incompleta",
                                                                       "Tecnica Superior completa",
                                                                       "Universitaria incompleta",
                                                                       "Universitaria completa",
                                                                       "Estudios de posgrado (magister o doctorado)"))

# Etiquetado variable factor
procjv$educ_factor <- sjlabelled::set_label(procjv$educ_factor, label = "Nivel educacional del entrevistado")

# Crear variable de educacion recodificada

procjv$educ_rec <- car::recode(procjv$educ, "c(1,2)=1; c(3)=2;c(4,5)=3;c(6,7)=4;c(8,9,10)=5")

# Re etiquetar categorias

procjv$educ_rec <- set_labels(procjv$educ_rec,
                              labels=c( "Primaria incompleta menos"=1,
                                        "Primaria y secundaria baja"=2,
                                        "Secundaria alta"=3,
                                        "Terciaria ciclo corto"=4,
                                        "Terciaria y Postgrado"=5))

# Etiquetado variable factor
procjv$educ_rec <- sjlabelled::set_label(procjv$educ_rec, label = "Nivel Educacional CINE 11")

# Creacion variable rec factor
procjv$educ_rec_factor <- factor(procjv$educ_rec, levels = c(1,2,3,4,5), labels = c("Primaria incompleta menos",
                                                                                    "Primaria y secundaria baja",
                                                                                    "Secundaria alta",
                                                                                    "Terciaria ciclo corto",
                                                                                    "Terciaria y Postgrado"))



# Etiquetado variable rec factor
procjv$educ_rec_factor <- sjlabelled::set_label(procjv$educ_rec_factor, label = "Nivel Educacional CINE 11")



### Descriptivo final


sjmisc::frq(procjv$educ)

sjmisc::frq(procjv$educ_factor)

sjmisc::frq(procjv$educ_rec)

sjmisc::frq(procjv$educ_rec_factor)

