# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("2-graph-generator/2.1-dataframe-joiner/functions/MergeColumns.r", encoding = "UTF-8")

# ==============================================================================
# READ GAMES
# ==============================================================================
games.wikidata  <- readRDS("1-datasource/1.1-wikidata/1.1.2-parser/data/games.rds")
games.mobygames <- readRDS("1-datasource/1.2-mobygames/1.2.2-parser/data/games.rds")
games.wikipedia  <- readRDS("1-datasource/1.3-wikipedia/1.3.2-parser/data/games.rds")

# ==============================================================================
# JOIN GAMES
# ==============================================================================
games.attributes <- games.wikidata %>%
  left_join(games.mobygames, by = c("WD_GameID" = "MB_GameID")) %>%
  transmute(
    # BASIC
    ID            = WD_GameID,
    Name          = WD_GameLabel,
    Image         = WP_Image,

    # INDUSTRY
    Developer     = WD_DeveloperLabel,
    Person        = MergeColumns(WD_ArtistLabel, WD_ComposerLabel, WD_DesignerLabel, WD_DirectorLabel),
    Publisher     = WD_PublisherLabel,
    Platform      = MergeColumns(WD_PlatformLabel, MB_Platform),
    Rating        = MergeColumns(WD_ESRBLabel, MB_ESRB.Rating, WD_PEGILabel, WD_USKLabel),
    RatingFeature = NULL,
    Series        = WD_SeriesLabel,
    Year          = WD_ReleaseDateLabel,

    # GAMEPLAY
    Duration      = NULL,
    Engine        = WD_EngineLabel,
    GameMode      = WD_GameModeLabel,
    Genre         = MergeColumns(WD_GenreLabel, MB_Genre),
    Graphic       = MergeColumns(MB_Perspective, MB_Visual, MB_Art, MB_Interface),
    Mechanic      = MergeColumns(MB_Gameplay, MB_Pacing),

    # PLOT
    Atmosphere    = NULL,
    Character     = WD_CharacterLabel,
    Creature      = NULL,
    Organization  = NULL,
    Setting       = MergeColumns(WD_LocationLabel, WD_PeriodLabel, WD_ThemeLabel,
                                 MB_Setting, MB_Educational, MB_Misc, MB_Narrative),
    Soundtrack    = NULL,
    Sport         = MB_Sport,
    Vehicle       = MB_Vehicular,
    Weapon        = NULL
  ) %>%

  # transform to long format
  gather(Type, Value, -c(ID, Name)) %>%

  # remove rows with null values
  filter(sapply(Value, negate(is.null))) %>%
  unnest()

games.texts = games.attributes %>%
  select(ID, Name) %>%
  distinct() %>%
  left_join(games.wikipedia, by = c("ID" = "WP_GameID")) %>%
  left_join(games.mobygames, by = c("ID" = "MB_GameID")) %>%
  mutate(
    Description = paste(WP_Description, MB_Description, sep = "\n\n")
  ) %>%
  select(ID, Name, Description)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
games = list(Attributes = games.attributes, Texts = games.texts)
saveRDS(games, file = "2-graph-generator/2.1-dataframe-joiner/data/games.rds")
