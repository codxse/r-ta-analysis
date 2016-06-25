getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(RJSONIO)
library(dplyr)
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# download csv
fpath = file.path('rawdata/DT01_eko/K01_ketenaga_kerjaan/D01_EKO_KETENAGA_KERJAAN_ikhtisar_statistik_antar_kerja.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)
df$jumlah <- as.numeric(df$jumlah)

# ini null value NA
df$rincian_indikator <- c('Pencari kerja yang belum ditempatkan diawal tahun',
                          'Pencari kerja yang terdaftar',
                          'Pencari kerja yang ditempatkan',
                          'Pencari kerja yang dihapus',
                          'Lowongan yang belum dipenuhi',
                          'Lowongan yang terdaftar',
                          'Lowongan yang dipenuhi',
                          'Lowongan yang dihapus',
                          'Lowongan yang ada (Gol I dan Gol II)')
df <- select(df,-2)
df$rincian_indikator <- as.factor(df$rincian_indikator)
# df$tahun <- as.character(df$tahun)
df$kategori <- gsub("([A-Za-z]+).*", "\\1", df$rincian_indikator)

names(df) <- c('Tahun','Rincian','Jumlah','Kategori')

# Export to JSON
#json <- toJSONarray(df)
#json <- toJSON(df)
sink('data.json')
cat(toJSONarray(df))
sink()