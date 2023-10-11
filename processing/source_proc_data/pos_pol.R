frq(procjv$pos_pol)

procjv$pos_pol_rec <- car::recode(procjv$pos_pol,
                              "
                              c(-888, -999) = NA;
                              c(11,12) = 0;
                              0:4 = 1;
                              5 = 2;
                              6:10 = 3
                              ")
frq(procjv$pos_pol_rec)

procjv$pos_pol_rec <- factor(
  procjv$pos_pol_rec, levels = c(0, 1, 2, 3), labels = c("Ninguno o Independiente", "Izquierda", "Centro", "Derecha")
)

frq(procjv$pos_pol_rec)

procjv$pos_pol_rec <- sjlabelled::set_label(procjv$pos_pol_rec, label = "Posición Política")
