read_many_xdi_files <- function(directory) {
  directory |> 
    map(read_xdi) |> 
    bind_rows(.id = "file")
} 