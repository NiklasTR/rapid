vicell_tidydirectory <- function(path, output = "histogram"){
  require(dplyr)
  require(magrittr)
  require(tidyr)
  require(purrr)
  
  #path <- vicell_pathclient(path)[3]
  df <- list.files(path, full.names = TRUE, pattern = ".xls") %>% 
    map(~ vicell_import(.x, output = output)) %>% 
    bind_rows()
  
  return(df)
}