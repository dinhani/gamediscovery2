MergeColumns <- function(...) {
  apply(
    cbind(...),
    MARGIN = 1,
    FUN = function(v) {
      v <- sort(unique(unlist(v)))
      if (is.logical(v)) {
        return(NULL)
      }
      return(v)
    }
  )
}
