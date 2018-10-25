#' Vicell detailed report import
#'
#' @return
#' @export
#'
#' @examples
#' path = "~/rapid_dev/cell_counts/experimental_details/1008_a_10_f.csv"
#' 
vicell_import <- function(path, output = "histogram"){
  #Requierements
  require(dplyr)
  require(readr)
  require(magrittr)
  require(stringr)
  require(readxl)
  
  #Convert object
  #path_csv <- vicell_changeext(path)
  #Get file/sample name
  name <- vicell_pathclient(path)[2]
  #Load object
  switch (output,
  summary = read_excel(path, 
             skip = 8)[1:10,c(1,4)] %>% set_colnames(c("feature", "value")) %>% 
    mutate(value = as.numeric(value)) %>% 
    mutate(sample = name),
  setting = read_excel(path, 
             skip = 8)[1:12,c(6,9)] %>% set_colnames(c("setting", "value")) %>% 
    mutate(sample = name),
  histogram = read_excel(path, 
             skip = 23, col_names = TRUE)[2:141,c(1:3)] %>% 
    set_colnames(colnames(.) %>% tolower()) %>%
    mutate_all(funs(as.numeric)) %>% 
    mutate(sample = name)
  )
}
