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

# subset data
# tahun 2009
df_2009 <- filter(df, df$tahun == '2009-01-01')
df_2009$kategori <- c(NA)
df_2009$persen <- c(NA)
df_2009$kategori[1:4] <- 'Pencari'
vec <- round((df_2009$jumlah / sum(filter(df_2009, df_2009$kategori == 'Pencari')$jumlah)) * 100, 2)
df_2009$persen[1:4] <- vec[1:4]
df_2009$kategori[5:9] <- 'Lowongan'
vec <- round((df_2009$jumlah / sum(filter(df_2009, df_2009$kategori == 'Lowongan')$jumlah)) * 100, 2)
df_2009$persen[5:9] <- vec[5:9]

# tahun 2010
df_2010 <- filter(df, df$tahun == '2010-01-01')
df_2010$kategori <- c(NA)
df_2010$persen <- c(NA)
df_2010$kategori[1:4] <- 'Pencari'
vec <- round((df_2010$jumlah / sum(filter(df_2010, df_2010$kategori == 'Pencari')$jumlah)) * 100, 2)
df_2010$persen[1:4] <- vec[1:4]
df_2010$kategori[5:9] <- 'Lowongan'
vec <- round((df_2010$jumlah / sum(filter(df_2010, df_2010$kategori == 'Lowongan')$jumlah)) * 100, 2)
df_2010$persen[5:9] <- vec[5:9]

# tahun 2011
df_2011 <- filter(df, df$tahun == '2011-01-01')
df_2011$kategori <- c(NA)
df_2011$persen <- c(NA)
df_2011$kategori[1:4] <- 'Pencari'
vec <- round((df_2011$jumlah / sum(filter(df_2011, df_2011$kategori == 'Pencari')$jumlah)) * 100, 2)
df_2011$persen[1:4] <- vec[1:4]
df_2011$kategori[5:9] <- 'Lowongan'
vec <- round((df_2011$jumlah / sum(filter(df_2011, df_2011$kategori == 'Lowongan')$jumlah)) * 100, 2)
df_2011$persen[5:9] <- vec[5:9]

# tahun 2012
df_2012 <- filter(df, df$tahun == '2012-01-01')
df_2012$kategori <- c(NA)
df_2012$persen <- c(NA)
df_2012$kategori[1:4] <- 'Pencari'
vec <- round((df_2012$jumlah / sum(filter(df_2012, df_2012$kategori == 'Pencari')$jumlah)) * 100, 2)
df_2012$persen[1:4] <- vec[1:4]
df_2012$kategori[5:9] <- 'Lowongan'
vec <- round((df_2012$jumlah / sum(filter(df_2012, df_2012$kategori == 'Lowongan')$jumlah)) * 100, 2)
df_2012$persen[5:9] <- vec[5:9]

# tahun 2013
df_2013 <- filter(df, df$tahun == '2013-01-01')
df_2013$kategori <- c(NA)
df_2013$persen <- c(NA)
df_2013$kategori[1:4] <- 'Pencari'
vec <- round((df_2013$jumlah / sum(filter(df_2013, df_2013$kategori == 'Pencari')$jumlah)) * 100, 2)
df_2013$persen[1:4] <- vec[1:4]
df_2013$kategori[5:9] <- 'Lowongan'
vec <- round((df_2013$jumlah / sum(filter(df_2013, df_2013$kategori == 'Lowongan')$jumlah)) * 100, 2)
df_2013$persen[5:9] <- vec[5:9]

## bind data
df_bind <- rbind(df_2009, df_2010, df_2011, df_2012, df_2013)

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