# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../libraries.r", encoding = "UTF-8")
library(igraph)
library(shiny)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/QueryByGame.r", encoding = "UTF-8")
source("functions/QueryByFeatures.r", encoding = "UTF-8")
source("functions/QueryByGameAndFeatures.r", encoding = "UTF-8")

# ==============================================================================
# DATA
# ==============================================================================
g <- readRDS("../2-graph-generator/2.6-dataframe-to-graph/data/graph.rds")
g.v <- V(g)
g.es <- E(g)

# ==============================================================================
# UI
# ==============================================================================
ui.filters <- as.numeric(g.v)
names(ui.filters) <- paste0(g.v$Type, " - ", g.v$Label)
ui.filters <- ui.filters[!str_detect(names(ui.filters), "Game - ")] # remove games
ui.filters <- ui.filters[order(names(ui.filters))] # sort filters

ui <- fluidPage(
  fluidRow(
    column(
      12,
      selectInput("filters", "Filters:", choices = ui.filters, multiple = TRUE, width = "100%")
    ),
    column(
      12,
      tableOutput("games")
    )
  )
)

# ==============================================================================
# SERVER
# ==============================================================================
server <- function(input, output) {
  searchGames <- reactive({
    # run only if have filters set
    req(input$filters)

    # get nodes from filters
    filters.vertices <- g.v[as.numeric(input$filters)]
    filters.types <- map_chr(g.v[ui.filters[1:3]], function(v) v$Type)

    # check type of search
    hasGame <- any(filters.types == "Game")
    hasFeature <- any(filters.types != "Game")

    # search by game
    if (hasGame & !hasFeature) {
      games <- QueryByGame(g, g.es, filters.vertices)
    }
    # search by feature
    if (!hasGame & hasFeature) {
      games <- QueryByFeatures(g, g.es, filters.vertices)
    }
    # search by game and feature
    if (hasGame & hasFeature) {
      games <- QueryByGameAndFeatures(g, g.es, filters.vertices)
    }

    return(games)
  })

  # render result
  output$games <- renderTable({
    games <- searchGames() %>% head(20)
    data.frame(Label = games$Label, stringsAsFactors = FALSE)
  })
}

# ==============================================================================
# EXECUTE
# ==============================================================================
shinyApp(ui = ui, server = server)
