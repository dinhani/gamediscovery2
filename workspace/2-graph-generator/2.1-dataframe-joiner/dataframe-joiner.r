# ==============================================================================
# LIBRARIES
# ==============================================================================
source("../../libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("functions/MergeColumns.r", encoding="UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games.wikidata  = readRDS("../../1-datasource/1.1-wikidata/1.1.2-parser/data/games.rds")
games.mobygames = readRDS("../../1-datasource/1.2-mobygames/1.2.2-parser/data/games.rds")

# ==============================================================================
# JOIN GAMES
# ==============================================================================
games = games.wikidata %>%
  left_join(games.mobygames, by=c("WD_GameID" = "MB_GameID")) %>%
  transmute(
    # BASIC
    ID            = WD_GameID,
    Name          = WD_GameLabel,

    # INDUSTRY
    Developer     = WD_DeveloperLabel,
    Person        = MergeColumns(WD_ArtistLabel, WD_ComposerLabel, WD_DesignerLabel, WD_DirectorLabel),
    Publisher     = WD_PublisherLabel,
    Platform      = MergeColumns(WD_PlatformLabel, MB_Platform),
    RatingFeature = NULL,
    RatingESRB    = MergeColumns(WD_ESRBLabel, MB_ESRB.Rating),
    RatingPEGI    = WD_PEGILabel,
    Series        = WD_SeriesLabel,
    Year          = WD_ReleaseDateLabel,

    # GAMEPLAY
    Duration      = NULL,
    Engine        = WD_EngineLabel,
    GameMode      = WD_GameModeLabel,
    Genre         = MergeColumns(WD_GenreLabel, MB_Genre),
    Graphics      = NULL,
    Mechanics     = NULL,

    # PLOT
    Atmosphere    = NULL,
    Character     = NULL,
    Creature      = NULL,
    Location      = NULL,
    Organization  = NULL,
    Period        = NULL,
    Soundtrack    = NULL,
    Setting       = MergeColumns(WD_ThemeLabel, WD_LocationLabel, WD_PeriodLabel, MB_Setting),
    SportTeam     = NULL,
    Theme         = NULL,
    Vehicle       = NULL,
    Weapon        = NULL
  ) %>%

  # transform to long format
  gather(Type, Value,-c(ID, Name)) %>%

  # remove rows with null values
  filter(sapply(Value, negate(is.null))) %>%
  unnest() %>%

  # remove values with insignificant number of ocurrences
  group_by(Type, Value) %>%
  mutate(
    Remove = Type %in% c("GameMode", "Genre", "Platform") && n() < 30
  ) %>%
  filter(Remove == FALSE) %>%
  select(ID, Name, Type, Value)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
