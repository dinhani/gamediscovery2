# ==============================================================================
# Parse the Wikipedia page html file
# ==============================================================================
ParseWikpidiaHTMLFile <- function(filename) {
  # parse file size
  if (file.info(filename)$size == 0) {
    return(NULL)
  }

  # parse game id
  game.id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  html <- read_html(filename)

  # parse game text
  game.description <- html %>% html_nodes("#mw-content-text p") %>% html_text() %>% paste(collapse = "\n")

  # parse game image
  game.image <- html %>% html_nodes(".infobox img") %>% html_attr("src") %>% head(1)
  if (length(game.image) == 0) {
    game.image <- ""
  }

  # generate final dataframe
  data.frame(
    GameID = game.id,
    Image = game.image,
    Description = game.description,
    stringsAsFactors = FALSE
  )
}
