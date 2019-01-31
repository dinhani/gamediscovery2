# ==============================================================================
# Parse the Wikipedia page html file
# ==============================================================================
ParseWikpidiaHTMLFile <- function(filename) {
  # parse file size
  if (file.size(filename) == 0) {
    return(NULL)
  }

  # parse game id
  game.id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  doc <- tryCatch({
    read_xml(file(filename))
  }, error = function(e) {
    read_html(file(filename))
  })

  # parse description
  description_nodes <- html_nodes(doc, xpath = "//p")
  description_text <- html_text(description_nodes)
  game.description <- paste(description_text, collapse = " ")

  # parse game image
  image_nodes <- html_nodes(doc, xpath = "//div/div/a/img")
  image_srcs <- html_attr(image_nodes, "src")
  game.image <- head(image_srcs, 1)
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
