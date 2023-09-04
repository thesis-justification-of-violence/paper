## Just. Porc. Trato respetuoso carabineros

### Descriptivo


# Frecuencias

sjmisc::frq(procjv$trato_carab)

sjmisc::frq(procjv$trato_carab_factor)



### Recodificacion


# Recoficiacion NA
procjv$trato_carab<- set_na(procjv$trato_carab, na = c(-888,-999), drop.levels = TRUE, as.tag = FALSE)

# Creacion variable factor
procjv$trato_carab_factor <- factor(procjv$trato_carab, levels = c(1,2,3,4,5), labels = c("Nunca", "Casi nunca", "A veces", "Casi siempre", "Siempre"))

# Etiquetado variable factor
procjv$trato_carab_factor <- sjlabelled::set_label(procjv$trato_carab_factor, label = "Trato Respetuoso Carabineros")



### Descriptivo final


sjmisc::frq(procjv$trato_carab)

sjmisc::frq(procjv$trato_carab_factor)
