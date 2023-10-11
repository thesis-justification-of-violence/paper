frq(procjv$jv_est_2019)
frq(procjv$jv_barricada_2019)

procjv <- procjv %>% mutate(
  jv_cambio = (jv_est_2019+jv_barricada_2019)/2
)

frq(procjv$jv_cambio)

procjv$jv_cambio <-sjlabelled::set_label(procjv$jv_cambio, label = "JV: Social Change Mean") # Label factor variable
