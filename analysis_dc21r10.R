## dc21_data_keuangan_daerah
## R10_KEUANGAN_realisasi_belanja_2015.csv

# Goal: Clustering
#   Bagi tiga cluster berdasarkan realisasi pengeluaran

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
options(digits=14)

# buka csv
fpath = file.path('rawdata/dc21_data_keuangan_daerah/R10_KEUANGAN_realisasi_belanja_2015.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Clean Data
# Convert string as numeric
df$ANGGARAN <- as.double(gsub('[,]', '.', gsub('[.]', '', df$ANGGARAN)))
df$REALISASI <- as.double(gsub('[,]', '.', gsub('[.]', '', df$REALISASI)))

## Buat Kolom SELISIH, PERSEN_ANGGARAN,
#  PERSEN_REALISASI, SELISIH_PERSEN
persen <- sum(df$ANGGARAN)/100
df <- df %>%
  mutate('SELISIH' = ANGGARAN-REALISASI) %>%
  mutate('PERSEN_ANGGARAN' = ANGGARAN/persen) %>%
  mutate('PERSEN_REALISASI' = REALISASI/persen) %>%
  mutate('SELISIH_PERSEN' = PERSEN_ANGGARAN - PERSEN_REALISASI)