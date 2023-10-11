frq(procjv$salario_just_ceo)
frq(procjv$salario_just_obrero)

procjv <- procjv %>% mutate(
  j_gap = salario_just_ceo/salario_just_obrero,
  j_gap_log = log(salario_just_ceo/salario_just_obrero)
) 

procjv$j_gap <- sjlabelled::set_label(procjv$j_gap, label = "Just gap") # label
procjv$j_gap_log <- sjlabelled::set_label(procjv$j_gap_log, label = "Just gap (log)") # label

frq(procjv$j_gap)
frq(procjv$j_gap_log)
