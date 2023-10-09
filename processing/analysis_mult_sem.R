# 0. Identification ----------------------------------
#Title: Analysis code for a research paper "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest."
#Institution: Centro de Estudios de Conflicto y Cohesión Social (COES)
#Responsable: Research Assistant

# Executive Summary: This script contains the code make the multivariate analysis for "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest.".

# 1. Load packages -----------------------------------

if (!require("pacman"))
  install.packages("pacman")  #if pacman es missing, install

pacman::p_load(tidyverse,
               sjmisc,
               sjPlot,
               summarytools,
               sjlabelled,
               car,
               haven,
               kableExtra,
               SciViews,
               ordinal)

# 2. Load data --------------------------------------

procjv <-
  readRDS("input/data/proc/procjv.RDS") %>% select(
    jv_est_2019_factor,
    jv_carab1_2019_factor,
    jv_carab2_2019_factor,
    sj_ceo_rec,
    sj_obrero_rec,
    sj_entrevistado_rec,
    ingreso,
    sexo_factor,
    educ_factor,
    ingreso,
    ingreso_satisfact_factor,
    sdo_indice,
    rwa_indice,
    trato_carab_factor
  ) %>% na.omit(.) # Proc data

# Re escalar ingresos
procjv$ingreso <- procjv$ingreso/300000 # Rescalar
