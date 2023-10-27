library(tidyverse)


avg_files <- list.files(path = "data/01_averaged/",pattern = "\\.avg")
mu_files <- list.files(path = "data/02_mu/", pattern = "\\.mu")

avg_names <- avg_files %>% str_remove(".avg")
mu_names <- mu_files %>% str_remove(".mu")

not_processed <- setdiff(avg_names, mu_names)

not_processed

not_processed %>% as_tibble() %>% write_csv(file = "bad_avgs.csv")
