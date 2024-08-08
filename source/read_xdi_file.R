read_xdi <- function(file) {
  require(readr)
  read_table(
    file, comment = "#", 
    col_names = c("energy", "muflour", "X1"),
    col_types = list(
      energy = col_double(),
      muflour = col_double(),
      X1 = col_logical() # readr reads an empty trash column
    )
  ) |> 
    select(-X1) |> # get rid of the trash column
    mutate(
      filename = file,
      sample_id = filename,
      sample_id = basename(sample_id),
      sample_id = str_remove(sample_id, ".xdi")
    )
}