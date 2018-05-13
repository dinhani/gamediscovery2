# ==============================================================================
# Parse the MobyGames game page HTML
# ==============================================================================
ParseMobyGamesHTMLFile <- function(filename) {

  # parse game id
  game.id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  html <- read_html(filename)

  # parse release and genre
  df.release <- ParseMobyGamesSection(html, "#coreGameRelease div")
  df.genre <- ParseMobyGamesSection(html, "#coreGameGenre div div")

  # check which dataframe have data
  if (is.data.frame(df.release) && is.data.frame(df.genre)) {
    df <- cbind(df.release, df.genre)
  } else if (is.data.frame(df.release)) {
    df <- df.release
  } else if (is.data.frame(df.genre)) {
    df <- df.genre
  } else {
    return(NULL)
  }

  # generate final dataframe
  data.frame(GameID = game.id, df, stringsAsFactors = FALSE)
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
