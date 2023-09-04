## JV Control Social: Carabineros reprimen marchas

sjmisc::frq(procjv$jv_carab1_2019) # See freqa

procjv$jv_carab1_2019 <-
  set_na(
    procjv$jv_carab1_2019,
    na = c(-888, -999),
    drop.levels = TRUE,
    as.tag = FALSE
  ) # Recode NA

procjv$jv_carab1_2019 <-
  sjlabelled::set_label(procjv$jv_carab1_2019, label = "JV: Repression") # Label numeric variable

procjv$jv_carab1_2019_factor <-
  factor(
    procjv$jv_carab1_2019,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Never justified",
      "Rarely is it justified",
      "Sometimes it is justified",
      "It is often justified",
      "It is always justified"
    )
  ) # Create ordinal factor variable

procjv$jv_carab1_2019_bin <- Recode(procjv$jv_carab1_2019, "
                                    1 = 0;
                                    2 = 1;
                                    3 = 1;
                                    4 = 1;
                                    5 = 1
                                    ", as.factor = T) %>% drop_labels(.) %>% factor(., levels = c(0,1), labels = c("Not justified", "Justified"))# Create binary variable

procjv$jv_carab1_2019_factor <-
  sjlabelled::set_label(procjv$jv_carab1_2019_factor, label = "JV: Repression") # Label factor variable

procjv$jv_carab1_2019_bin <-
  sjlabelled::set_label(procjv$jv_carab1_2019_bin, label = "JV: Repression") # Label factor variable

sjmisc::frq(procjv$jv_carab1_2019) # See freqs

sjmisc::frq(procjv$jv_carab1_2019_factor) 

sjmisc::frq(procjv$jv_carab1_2019_bin) 
