# This is a quick and dirty script to check whether all the files in the
# average `01_averaged` folder were background subtracted (i.e. in the
# `02_mu` folder).


library(tidyverse)

# December '22 dataset
avg_files <- list.files(path = "data/bl143_dec22/01_averaged/",pattern = "\\.avg")
mu_files <- list.files(path = "data/bl143_dec22/02_mu/", pattern = "\\.mu")

avg_names <- avg_files %>% str_remove(".avg")
mu_names <- mu_files %>% str_remove(".mu")

not_processed <- setdiff(avg_names, mu_names)

not_processed

not_processed %>% as_tibble() %>% write_csv(file = "dec22_data_not_retained.csv")

# December '23 dataset
avg_files <- list.files(path = "data/bl143_dec23/01_averaged/",pattern = "\\.avg")
mu_files <- list.files(path = "data/bl143_dec23/02_mu/", pattern = "\\.mu")

avg_names <- avg_files %>% str_remove(".avg")
mu_names <- mu_files %>% str_remove(".mu")

not_processed <- setdiff(avg_names, mu_names)

not_processed

not_processed %>% as_tibble() %>% write_csv(file = "dec23_data_not_retained.csv")

# June '24 dataset
avg_files <- list.files(path = "data/bl143_jun24_reupload/01_average/",pattern = "\\.avg")
mu_files <- list.files(path = "data/bl143_jun24_reupload/02_mu/", pattern = "\\.mu")

avg_names <- avg_files %>% str_remove(".avg")
mu_names <- mu_files %>% str_remove(".mu")

not_processed <- setdiff(avg_names, mu_names)

not_processed

not_processed %>% as_tibble() %>% write_csv(file = "jun24_data_not_retained.csv")

