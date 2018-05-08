Recode = function(v, ...){
    # only recode vector of characters
    if(!is.character(v)){
        return(v)
    }

    # execute recode
    unique(recode(v, ...))
}
