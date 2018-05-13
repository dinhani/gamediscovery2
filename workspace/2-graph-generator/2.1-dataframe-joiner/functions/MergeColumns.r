# ==============================================================================
# Merge two or more lists of vectors into a single list of vectors
# ==============================================================================
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
