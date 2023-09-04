
# 0. Identification ----------------------------------
#Title: Processing code for a research paper "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest."
#Institution: Centro de Estudios de Conflicto y Cohesión Social (COES)
#Responsable: Research Assistant

# Executive Summary: This script contains the code to create the database needed to elaborate the analyses for "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest.".
# Date: Sept 03, 2023

# 1. Load packages -----------------------------------

if (!require("pacman")) install.packages("pacman")  #if pacman es missing, install

pacman::p_load(tidyverse,
               sjmisc,
               sjPlot,
               summarytools,
               sjlabelled,
               car,
               haven,
               kableExtra,
               SciViews
               )

# 2. Load data --------------------------------------

load("input/data/original/ELSOC_Wide_2016_2019_v1.00_R.RData") # Public data from ELSOC 2016-2022

# 3. Select variables -------------------------------

procjv <- elsoc_wide_2016_2019 %>% dplyr::select(
  # idencuesta,
  # Variables dependientes
  ## Justification violence for social control
  jv_carab1_2019 = f05_03_w04, # Police repress marches
  jv_carab2_2019 = f05_04_w04, # Police evicte seizure
  
  ## Justification of violence for social change
  jv_est_2019 = f05_07_w04, # Studennts throw rocks
  
  # Independent variables
  
  ## Justicia distributiva
  salario_perc_ceo = d03_01_rev_w04, # Perceived salary CEO
  salario_perc_obrero = d03_02_rev_w04, # Perceived salary obrero
  salario_just_ceo = d04_01_rev_w04, # Just salary CEO
  salario_just_obrero = d04_02_rev_w04, # Just salary obrero
  ingreso_justo = m15_rev_w04, # Just income
  
  # Variables de control (literatura)
  
  ## Pertenencia a grupos desventajados
  
  ## Nota: Las variables relacionadas a a ingresos que contengan un "rev" están revisadas por el equipo que creo la       encuesta, por lo que están exentas de problemas de digitacion y similares.
  
  ingreso = m13_rev_w04, # Ingreso mensual (monto)
  ingreso_tramos = m14_w04, # Ingreso mensual (tramos)
  educ = m01_w04, # Nivel educacional del entrevistado
  ingreso_satisfact = m16_w04, # Satisfaccion con los ingresos
  sexo = m0_sexo_w04, # Sexo del entrevistado
  indigena = m53_w04, # Pertenencia a pueblos indigenas
  
  ## Ideología (SDO y RWA)
  sdo_soc_ideal = c18_01_w04, # Una sociedad ideal requiere que algunos grupos estén en una posicion superior y otros en una posicion inferior
  sdo_grupos_inferiores = c18_12_w04, # Algunos grupos de personas son simplemente inferiores a otros grupos
  sdo_oportunidades_iguales = c18_02_w04, # Debiéramos trabajar para dar a todos los grupos la misma oportunidad de tener éxito
  sdo_condiciones_iguales = c18_03_w04, # Deberíamos hacer todo lo posible por igualar las condiciones de diferentes grupos
  rwa_gobierno_firme = c18_04_w04, # En vez de tanta preocupacion por los derechos de las personas, lo que este país necesita es un gobierno firme
  rwa_mandatario_fuerte = c18_05_w04, # Lo que nuestro país necesita es un mandatario/a fuerte con la determinacion para llevarnos por el camino correcto
  rwa_valores_ninos = c18_06_w04, # La obediencia y el respeto por la autoridad son los valores más importantes que los niños debieran aprender
  rwa_obediencia_discplina = c18_07_w04, # Las verdaderas claves para tener una buena vida son la obediencia y la disciplina
  
  
  ## Percepcion trato justo
  trato_carab = c35_03_w04, # Trato respetuoso carabineros
  
  # Variables de control (exploratoria)
  
  edad = m0_edad_w04, # Edad del entrevistado
  pos_pol = c15_w04, # Posicion política
  frec_marcha = c08_02_w04, # Frecuencia participacion en marchas
  conf_carab = c05_03_w04 # Confianza en carabineros
)

# 4. Treat Na's----------------------------------------

procjv_respaldoet <- procjv # Hacemos un respaldo de la base para que no se pierdan las etiquetas

# Eliminar filas en donde todos los casos sean NA
procjv <- procjv[rowSums(is.na(procjv)) != ncol(procjv),]

procjv <-sjlabelled::copy_labels(procjv, procjv_respaldoet) # Copiamos las etiquetas una vez extraidos los NA

# 5. Process, recode and create new variables ------------------

source("processing/source_proc_data/jv_carab1_2019.R")
source("processing/source_proc_data/jv_carab2_2019.R")
source("processing/source_proc_data/jv_est_2019.R")
source("processing/source_proc_data/sj_obrero.R")
source("processing/source_proc_data/sj_ceo.R")
source("processing/source_proc_data/sj_entrevistado.R")
source("processing/source_proc_data/sdo_index.R")
source("processing/source_proc_data/rwa_index.R")
source("processing/source_proc_data/trato_carab.R")

# 6. Save proc data --------------------------------------------

saveRDS(procjv, "input/data/proc/procjv.RDS")
