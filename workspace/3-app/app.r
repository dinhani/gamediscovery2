# ==============================================================================
# LIBRARIES
# ==============================================================================
library(igraph)

library(tidyverse)
library(data.table)
library(glue)

library(shiny)
library(DT)

# ==============================================================================
# FUNCTIONS
# ==============================================================================
list.files("./functions/", full.names = TRUE) %>%
  walk(source, encoding = "UTF-8")

# ==============================================================================
# DATA
# ==============================================================================
# CHART
g <- readRDS("data/graph.rds")
g.v <- V(g)
g.es <- E(g)

# FILTERS
filters <- as.numeric(g.v) %>% set_names(paste0(g.v$Type, " - ", g.v$Label))

# ==============================================================================
# UI
# ==============================================================================
ui <- fluidPage(
  fluidRow(
    # FILTERS
    column(
      12,
      selectInput("filters", "Filters:", choices = NULL, multiple = TRUE, width = "100%")
    ),
    # RESULTS
    column(
      12,
      DTOutput("games")
    )
  )
)

# ==============================================================================
# SERVER
# ==============================================================================
server <- function(input, output, session) {

  # ============================================================================
  # INIT FILTERS
  # ============================================================================

  updateSelectizeInput(session, "filters", choices = filters, selected = as.numeric(g.v["platform-playstation-4"]), server = TRUE)

  # ============================================================================
  # SEARCH GAMES
  # ============================================================================
  searchGames <- reactive({
    # run only if have filters set
    req(input$filters)

    # get nodes from filters
    filters.vertices <- g.v[as.numeric(input$filters)]
    filters.types <- g.v[filters.vertices]$Type

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
      filters.game <- filters.vertices[filters.types == "Game"][1]
      filters.features <- filters.vertices[filters.types != "Game"]
      games <- QueryByGameAndFeatures(g, g.es, filters.game, filters.features)
    }

    return(games)
  })

  # render result
  output$games <- renderDT({
    # search games
    games <- searchGames() %>% head(50)

    # transform games into a table
    games.df <- tibble(
      Cover = paste0("<img src=\"", games$Cover, "\">"),
      Label = games$Label,
      Tags = map_chr(
        games,
        ~ map_chr(
          ego(g, 1, .x),
          ~ glue("<div style='display:inline-block; width: 200px; margin-right: 1rem; margin-bottom: 1rem;'>{.x$Type} - {.x$Label}</div>") %>% sort() %>% paste(collapse = "")
        )
      )
    )

    # render game table
    datatable(
      games.df,
      escape = FALSE,
      filter = "top",
      selection = "none",
      rownames = FALSE,
      options = list(
        paging = FALSE,
        columnDefs = list(
          list(class = "dt-center", width = "20%", targets = c(0)),
          list(width = "20%", targets = c(1))
        )
      )
    )
  })
}

# ==============================================================================
# EXECUTE
# ==============================================================================
shinyApp(ui = ui, server = server)
