getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(tidyr)
source("libraries/multiplot.R")
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/DT01_eko/K03_ekspor_impor/D07_EKO_EKSPOR_IMPOR_volume_dan_nilai_ekspor.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Clean Data
# Nilai damal Ribu USD
# Volume dalam Ton
df$volume <- as.double(df$volume)
df$nilai <- as.double(df$nilai)
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$hs <- as.character(df$hs)
df$jenis_komoditas <- as.factor(df$jenis_komoditas)

set.seed(100)
dummy <- select(df, c(4,5))

## Iterasi 4
km_4 <- kmeans(dummy, 3, 5)

df$cluster <- as.factor(km_4$cluster)
df_center <- km_4$centers
df <- df %>%
  arrange(cluster)
levels(df$cluster) <- c('cluster k1',
                        'cluster k2',
                        'cluster k3')

## Data Visualization
df.viz <- df
#df.viz$Grup <- km_4$cluster
names(df.viz) <- c('tahun','no_hs','komoditas',
                   'volume','nilai',
                   'grup')
df.viz$grup <- as.factor(df.viz$grup)

### Convert data frame to JSON
df_json <- df.viz

sink("data.json")
cat(toJSONarray(df_json))
sink()