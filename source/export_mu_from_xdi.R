export_mu_from_xdi <- function(df, filename) {
  df |> 
    select(energy, samnorm = muflour) |>
    write.table(file = filename,
                col.names = FALSE, 
                row.names = FALSE,
                sep = "\t")
}