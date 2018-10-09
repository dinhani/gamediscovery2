# ==============================================================================
# COMMON LIBRARIES
# ==============================================================================

# Data Frames
library(tidyverse)
library(data.table)
library(furrr)

# Graphs
library(igraph)

# Time Series
library(xts)

# Strings
library(tm)
library(qdap)
library(lettercase)

# Dates
library(lubridate)

# Web
library(httr)
library(rvest)
library(SPARQL)

# Parallelism
library(foreach)
library(parallel)
library(doParallel)
library(future)
library(pbapply)
plan(multiprocess)
