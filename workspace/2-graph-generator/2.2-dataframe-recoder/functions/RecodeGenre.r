RecodeGenre = function(v){
    v = str_title_case(str_replace(v, " game", ""))

    Recode(v,
        "Role-Playing (RPG)" = "RPG",
        "Role-Playing Video" = "RPG"
    )
}
