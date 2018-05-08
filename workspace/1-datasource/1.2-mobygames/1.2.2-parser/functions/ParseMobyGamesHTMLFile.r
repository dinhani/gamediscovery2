# ==============================================================================
# Parse the MobyGames game page HTML
# ==============================================================================
ParseMobyGamesHTMLFile = function(filename){

  # parse game id
  game.id = str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  html = read_html(filename)

  # parse release and genre
  df.release = ParseMobyGamesSection(html, "#coreGameRelease div")
  df.genre   = ParseMobyGamesSection(html, "#coreGameGenre div div")

  # check which dataframe have data
  if(is.data.frame(df.release) && is.data.frame(df.genre)){
    df = cbind(df.release, df.genre)
  }else if(is.data.frame(df.release)){
    df = df.release
  }else if(is.data.frame(df.genre)){
    df = df.genre
  }else{
    return(NULL)
  }

  # genrate final dataframe
  df = data.frame(GameID = game.id, df, stringsAsFactors = FALSE)
}

ParseMobyGamesSection = function(html, selector){
  # get attributes from section
  html.nodes = html %>%
    html_nodes(css = selector) %>%
    sapply(html_text)

  # check if there are attributes
  if(length(html.nodes) == 0){
    return(NULL)
  }

  # transform to dataframe
  df = html.nodes %>%
    rollapply(width = 2, by=2, FUN=c) %>%
    t() %>%
    data.frame(stringsAsFactors = FALSE)

  # set first line as column names
  colnames(df) = df[1,]
  df = df[-1,]

  # split column values
  if(is.data.frame(df)){
    df %>% mutate_all(str_split, pattern=", ")
  }else{
    NULL
  }
}
