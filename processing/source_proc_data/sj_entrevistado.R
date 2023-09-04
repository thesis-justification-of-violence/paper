## Distributive justice/Disadvantged groups: Income -------------------------------------------------

sjmisc::descr(procjv$ingreso,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # see descriptive stats

procjv$ingreso <-
  set_na(
    procjv$ingreso,
    na = c(-888, -999, 0),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$ingreso <-
  sjlabelled::set_label(procjv$ingreso, label = "Income") # label

sjmisc::descr(procjv$ingreso,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown")

procjv$ingreso[procjv$ingreso_tramos == 1] <- 20000
procjv$ingreso[procjv$ingreso_tramos == 2] <- 62500
procjv$ingreso[procjv$ingreso_tramos == 3] <- 105000
procjv$ingreso[procjv$ingreso_tramos == 4] <- 147500
procjv$ingreso[procjv$ingreso_tramos == 5] <- 190000
procjv$ingreso[procjv$ingreso_tramos == 6] <- 220000
procjv$ingreso[procjv$ingreso_tramos == 7] <- 255000
procjv$ingreso[procjv$ingreso_tramos == 8] <- 300000
procjv$ingreso[procjv$ingreso_tramos == 9] <- 340000
procjv$ingreso[procjv$ingreso_tramos == 10] <- 380000
procjv$ingreso[procjv$ingreso_tramos == 11] <- 432500
procjv$ingreso[procjv$ingreso_tramos == 12] <- 502500
procjv$ingreso[procjv$ingreso_tramos == 13] <- 602500
procjv$ingreso[procjv$ingreso_tramos == 14] <- 757500
procjv$ingreso[procjv$ingreso_tramos == 15] <- 1075000
procjv$ingreso[procjv$ingreso_tramos == 16] <- 2221359

## Distrivutive justice: Just income --------------------------------------------------------------

sjmisc::descr(procjv$ingreso_justo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # descriptive stats

procjv$ingreso_justo <-
  set_na(
    procjv$ingreso_justo,
    na = c(-888, -999, 0),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # recode na

procjv$ingreso_justo <-
  sjlabelled::set_label(procjv$ingreso_justo, label = "Just income") # label

sjmisc::descr(procjv$ingreso_justo,
              show = c("label", "range", "mean", "sd", "NA.prc", "n")) %>%
  kable(., "markdown") # see descriptive stats post rec

## Sense of justice interviewee -------------------------------

procjv$sj_entrevistado <- ln(procjv$ingreso / procjv$ingreso_justo) # apply Jasso's equation
procjv$sj_entrevistado_rec <- procjv$sj_entrevistado * -1 # recode for better interpretation

procjv$sj_entrevistado <-
  sjlabelled::set_label(procjv$sj_entrevistado, label = "J Interviewee") # label
procjv$sj_entrevistado_rec <-
  sjlabelled::set_label(procjv$sj_entrevistado_rec, label = "J' Interviewee") # label

## Sense of justice interviewee (categorical) -------------------------------

procjv$sj_entrevistado_cat[procjv$sj_entrevistado == 0] <- 0
procjv$sj_entrevistado_cat[procjv$sj_entrevistado < 0] <- 1
procjv$sj_entrevistado_cat[procjv$sj_entrevistado > 0] <- 0

procjv$sj_entrevistado_cat <-
  sjlabelled::set_label(procjv$sj_entrevistado_cat, label = "J Interviewee")

procjv$sj_entrevistado_cat_factor <-
  factor(
    procjv$sj_entrevistado_cat,
    levels = c(0, 1),
    labels = c("Just or Over-rewarded", "Under-rewarded")
  )

procjv$sj_entrevistado_cat_factor <-
  sjlabelled::set_label(procjv$sj_entrevistado_cat_factor, label = "J Interviewee")
