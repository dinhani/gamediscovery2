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
    ID        = WD_GameID,
    Name      = WD_GameLabel,
    Series    = WD_SeriesLabel,
    Developer = MergeColumns(WD_DeveloperLabel, MB_Developed.by),
    Platform  = MergeColumns(WD_PlatformLabel, MB_Platform),
    
    Genre     = MergeColumns(WD_GenreLabel, MB_Genre),
    Setting   = MergeColumns(WD_ThemeLabel, WD_LocationLabel, WD_PeriodLabel, MB_Setting),
    ESRB      = MergeColumns(WD_ESRBLabel, MB_ESRB.Rating),
    PEGI      = WD_PEGILabel
  ) %>%

  # transform to long format
  gather(Type, Value,-c(ID, Name)) %>%
  filter(sapply(Value, negate(is.null))) %>%
  unnest() %>%

  # remove attributes with a single entry for all games
  group_by(Type, Value) %>%
  mutate(
    Remove = Type %in% c("Genre", "Platform") && n() < 30
  ) %>%
  filter(Remove == FALSE)

# ==============================================================================
# SAVE GAMES
# ==============================================================================
saveRDS(games, file = "data/games.rds")
