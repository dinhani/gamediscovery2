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

  # generate final dataframe
  data.frame(
    GameID = game.id,
    Description = game.description,
    stringsAsFactors = FALSE
  )
}
