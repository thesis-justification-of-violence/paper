## Ideología: Sociedad Ideal (SDO)

### Descriptivo


sjmisc::frq(procjv$sdo_soc_ideal)



### Recodificacion


# Recoficiacion NA
procjv$sdo_soc_ideal <-
  set_na(
    procjv$sdo_soc_ideal,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$sdo_soc_ideal_factor <-
  factor(
    procjv$sdo_soc_ideal,
    levels = c(1:5),
    labels = c(
      "Totalmente en desacuerdo",
      "En desacuerdo",
      "Ni de acuerdo ni en desacuerdo",
      "De acuerdo",
      "Totalmente de acuerdo"
    )
  )

# Etiquetado variable factor
procjv$sdo_soc_ideal_factor <-
  sjlabelled::set_label(procjv$sdo_soc_ideal_factor, label = "SDO: Sociedad ideal requiere grupos superiores e inferiores")


### Descriptivo final


sjmisc::frq(procjv$sdo_soc_ideal)

sjmisc::frq(procjv$sdo_soc_ideal_factor)




## Ideología: Grupos Inferiores (SDO)

### Descriptivo


sjmisc::frq(procjv$sdo_grupos_inferiores)



### Recodificacion


# Recoficiacion NA
procjv$sdo_grupos_inferiores <-
  set_na(
    procjv$sdo_grupos_inferiores,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$sdo_grupos_inferiores_factor <-
  factor(
    procjv$sdo_grupos_inferiores,
    levels = c(1:5),
    labels = c(
      "Totalmente en desacuerdo",
      "En desacuerdo",
      "Ni de acuerdo ni en desacuerdo",
      "De acuerdo",
      "Totalmente de acuerdo"
    )
  )

# Etiquetado variable factor
procjv$sdo_grupos_inferiores_factor <-
  sjlabelled::set_label(procjv$sdo_grupos_inferiores_factor, label = "SDO: Grupos son inferiores que otros")


### Descriptivo final


sjmisc::frq(procjv$sdo_grupos_inferiores)

sjmisc::frq(procjv$sdo_grupos_inferiores_factor)




## Ideología: Oportunidades Iguales (SDO)

### Descriptivo


sjmisc::frq(procjv$sdo_oportunidades_iguales)


### Recodificacion


# Recoficiacion NA
procjv$sdo_oportunidades_iguales <-
  set_na(
    procjv$sdo_oportunidades_iguales,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Aplicar inversión
procjv$sdo_oportunidades_iguales <-
  car::recode(procjv$sdo_oportunidades_iguales,
              "
                                              c(5) = 1;
                                              c(4) = 2;
                                              c(3) = 3;
                                              c(2) = 4;
                                              c(1) = 5")

procjv$sdo_oportunidades_iguales <-
  sjlabelled::set_labels(
    procjv$sdo_oportunidades_iguales,
    labels = c(
      "Totalmente en desacuerdo" = 5,
      "En desacuerdo" = 4,
      "Ni de acuerdo ni en desacuerdo" = 3,
      "De acuerdo" = 2,
      "Totalmente de acuerdo" = 1
    )
  )

procjv$sdo_oportunidades_iguales <-
  sjlabelled::set_label(procjv$sdo_oportunidades_iguales, label = "SDO: Misma oportunidad entre grupos (inversion aplicada)")

# Creación variable factor
procjv$sdo_oportunidades_iguales_factor <-
  factor(
    procjv$sdo_oportunidades_iguales,
    levels = c(1:5),
    labels = c(
      "Totalmente de acuerdo",
      "De acuerdo",
      "Ni de acuerdo ni en desacuerdo",
      "En desacuerdo",
      "Totalmente en desacuerdo"
    )
  )

# Etiquetado variable factor
procjv$sdo_oportunidades_iguales_factor <-
  sjlabelled::set_label(procjv$sdo_oportunidades_iguales_factor, label = "SDO: Misma oportunidad entre grupos (inversion aplicada)")


### Descriptivo final


sjmisc::frq(procjv$sdo_oportunidades_iguales)

sjmisc::frq(procjv$sdo_oportunidades_iguales_factor)





## Ideología: Condiciones iguales (SDO)

### Descriptivo


sjmisc::frq(procjv$sdo_condiciones_iguales)



### Recodificacion


# Recoficiacion NA
procjv$sdo_condiciones_iguales <-
  set_na(
    procjv$sdo_condiciones_iguales,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Aplicar inversión
procjv$sdo_condiciones_iguales <-
  car::recode(procjv$sdo_condiciones_iguales,
              "
                                              c(5) = 1;
                                              c(4) = 2;
                                              c(3) = 3;
                                              c(2) = 4;
                                              c(1) = 5")

procjv$sdo_condiciones_iguales <-
  sjlabelled::set_labels(
    procjv$sdo_condiciones_iguales,
    labels = c(
      "Totalmente en desacuerdo" = 5,
      "En desacuerdo" = 4,
      "Ni de acuerdo ni en desacuerdo" = 3,
      "De acuerdo" = 2,
      "Totalmente de acuerdo" = 1
    )
  )

procjv$sdo_condiciones_iguales <-
  sjlabelled::set_label(procjv$sdo_condiciones_iguales, label = "SDO: Condiciones iguales entre grupos (inversion aplicada)")

# Creación variable factor
procjv$sdo_condiciones_iguales_factor <-
  factor(
    procjv$sdo_condiciones_iguales,
    levels = c(1:5),
    labels = c(
      "Totalmente de acuerdo",
      "De acuerdo",
      "Ni de acuerdo ni en desacuerdo",
      "En desacuerdo",
      "Totalmente en desacuerdo"
    )
  )

# Etiquetado variable factor
procjv$sdo_condiciones_iguales_factor <-
  sjlabelled::set_label(procjv$sdo_condiciones_iguales_factor, label = "SDO: Condiciones iguales entre grupos (inversion aplicada)")



### Descriptivo final


sjmisc::frq(procjv$sdo_condiciones_iguales)

sjmisc::frq(procjv$sdo_condiciones_iguales_factor)



### Otros ajustes


# Crear indices para ideología

# SDO

procjv <-
  procjv %>% rowwise() %>% mutate(
    sdo_indice = sum(
      sdo_soc_ideal,
      sdo_grupos_inferiores,
      sdo_oportunidades_iguales,
      sdo_condiciones_iguales,
      na.rm = T
    ) / 4
  ) # Promedias indicadores

frq(procjv$sdo_indice)

procjv$sdo_indice <-
  # (procjv$sdo_indice - min(procjv$sdo_indice)) / (max(procjv$sdo_indice) -
  #                                                   min(procjv$sdo_indice))*100 # Estandarizar

procjv$sdo_indice <-
  sjlabelled::set_label(procjv$sdo_indice, label = "SDO Indice") # Etiquetar

# Frecuencias variables nuevas

frq(procjv$sdo_indice)
