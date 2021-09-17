#' common_functions
#'
#' common_functions
#' @param Defaults to NULL
#' @keywords common_functions()
#' @export
#' @examples
#' common_functions()

logfun=function(LogVal,bedLogform,bedform,col,txt){
  if(LogVal){
    # Notice the ..col form. See FAQ 1.1 https://cran.r-project.org/web/packages/data.table/vignettes/datatable-faq.html#j-num
    idx <- !(paste(bedLogform$chr,bedLogform$pos,bedLogform$ori) %in% paste(bedform$chr,bedform$pos,bedform$ori))
    idx <- idx & as.vector(bedLogform[,..col]=="Pass")
    bedLogform[idx,col] <- txt
  }
  bedLogform
}
