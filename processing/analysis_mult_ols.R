# 0. Identification ----------------------------------
#Title: Analysis code for a research paper "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest."
#Institution: Centro de Estudios de Conflicto y Cohesión Social (COES)
#Responsable: Research Assistant

# Executive Summary: This script contains the code make the multivariate analysis for "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest.".
# Date: Sept 03, 2023

rm(list=ls())

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
               SciViews)

# 2. Load data --------------------------------------

procjv <-
  readRDS("input/data/proc/procjv.RDS") %>% dplyr::select(
    jv_est_2019,
    jv_barricada_2019,
    jv_carab1_2019,
    jv_carab2_2019,
    jv_cambio,
    jv_control,
    sj_ceo_rec,
    sj_obrero_rec,
    #sj_entrevistado_rec,
    p_gap_log,
    j_gap_log,
    perceived_injustice_log,
    # ingreso,
    sexo_factor,
    # educ_factor,
    educ,
    # ingreso_satisfact_factor,
    sdo_indice,
    rwa_indice,
    trato_carab_factor,
    edad,
    pos_pol_rec,
    region
  ) %>% na.omit(.) # Proc data

# Re escalar ingresos
# procjv$ingreso <- procjv$ingreso/300000 # Rescalar

# 3. Calculate ols models -------------------------------------------------------

# 3.1 Justification of violence for social control -------------------------

#### MY PROPOSAL ####

ma_jv_control <- lm(jv_control ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec 
                    + sdo_indice
                    + rwa_indice
                    + trato_carab_factor
                    , data = procjv)

mb_jv_control <- lm(jv_control ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                    + sdo_indice
                    + rwa_indice
                    + trato_carab_factor
                    , data = procjv)

#### REPLICATION ####

m1_jv_control <- lm(jv_control ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                    + sdo_indice
                    + rwa_indice
                    + trato_carab_factor
                    ,  data = procjv)

m2_jv_control <- lm(jv_control ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                    + sdo_indice
                    + rwa_indice
                    + trato_carab_factor
                    ,  data = procjv)

m3_jv_control <- lm(jv_control ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                    + sdo_indice
                    + rwa_indice
                    + trato_carab_factor
                    ,  data = procjv)

#### Ver modelos JV CONTROL ####

sjPlot::tab_model(ma_jv_control,
                  mb_jv_control,
                  m1_jv_control,
                  m2_jv_control,
                  m3_jv_control,
                  p.style = "stars",
                  show.ci = F)

# 3.2 Justification of violence for social change -------------------------

#### MY PROPOSAL ####

