# 0. Identification ----------------------------------
#Title:  code for a research paper "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest."
#Institution: Centro de Estudios de Conflicto y Cohesión Social (COES)
#Responsable: Research Assistant

# Executive Summary: This script contains the code make the multivariate analysis for "Who justifies what? The role of the sense of injustice in the justifications of violence in the context of protest.".
# Date: Sept 03, 2023

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
    jv_est_2019_bin,
    jv_carab1_2019_bin,
    jv_carab2_2019_bin,
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


# 3. Calculate binary models -------------------------------------------------------

# 3.1 Justification of students throwings rocks to police -------------------------

m1_jv_est <- glm(
  jv_est_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec,
  data = procjv,
  family = "binomial"
)

m2_jv_est <- glm(
  jv_est_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor, #+
    #educ_factor +
    #ingreso_satisfact_factor,
  data = procjv,
  family = "binomial"
)

m3_jv_est <- glm(
  jv_est_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
    #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice,
  data = procjv,
  family = "binomial"
)

m4_jv_est <- glm(
  jv_est_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
    #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice +
    trato_carab_factor,
  data = procjv,
  family = "binomial"
)




# 3.2 Justification of police repressing marches -------------------------

m1_jv_carab1 <- glm(
  jv_carab1_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec,
  data = procjv,
  family = "binomial"
)

m2_jv_carab1 <- glm(
  jv_carab1_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor, #+
    #educ_factor +
    # ingreso_satisfact_factor,
  data = procjv,
  family = "binomial"
)

m3_jv_carab1 <- glm(
  jv_carab1_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
    #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice,
  data = procjv,
  family = "binomial"
)

m4_jv_carab1 <- glm(
  jv_carab1_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
   #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice +
    trato_carab_factor,
  data = procjv,
  family = "binomial"
)

# 3.3 Justification of police evicting occupied schools -------------------------

m1_jv_carab2 <- glm(
  jv_carab2_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec,
  data = procjv,
  family = "binomial"
)

m2_jv_carab2 <- glm(
  jv_carab2_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor, #+
    #educ_factor +
    #ingreso_satisfact_factor,
  data = procjv,
  family = "binomial"
)

m3_jv_carab2 <- glm(
  jv_carab2_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
    #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice,
  data = procjv,
  family = "binomial"
)

m4_jv_carab2 <- glm(
  jv_carab2_2019_bin ~
    sj_ceo_rec +
    sj_obrero_rec +
    sj_entrevistado_rec +
    ingreso +
    sexo_factor +
    #educ_factor +
    #ingreso_satisfact_factor +
    sdo_indice +
    rwa_indice +
    trato_carab_factor,
  data = procjv,
  family = "binomial"
)

# 4. See models --------------------------------------------------------------

sjPlot::tab_model(m1_jv_est,
                  m2_jv_est,
                  m3_jv_est,
                  m4_jv_est,
                  p.style = "stars",
                  show.ci = F)
sjPlot::tab_model(m1_jv_carab1,
                  m2_jv_carab1,
                  m3_jv_carab1,
                  m4_jv_carab1,
                  p.style = "stars",
                  show.ci = F)
sjPlot::tab_model(m1_jv_carab2,
                  m2_jv_carab2,
                  m3_jv_carab2,
                  m4_jv_carab2,
                  p.style = "stars",
                  show.ci = F)

# 5. Step models ---------------------------------------------------------------

step(m4_jv_est, direction = "backward")
step(m4_jv_carab1, direction = "backward")
step(m4_jv_carab2, direction = "backward")

# 6. Predict -------------------------------------------------------------------
test <- data.frame(
  sj_obrero_rec = 0,
  sj_ceo_rec = 0,
  sj_entrevistado_rec = 0,
  sdo_indice = 1,
  rwa_indice = 1,
  trato_carab_factor = 1
)

predict(m1_jv_est, test, type = "response") * 100
predict(m1_jv_carab1, test, type = "response") * 100
predict(m1_jv_carab2, test, type = "response") * 100

# 7. VIF -------------------------------------------------------------------

car::vif(m1_jv_est)
car::vif(m2_jv_est)
car::vif(m3_jv_est)
car::vif(m4_jv_est)

car::vif(m1_jv_carab1)
car::vif(m2_jv_carab1)
car::vif(m3_jv_carab1)
car::vif(m4_jv_carab1)

car::vif(m1_jv_carab2)
car::vif(m2_jv_carab2)
car::vif(m3_jv_carab2)
car::vif(m4_jv_carab2)
