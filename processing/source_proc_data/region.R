frq(procjv$region)

procjv <- procjv %>% mutate(
  region = if_else(
    region == 13, 1, 0
  )
)

frq(procjv$region)

procjv$region <- factor(procjv$region, levels = c(0, 1), labels = c("No Metropolitana", "Metropolitana"))

frq(procjv$region)

procjv$region <- sjlabelled::set_label(procjv$region, label = "Región")
