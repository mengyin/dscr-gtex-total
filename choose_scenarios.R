choose_scenarios = function(type){
  typelist = c('null-top10000',
               'null-break-top10000',
               'alt-top10000',
               'alt-break-top10000',
               'mix-break-top10000',
               'poisthin-top10000')
  if (!(type %in% typelist)){
    stop("Incorrect scenarios type!")
  }
  
  scenarios = c(paste0(type,'-2vs2'),
                paste0(type,'-10vs10'),
                paste0(type,'-50vs50'))
  return(scenarios)
}