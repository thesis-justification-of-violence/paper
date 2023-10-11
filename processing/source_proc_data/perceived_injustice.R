frq(procjv$p_gap)
frq(procjv$j_gap)

procjv <- procjv %>% mutate(
  perceived_injustice = p_gap/j_gap,
  perceived_injustice_log = log(p_gap/j_gap)
)

procjv$perceived_injustice <- sjlabelled::set_label(procjv$perceived_injustice, label = "Perceived injustice (log)") # label
procjv$perceived_injustice_log <- sjlabelled::set_label(procjv$perceived_injustice_log, label = "Perceived injustice (log)") # label

frq(procjv$perceived_injustice)
frq(procjv$perceived_injustice_log)
