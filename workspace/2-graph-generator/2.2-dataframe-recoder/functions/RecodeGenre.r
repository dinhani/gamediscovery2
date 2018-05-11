RecodeGenre = function(v){
    v = str_replace(v, "( game| video game)", "") %>%
        str_title_case()

    recode(v,
        "Role-Playing (RPG)" = "RPG",
        "Role-Playing" = "RPG"
    )
}
