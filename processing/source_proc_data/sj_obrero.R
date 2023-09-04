## Distrivutive Justice: Perceived salary worker ---------------------------------------------------------

sjmisc::descr(procjv$salario_perc_obrero,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

table1::table1( ~ salario_perc_obrero, data = procjv) # descriptive statistics

procjv$salario_perc_obrero <-
  set_na(
    procjv$salario_perc_obrero,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$salario_perc_obrero <-
  sjlabelled::set_label(procjv$salario_perc_obrero, label = "Perceived salary worker") # Label


sjmisc::descr(procjv$salario_perc_obrero,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

table1::table1( ~ salario_perc_obrero, data = procjv) # see descriptive statistics post rec


## Distributive justice: Just salary worker --------------------------------------------------------------

sjmisc::descr(procjv$salario_just_obrero,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

table1::table1( ~ salario_just_obrero, data = procjv) # descriptive statistics

procjv$salario_just_obrero <-
  set_na(
    procjv$salario_just_obrero,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$salario_just_obrero <-
  sjlabelled::set_label(procjv$salario_just_obrero, label = "Just salary worker") # label

sjmisc::descr(procjv$salario_just_obrero,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

table1::table1( ~ salario_just_obrero, data = procjv) # see descriptive stats

## Sense of justice worker -----------------------------------------------------------------

procjv$sj_obrero <- ln(procjv$salario_perc_obrero/procjv$salario_just_obrero) # apply Jasso's equation
procjv$sj_obrero_rec <- procjv$sj_obrero*-1 # recode for better interpretation

procjv$sj_obrero <- sjlabelled::set_label(procjv$sj_obrero, label = "J Worker") # Label
procjv$sj_obrero_rec <- sjlabelled::set_label(procjv$sj_obrero_rec, label = "J' Worker") # Label

## Sense of justice worker (categorical) ---------------------------------------------------

procjv$sj_obrero_cat[procjv$sj_obrero == 0] <- 0
procjv$sj_obrero_cat[procjv$sj_obrero < 0] <- 1
procjv$sj_obrero_cat[procjv$sj_obrero > 0] <- 0

procjv$sj_obrero_cat <- sjlabelled::set_label(procjv$sj_obrero_cat, label = "J Worker")

procjv$sj_obrero_cat_factor <- factor(procjv$sj_obrero_cat, levels = c(0,1), labels = c("Just or Over-rewarded", "Under-rewarded"))

procjv$sj_obrero_cat_factor <- sjlabelled::set_label(procjv$sj_obrero_cat_factor, label = "J Worker")