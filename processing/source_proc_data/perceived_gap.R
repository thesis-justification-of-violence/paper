frq(procjv$salario_perc_ceo)
frq(procjv$salario_perc_obrero)

procjv <- procjv %>% mutate(
  p_gap = salario_perc_ceo/salario_perc_obrero,
  p_gap_log = log(salario_perc_ceo/salario_perc_obrero)
) 

frq(procjv$p_gap)
frq(procjv$p_gap_log)
