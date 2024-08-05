read_mu <- function(file) {
  require(readr)
  read_table(
    file, comment = "#", col_names = c("energy", "samnorm"),
    col_types = list(
      energy = col_double(),
      samnorm = col_double()
    )
    ) %>% 
    mutate(
      filename = file,
      sample_id = filename,
      sample_id = basename(sample_id),
      sample_id = str_remove(sample_id, ".mu")
    )
}