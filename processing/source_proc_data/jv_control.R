frq(procjv$jv_carab1_2019)
frq(procjv$jv_carab2_2019)

procjv <- procjv %>% mutate(
  jv_cambio = (jv_carab1_2019+jv_carab2_2019)/2
)

frq(procjv$jv_cambio)
