# ==============================================================================
# Parse the Wikipedia page html file
# ==============================================================================
ParseWikpidiaHTMLFile <- function(filename) {
  # parse file size
  if (file.size(filename) == 0) {
    return(NULL)
  }

  # parse game id
  game_id <- str_extract(filename, "(?<=data/)(.+)(?=.html)")

  # read HTML
  doc <- tryCatch({
    read_xml(file(filename))
  }, error = function(e) {
    read_html(file(filename))
  })

  # parse description
  description_nodes <- html_nodes(doc, xpath = "//p")
  description_text <- html_text(description_nodes)
  game_description <- paste(description_text, collapse = " ")

  # parse game image
  image_nodes <- html_nodes(doc, xpath = "//table[@class='infobox hproduct']//img")
  image_srcs <- html_attr(image_nodes, "src")
  game_image <- head(image_srcs, 1)
  if (length(game_image) == 0) {
    game_image <- ""
  }

  # generate final dataframe
  data.frame(
    GameID = game_id,
    Image = game_image,
    Description = game_description,
    stringsAsFactors = FALSE
  )
}
