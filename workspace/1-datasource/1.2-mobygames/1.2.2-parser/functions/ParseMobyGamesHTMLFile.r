# ==============================================================================
# Parse the MobyGames game page HTML
# ==============================================================================
ParseMobyGamesHTMLFile <- function(filename) {

  # parse game id
  game.id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  html <- read_html(filename)

  # parse release and genre
  game.release <- ParseMobyGamesSection(html, "#coreGameRelease div")
  game.genre <- ParseMobyGamesSection(html, "#coreGameGenre div div")

  # check which dataframe have data
  if (is.data.frame(game.release) && is.data.frame(game.genre)) {
    game.df <- cbind(game.release, game.genre)
  } else if (is.data.frame(game.release)) {
    game.df <- game.release
  } else if (is.data.frame(game.genre)) {
    game.df <- game.genre
  } else {
    return(NULL)
  }

  # parse description
  game.description <- html %>% html_node(css = ".col-md-8.col-lg-8") %>% html_text() %>% str_replace_all("\n", " ")
  game.description <- str_extract(game.description, "(?<=\\?Description).+(?=\\[edit description)")

  # generate final dataframe
  data.frame(
    GameID = game.id,
    game.df,
    Description = game.description,
    stringsAsFactors = FALSE
  )
}
ParseMobyGamesHTMLFile <- possibly(ParseMobyGamesHTMLFile, otherwise = NULL)

ParseMobyGamesSection <- function(html, selector) {
  # get attributes from section
  html.nodes <- html %>%
    html_nodes(css = selector) %>%
    sapply(html_text)

  # transform to dataframe
  df <- html.nodes %>%
    rollapply(width = 2, by = 2, FUN = c) %>%
    t() %>%
    data.frame(stringsAsFactors = FALSE)

  # set first line as column names
  colnames(df) <- df[1, ]
  df <- df[-1, ]

  # split column values
  df %>% mutate_all(str_split, pattern = ", ")
}
ParseMobyGamesSection <- possibly(ParseMobyGamesSection, otherwise = NULL)
