MergeColumns = function(c1, c2){
  merged = apply(
    cbind(c1, c2),
    MARGIN=1,
    FUN=MergeColumns.unlistUnique
  )
}

MergeColumns.unlistUnique = compose(sort, unique, unlist, na.last=NA)
