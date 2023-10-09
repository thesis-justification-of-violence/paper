frq(procjv$p_gap)
frq(procjv$j_gap)

procjv <- procjv %>% mutate(
  perceived_injustice = p_gap/j_gap,
  perceived_injustice_log = log(p_gap/j_gap)
)

frq(procjv$perceived_injustice)
frq(procjv$perceived_injustice_log)
