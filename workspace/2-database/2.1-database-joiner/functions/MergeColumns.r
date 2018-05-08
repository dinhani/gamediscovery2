MergeColumns = function(c1, c2){
  merged = apply(
    cbind(c1, c2),
    MARGIN=1,
    FUN=MergeColumns.process
  )
}

MergeColumns.process = function(v){
  v = sort(unique(unlist(v)))
  if(is.logical(v)){
    return(NULL)
  }
  return(v)
}
