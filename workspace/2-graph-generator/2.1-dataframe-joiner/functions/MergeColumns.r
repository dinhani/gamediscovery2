MergeColumns <- function(...) {
  merged <- apply(
    cbind(...),
    MARGIN = 1,
    FUN = MergeColumns.process
  )
}

MergeColumns.process <- function(v) {
  v <- sort(unique(unlist(v)))
  if (is.logical(v)) {
    return(NULL)
  }
  return(v)
}
