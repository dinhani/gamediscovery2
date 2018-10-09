# ==============================================================================
# LIBRARIES
# ==============================================================================
source("libraries.r", encoding = "UTF-8")

# ==============================================================================
# FUNCTIONS
# ==============================================================================
source("1-datasource/1.1-wikidata/1.1.1-downloader/functions/QueryWikidata.r", encoding = "UTF-8")
source("1-datasource/1.1-wikidata/1.1.1-downloader/functions/SaveWikidata.r", encoding = "UTF-8")
source("1-datasource/1.1-wikidata/1.1.1-downloader/functions/DownloadRelationships.r", encoding = "UTF-8")
source("1-datasource/1.1-wikidata/1.1.1-downloader/functions/DownloadRelationshipsOfGames.r", encoding = "UTF-8")

# ==============================================================================
# DOWNLOAD - GAMES
# ==============================================================================
DownloadRelationshipsOfGames(entityLink = TRUE)

DownloadRelationshipsOfGames("Platform", "wdt:P400")
DownloadRelationshipsOfGames("ReleaseDate", "wdt:P577")

DownloadRelationshipsOfGames("Developer", "wdt:P178")
DownloadRelationshipsOfGames("Distribution", "wdt:P437")
DownloadRelationshipsOfGames("Engine", "wdt:P408")
DownloadRelationshipsOfGames("Input", "wdt:P479")
DownloadRelationshipsOfGames("Publisher", "wdt:P123")

DownloadRelationshipsOfGames("Award", "wdt:P166")
DownloadRelationshipsOfGames("Review", "wdt:P444")

DownloadRelationshipsOfGames("Artist", "wdt:P3080")
DownloadRelationshipsOfGames("Composer", "wdt:P86")
DownloadRelationshipsOfGames("Designer", "wdt:P287")
DownloadRelationshipsOfGames("Director", "wdt:P57")

DownloadRelationshipsOfGames("Based", "wdt:P144")
DownloadRelationshipsOfGames("Character", "wdt:P674")
DownloadRelationshipsOfGames("GameMode", "wdt:P404")
DownloadRelationshipsOfGames("Genre", "wdt:P136")
DownloadRelationshipsOfGames("Inspiration", "wdt:P941")
DownloadRelationshipsOfGames("Location", "wdt:P840")
DownloadRelationshipsOfGames("MaxNumberPlayers", "wdt:P1873")
DownloadRelationshipsOfGames("MinNumberPlayers", "wdt:P1872")
DownloadRelationshipsOfGames("Period", "wdt:P2408")
DownloadRelationshipsOfGames("Series", "wdt:P179")
DownloadRelationshipsOfGames("Theme", "wdt:P921")

DownloadRelationshipsOfGames("ESRB", "wdt:P852")
DownloadRelationshipsOfGames("PEGI", "wdt:P908")
DownloadRelationshipsOfGames("USK", "wdt:P914")

DownloadRelationshipsOfGames("IMDB", "wdt:P345")
DownloadRelationshipsOfGames("Metacritic", "wdt:P1712")
DownloadRelationshipsOfGames("MobyGames", "wdt:P1933")
DownloadRelationshipsOfGames("Steam", "wdt:P1733")
