## Ideología: Gobierno firme (RWA)

### Descriptivo


sjmisc::frq(procjv$rwa_gobierno_firme)



### Recodificacion


# Recoficiacion NA
procjv$rwa_gobierno_firme <-
  set_na(
    procjv$rwa_gobierno_firme,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$rwa_gobierno_firme_factor <-
  factor(
    procjv$rwa_gobierno_firme,
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
procjv$rwa_gobierno_firme_factor <-
  sjlabelled::set_label(procjv$rwa_gobierno_firme_factor, label = "RWA: Se necesita gobierno firme")


### Descriptivo final


sjmisc::frq(procjv$rwa_gobierno_firme)

sjmisc::frq(procjv$rwa_gobierno_firme_factor)



## Ideología: Mandatario fuerte (RWA)

### Descriptivo


sjmisc::frq(procjv$rwa_mandatario_fuerte)


### Recodificacion


# Recoficiacion NA
procjv$rwa_mandatario_fuerte <-
  set_na(
    procjv$rwa_mandatario_fuerte,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$rwa_mandatario_fuerte_factor <-
  factor(
    procjv$rwa_mandatario_fuerte,
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
procjv$rwa_mandatario_fuerte_factor <-
  sjlabelled::set_label(procjv$rwa_mandatario_fuerte_factor, label = "RWA: Mandatario determinado para guiarnos")


### Descriptivo final


sjmisc::frq(procjv$rwa_mandatario_fuerte)

sjmisc::frq(procjv$rwa_mandatario_fuerte_factor)


## Ideología: Valores niños (RWA)

### Descriptivo


sjmisc::frq(procjv$rwa_valores_ninos)


### Recodificacion


# Recoficiacion NA
procjv$rwa_valores_ninos <-
  set_na(
    procjv$rwa_valores_ninos,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$rwa_valores_ninos_factor <-
  factor(
    procjv$rwa_valores_ninos,
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
procjv$rwa_valores_ninos_factor <-
  sjlabelled::set_label(procjv$rwa_valores_ninos_factor, label = "RWA: Valores importantes que niños deberían aprender")


### Descriptivo final


sjmisc::frq(procjv$rwa_valores_ninos)

sjmisc::frq(procjv$rwa_valores_ninos_factor)


## Ideología: Obediencia y disciplina (RWA)

### Descriptivo


sjmisc::frq(procjv$rwa_obediencia_discplina)


### Recodificacion


# Recoficiacion NA
procjv$rwa_obediencia_discplina <-
  set_na(
    procjv$rwa_obediencia_discplina,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  )

# Creacion variable factor
procjv$rwa_obediencia_discplina_factor <-
  factor(
    procjv$rwa_obediencia_discplina,
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
procjv$rwa_obediencia_discplina_factor <-
  sjlabelled::set_label(procjv$rwa_obediencia_discplina_factor, label = "RWA: Obedencia y disclpina como valores claves")


### Descriptivo final


sjmisc::frq(procjv$rwa_obediencia_discplina)

sjmisc::frq(procjv$rwa_obediencia_discplina_factor)


### Otros ajustes


# RWA

procjv <-
  procjv %>% rowwise() %>% mutate(
    rwa_indice = sum(
      rwa_gobierno_firme,
      rwa_mandatario_fuerte,
      rwa_valores_ninos,
      rwa_obediencia_discplina,
      na.rm = T
    ) / 4
  ) # Promediar indicadores

frq(procjv$rwa_indice)

# procjv$rwa_indice <-
#   (procjv$rwa_indice - min(procjv$rwa_indice)) / (max(procjv$rwa_indice) -
#                                                     min(procjv$rwa_indice))*100 # Estandarizar

procjv$rwa_indice <-
  sjlabelled::set_label(procjv$rwa_indice, label = "RWA Indice") # Etiquetar

### Farecuencia variable nueva

frq(procjv$rwa_indice)
