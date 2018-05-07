# ==============================================================================
# Parse the MobyGames game page HTML
# ==============================================================================
ParseMobyGamesHTMLFile = function(filename){
  
  # function that parses divs to dataframe
  ConvertToDataFrame = function(html, selector){
    # get attributes
    html.nodes = html %>%
      html_nodes(css = selector) %>%
      sapply(html_text)
    
    # transform to dataframe if has attributes
    if(length(html.nodes) > 0){
      df = html.nodes %>%
        rollapply(width = 2, by=2, FUN=c) %>%
        t() %>%
        data.frame(stringsAsFactors = FALSE)
      
      colnames(df) = df[1,]
      df = df[-1,]
    }else{
      NULL
    }
  }
  
  # read HTML
  html = read_html(filename)
  
  # parse release and genre
  df.release = ConvertToDataFrame(html, "#coreGameRelease div")
  df.genre = ConvertToDataFrame(html, "#coreGameGenre div div")
  
  # join release and genre
  cbind(df.release, df.genre)
}
