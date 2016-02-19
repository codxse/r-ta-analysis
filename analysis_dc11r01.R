## dc11_data_ketenaga_kerjaan
## R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2010_2012.csv

# Buat tabel pada dc1_data_ketenaga_kerjaan menjadi lebih rapih
# Kolom yang ada menjadi:
#   tahun, pk_belum_ditempatkan_awal_tahun, pk_terdaftar, pk_ditempatkan, pk_dihapus,
#   lk_belum_dipenuhi, lk_terdaftar, lk_dipenuhi, lk_dihapus, lk_ada_untuk_i_ii

getwd()
setwd('~/Workspaces/r-ta-analysys')
library('dplyr')

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2010_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)
df$jumlah <- replace(df$jumlah, c(31,35), 0)
df$tahun <- as.character(df$tahun)
df$jumlah <- as.numeric(df$jumlah)

## subset row yang sama
# Pencari Kerja yang belum ditempatkan Awal Tahun
pk1 <- filter(df,rincian_indikator == 'Pencari Kerja yang belum ditempatkan Awal Tahun') %>%
       select(-c(2,3))

# Pencari Kerja yang Terdaftar
pk2 <- filter(df,rincian_indikator == 'Pencari Kerja yang Terdaftar') %>%
       select(-c(2,3))

# Pencari Kerja yang ditempatkan
pk3 <- filter(df,rincian_indikator == 'Pencari Kerja yang ditempatkan') %>%
       select(-c(2,3))

# Pencari Kerja yang dihapus
pk4 <- filter(df,rincian_indikator == 'Pencari Kerja yang dihapus') %>%
       select(-c(2,3))

# Lowongan yang belum dipenuhi
lk1 <- filter(df,rincian_indikator == 'Lowongan yang belum dipenuhi') %>%
       select(-c(2,3))

# Lowongan yang terdaftar
lk2 <- filter(df,rincian_indikator == 'Lowongan yang terdaftar') %>% 
       select(-c(2,3))

# Lowongan yang dipenuhi
lk3 <- filter(df,indikator == 'Lowongan yang dipenuhi') %>%
       select(-c(2,3))

# Lowongan Yang dihapus
lk4 <- filter(df,indikator == 'Lowongan Yang dihapus') %>%
       select(-c(2,3))

# Lowongan Yang Ada (I-II)
lk5 <- filter(df,indikator == 'Lowongan Yang Ada (I-II)') %>%
       select(-c(2,3))

## Buat vector Date (%Y)
df2_date <- c()
index_year <- 1
for (year in 2012:2009) {
  df2_date[index_year] <- paste0(year,'/01/01')
  index_year <- index_year + 1
}
df2_date <- as.Date(df2_date,format='%Y/%m/%d')
rm(index_year,year)

## Buat data.frame baru, join semua lk dan pk
df2 <- data.frame(df2_date,pk1$jumlah,pk2$jumlah,pk3$jumlah,
                  pk4$jumlah,lk1$jumlah,lk2$jumlah,lk3$jumlah,lk4$jumlah,lk5$jumlah)
df2_head <- c('tahun',
              'pencari_kerja_yang_belum_ditempatkan_awal_tahun',
              'pencari_kerja_yang_terdaftar',
              'pencari_kerja_yang_ditempatkan',
              'pencari_kerja_yang_dihapus',
              'lowongan_yang_belum_dipenuhi',
              'lowongan_yang_terdaftar',
              'lowongan_yang_dipenuhi',
              'lowongan_yang_dihapus',
              'lowongan_yang_ada_i_ii')
names(df2) <- df2_head