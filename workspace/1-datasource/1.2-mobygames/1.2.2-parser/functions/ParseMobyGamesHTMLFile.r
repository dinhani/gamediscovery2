# ==============================================================================
# Parse the MobyGames game page HTML
# ==============================================================================
ParseMobyGamesHTMLFile <- function(filename) {

  # parse file size
  if (file.size(filename) == 0) {
    return(NULL)
  }

  # parse game id
  game.id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  doc <- read_html(file(filename))

  # parse release and genre
  game.release <- ParseMobyGamesSection(doc, "//div[@id='coreGameRelease']/div")
  game.genre <- ParseMobyGamesSection(doc, "//div[@id='coreGameGenre']/div")

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
  description_nodes <- html_node(doc, xpath = "//div[@class='col-md-8 col-lg-8']")
  description_text <- html_text(description_nodes)
  description_text <- str_replace_all(description_text, "\n", " ")
  game.description <- str_extract(description_text, "(?<=\\?Description).+(?=\\[edit description)")

  # generate final dataframe
  data.frame(
    GameID = game.id,
    game.df,
    Description = game.description,
    stringsAsFactors = FALSE
  )
}
ParseMobyGamesHTMLFile <- possibly(ParseMobyGamesHTMLFile, otherwise = NULL)

ParseMobyGamesSection <- function(doc, selector) {
  # get attributes from section
  section_nodes <- html_nodes(doc, xpath = selector)
  if (length(section_nodes) == 1) {
    section_texts <- html_text(html_children(section_nodes))
  } else {
    section_texts <- html_text(section_nodes)
  }

  # transform to dataframe
  df <- rollapply(section_texts, width = 2, by = 2, FUN = c)
  df <- t(df)
  colnames(df) <- df[1, ]
  df <- df[-1, , drop = FALSE]
  df <- data.frame(df, stringsAsFactors = FALSE)

  # split column values
  mutate_all(df, str_split, pattern = ", ")
}
ParseMobyGamesSection <- possibly(ParseMobyGamesSection, otherwise = NULL)
