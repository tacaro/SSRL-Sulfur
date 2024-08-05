read_many_mu_files <- function(directory) {
  directory |> 
    map(read_mu) |> 
    bind_rows(.id = "file")
} 