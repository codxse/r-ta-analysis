## dc11_data_ketenaga_kerjaan
## R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2009_2013.csv

# Buat tabel pada dc1_data_ketenaga_kerjaan menjadi lebih rapih
# Kolom yang ada menjadi:
#   tahun, pk_belum_ditempatkan_awal_tahun, pk_terdaftar, pk_ditempatkan, pk_dihapus,
#   lk_belum_dipenuhi, lk_terdaftar, lk_dipenuhi, lk_dihapus, lk_ada_untuk_i_ii
#   Goal: memberikan insight dari data yang ada (descriptive statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2009_2013.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
      arrange(tahun)
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
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

# ggplot2 plot graph
plot_ <- ggplot(df, aes(x=tahun,y=jumlah/1000)) +
  geom_point(aes(col=rincian_indikator),
             alpha=.5,
             size=5) +
  labs(x='Tahun',
       y='Ribu jiwa',
       col='Rincian Indikator') +
  ggtitle('Plot Iktisar Statistik Kerja\nDKI Jakarta Tahun 2009-2013') +
  theme(plot.title=element_text(face="bold", size=15))
plot_

## Data Visualization
line_ <- ggplot(df, aes(x=tahun, y=jumlah/1000)) +
  geom_line(aes(color=rincian_indikator), size=1) +
  geom_point(aes(color=rincian_indikator),
             shape=21,
             size=3,
             fill='white') +
  labs(color='Rincian Indikator',
       x='Tahun',
       y='Ribu jiwa') +
  ggtitle('Ikhtisar Statistik Antar Kerja\nDKI Jakarta Tahun 2009-2013') +
  theme(plot.title=element_text(face="bold", size=15)) +
  guides(size=FALSE)
line_