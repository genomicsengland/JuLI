#' common_functions
#'
#' common_functions
#' @param Defaults to NULL
#' @keywords common_functions()
#' @export
#' @examples
#' common_functions()

# We need to make this function resilient to having as input
# either data.frame or data.table.

logfun=function(LogVal,bedLogform,bedform,col,txt){
  if(LogVal){
    # Notice the ..col form. See FAQ 1.1 https://cran.r-project.org/web/packages/data.table/vignettes/datatable-faq.html#j-num
    idx <- !(paste(bedLogform$chr,bedLogform$pos,bedLogform$ori) %in% paste(bedform$chr,bedform$pos,bedform$ori))
    if (class(bedLogform)[1] == "data.frame") {
        idx <- idx & as.vector(bedLogform[,col]=="Pass")
    } else if (class(bedLogform)[1] == "data.table") {
        idx <- idx & as.vector(bedLogform[,..col]=="Pass")
    } else {
        stop(paste0(c("Invalid type for bedLogform: ", class(bedLogform))))
    }
    bedLogform[idx,col] <- txt
  }
  bedLogform
}
