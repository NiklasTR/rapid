vicell_changeext <- function(path){ #deprecated
  require(dplyr)
  require(readr)
  require(magrittr)
  require(stringr)
  # I isolate the file handle of the path object
  path_minus <- path %>% stringr::str_split(pattern = "\\.") %>% unlist
  stopifnot(path_minus[2] == "xls")
  # I have to rename the file to a .csv in order to process it with R
  path_csv <- paste0(path_minus[1], ".csv")
  #file.copy(path, path_csv)
  #I generate the upper directory path for another check
  cd_path <- path_minus[1] %>% stringr::str_split(pattern = "/") %>% unlist() %>% .[-length(.)] %>% str_c(collapse = "/")
  file_name <- path_minus[1] %>% stringr::str_split(pattern = "/") %>% unlist() %>% .[length(.)]
  #stopifnot(sum(list.files(cd_path) %in% paste0(file_name, ".csv")) == 1)
  return(c(path_csv, file_name, cd_path, path_minus))
}