ma_jv_cambio <- lm(jv_cambio ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

mb_jv_cambio <- lm(jv_cambio ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

#### REPLICATION ####

m4_jv_cambio <- lm(jv_cambio ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

m5_jv_cambio <- lm(jv_cambio ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

m6_jv_cambio <- lm(jv_cambio ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)


#### Ver modelos JV CAMBIO ####

sjPlot::tab_model(ma_jv_cambio,
                  mb_jv_cambio,
                  m4_jv_cambio,
                  m5_jv_cambio,
                  m6_jv_cambio,
                  p.style = "stars",
                  show.ci = F)

# 3.3 Justification of violence for social change: students -------------------------

#### MY PROPOSAL ####

ma_jv_est_2019 <- lm(jv_est_2019 ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

mb_jv_est_2019 <- lm(jv_est_2019 ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

#### REPLICATION ####

m4_jv_est_2019 <- lm(jv_est_2019 ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

m5_jv_est_2019 <- lm(jv_est_2019 ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)

m6_jv_est_2019 <- lm(jv_est_2019 ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                   + sdo_indice
                   + rwa_indice
                   + trato_carab_factor
                   ,  data = procjv)


#### Ver modelos JV CAMBIO: Students ####

sjPlot::tab_model(ma_jv_est_2019,
                  mb_jv_est_2019,
                  m4_jv_est_2019,
                  m5_jv_est_2019,
                  m6_jv_est_2019,
                  p.style = "stars",
                  show.ci = F)

# 3.4 Justification of violence for social change: workers -------------------------

#### MY PROPOSAL ####

ma_jv_barricada_2019 <- lm(jv_barricada_2019 ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec
                     + sdo_indice
                     + rwa_indice
                     + trato_carab_factor
                     ,  data = procjv)

mb_jv_barricada_2019 <- lm(jv_barricada_2019 ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                     + sdo_indice
                     + rwa_indice
                     + trato_carab_factor
                     ,  data = procjv)

#### REPLICATION ####

m4_jv_barricada_2019 <- lm(jv_barricada_2019 ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                     + sdo_indice
                     + rwa_indice
                     + trato_carab_factor
                     ,  data = procjv)

m5_jv_barricada_2019 <- lm(jv_barricada_2019 ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                     + sdo_indice
                     + rwa_indice
                     + trato_carab_factor
                     ,  data = procjv)

m6_jv_barricada_2019 <- lm(jv_barricada_2019 ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                     + sdo_indice
                     + rwa_indice
                     + trato_carab_factor
                     ,  data = procjv)


#### Ver modelos JV CAMBIO: Worker ####

sjPlot::tab_model(ma_jv_barricada_2019,
                  mb_jv_barricada_2019,
                  m4_jv_barricada_2019,
                  m5_jv_barricada_2019,
                  m6_jv_barricada_2019,
                  p.style = "stars",
                  show.ci = F)

# 3.5 Justification of violence for social control: repression -------------------------

#### MY PROPOSAL ####

ma_jv_carab1_2019 <- lm(jv_carab1_2019 ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec
                           + sdo_indice
                           + rwa_indice
                           + trato_carab_factor
                           ,  data = procjv)

mb_jv_carab1_2019 <- lm(jv_carab1_2019 ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                           + sdo_indice
                           + rwa_indice
                           + trato_carab_factor
                           ,  data = procjv)

#### REPLICATION ####

m4_jv_carab1_2019 <- lm(jv_carab1_2019 ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                           + sdo_indice
                           + rwa_indice
                           + trato_carab_factor
                           ,  data = procjv)

m5_jv_carab1_2019 <- lm(jv_carab1_2019 ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                           + sdo_indice
                           + rwa_indice
                           + trato_carab_factor
                           ,  data = procjv)

m6_jv_carab1_2019 <- lm(jv_carab1_2019 ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                           + sdo_indice
                           + rwa_indice
                           + trato_carab_factor
                           ,  data = procjv)


#### Ver modelos JV CONTROL: REPRESSION ####

sjPlot::tab_model(ma_jv_carab1_2019,
                  mb_jv_carab1_2019,
                  m4_jv_carab1_2019,
                  m5_jv_carab1_2019,
                  m6_jv_carab1_2019,
                  p.style = "stars",
                  show.ci = F)

# 3.6 Justification of violence for social control: evicts -------------------------

#### MY PROPOSAL ####

ma_jv_carab2_2019 <- lm(jv_carab2_2019 ~ sj_ceo_rec + sexo_factor + edad + educ + region + pos_pol_rec
                        + sdo_indice
                        + rwa_indice
                        + trato_carab_factor
                        ,  data = procjv)

mb_jv_carab2_2019 <- lm(jv_carab2_2019 ~ sj_obrero_rec + sexo_factor + edad + educ + region + pos_pol_rec
                        + sdo_indice
                        + rwa_indice
                        + trato_carab_factor
                        ,  data = procjv)

#### REPLICATION ####

m4_jv_carab2_2019 <- lm(jv_carab2_2019 ~ p_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                        + sdo_indice
                        + rwa_indice
                        + trato_carab_factor
                        ,  data = procjv)

m5_jv_carab2_2019 <- lm(jv_carab2_2019 ~ j_gap_log + sexo_factor + edad + educ + region + pos_pol_rec
                        + sdo_indice
                        + rwa_indice
                        + trato_carab_factor
                        ,  data = procjv)

m6_jv_carab2_2019 <- lm(jv_carab2_2019 ~ perceived_injustice_log + sexo_factor + edad + educ + region + pos_pol_rec
                        + sdo_indice
                        + rwa_indice
                        + trato_carab_factor
                        ,  data = procjv)


#### Ver modelos JV CONTROL: EVICT ####

sjPlot::tab_model(ma_jv_carab2_2019,
                  mb_jv_carab2_2019,
                  m4_jv_carab2_2019,
                  m5_jv_carab2_2019,
                  m6_jv_carab2_2019,
                  p.style = "stars",
                  show.ci = F)

