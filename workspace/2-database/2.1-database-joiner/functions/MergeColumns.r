MergeColumns = function(c1, c2){
  merged = apply(
    cbind(c1, c2),
    MARGIN=1,
    FUN=MergeColumns.unique
  )
}

MergeColumns.unique = compose(sort, unique, unlist)
