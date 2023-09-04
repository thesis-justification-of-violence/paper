## Distributive justice: Perceived salary CEO -------------------------------------------------------------------

sjmisc::descr(procjv$salario_perc_ceo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # descriptive stats

procjv$salario_perc_ceo <-
  set_na(
    procjv$salario_perc_ceo,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$salario_perc_ceo <-
  sjlabelled::set_label(procjv$salario_perc_ceo, label = "Perceived salary CEO") # label

sjmisc::descr(procjv$salario_perc_ceo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # see descritive stats

## Distributive justice: Just salary CEO -------------------------------------------------------------------------

sjmisc::descr(procjv$salario_just_ceo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # descriptive stats

procjv$salario_just_ceo <-
  set_na(
    procjv$salario_just_ceo,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$salario_just_ceo <-
  sjlabelled::set_label(procjv$salario_just_ceo, label = "Just salary CEO")

sjmisc::descr(procjv$salario_just_ceo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

## Sense of justice CEO ------------------------------------------------------------------------------------------

procjv$sj_ceo <- ln(procjv$salario_perc_ceo/procjv$salario_just_ceo) # apply's Jasso's equation
procjv$sj_ceo_rec <- procjv$sj_ceo # create variable with new name #NOTE: this is not strictly necessary, but I create this variable to follow the same nomenclature


procjv$sj_ceo <- sjlabelled::set_label(procjv$sj_ceo, label = "J CEO") # label
procjv$sj_ceo_rec <- sjlabelled::set_label(procjv$sj_ceo_rec, label = "J CEO") # label

