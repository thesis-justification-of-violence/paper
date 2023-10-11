frq(procjv$jv_carab1_2019)
frq(procjv$jv_carab2_2019)

procjv <- procjv %>% mutate(
  jv_control = (jv_carab1_2019+jv_carab2_2019)/2
)

frq(procjv$jv_control)

procjv$jv_control <-sjlabelled::set_label(procjv$jv_control, label = "JV: Social Control Mean") # Label factor variable
