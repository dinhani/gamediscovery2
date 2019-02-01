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
list.files("./functions/", full.names = TRUE) %>% walk(source, encoding = "UTF-8")

# ==============================================================================
# DATA
# ==============================================================================
# CHART
g <- readRDS("data/graph.rds")
g_v <- V(g)
g_es <- E(g)

# FILTERS
filters <- as.numeric(g_v) %>% set_names(paste0(g_v$Type, " - ", g_v$Label))

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
  updateSelectizeInput(session, "filters", choices = filters, selected = as.numeric(g_v["platform-playstation-4"]), server = TRUE)

  # ============================================================================
  # SEARCH GAMES
  # ============================================================================
  search_games <- reactive({
    # run only if have filters set
    req(input$filters)

    # get nodes from filters
    filters_vertices <- g_v[as.numeric(input$filters)]
    filters_types <- g_v[filters_vertices]$Type

    # check type of search
    has_game <- any(filters_types == "Game")
    has_features <- any(filters_types != "Game")

    # search by game
    if (has_game & !has_features) {
      games_debug <- QueryByGame(g, g_es, filters_vertices)
      games <- V(g)[games_debug$VertexID]
    }
    # search by feature
    if (!has_game & has_features) {
      games_debug <- tibble(Debug = "")
      games <- QueryByFeatures(g, g_es, filters_vertices)
    }
    # search by game and feature
    if (has_game & has_features) {
      filters.game <- filters_vertices[filters_types == "Game"][1]
      filters.features <- filters_vertices[filters_types != "Game"]

      games_debug <- tibble(Debug = "")
      games <- QueryByGameAndFeatures(g, g_es, filters.game, filters.features)
    }

    list(Games = games %>% head(50), Debug = games_debug %>% head(50))
  })

  # render result
  output$games <- renderDT({
    # search games
    results <- search_games()

    # transform games into a table
    games_df <- tibble(
      Cover = paste0("<img src=\"", results$Games$Cover, "\">"),
      Label = results$Games$Label,
      Tags = map_chr(
        results$Games,
        ~ map_chr(
          ego(g, 1, .x),
          ~ glue("
                 <div style='display:inline-block; width: 200px; margin-right: 1rem; margin-bottom: 1rem; vertical-align:top;'>{.x$Type} - {.x$Label}</div>
                ")
          %>%
            sort()
            %>%
            paste(collapse = "")
        )
      ),
      Debug = paste(
        map_chr(results$Debug$Debug, paste, collapse = "<br>"),
        paste0("Similarity = ", results$Debug$Similarity),
        sep = "<br><br>"
      )
    )

    # render game table
    datatable(
      games_df,
      escape = FALSE,
      filter = "top",
      selection = "none",
      rownames = FALSE,
      options = list(
        paging = FALSE,
        columnDefs = list(
          list(class = "dt-center", width = "15%", targets = c(0)),
          list(width = "15%", targets = c(1,3))
        )
      )
    )
  })
}

# ==============================================================================
# EXECUTE
# ==============================================================================
shinyApp(ui = ui, server = server)
