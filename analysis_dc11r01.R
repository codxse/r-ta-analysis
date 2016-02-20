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
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2009_2013.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)
df$tahun <- as.character(df$tahun)
df$jumlah <- as.numeric(df$jumlah)

# ini null value NA
df$rincian_indikator <- c('pencari_kerja_yang_belum_ditempatkan_awal_tahun',
                          'pencari_kerja_yang_terdaftar',
                          'pencari_kerja_yang_ditempatkan',
                          'pencari_kerja_yang_dihapus',
                          'lowongan_yang_belum_dipenuhi',
                          'lowongan_yang_terdaftar',
                          'lowongan_yang_dipenuhi',
                          'lowongan_yang_dihapus',
                          'lowongan_yang_ada_i_ii')
df <- select(df,-2)

## subset row yang sama
# Pencari Kerja yang belum ditempatkan Awal Tahun
pk1 <- df %>%
       filter(rincian_indikator == 'pencari_kerja_yang_belum_ditempatkan_awal_tahun') %>%
       select(-2)

# Pencari Kerja yang Terdaftar
pk2 <- df %>%
       filter(rincian_indikator == 'pencari_kerja_yang_terdaftar') %>%
       select(-2)

# Pencari Kerja yang ditempatkan
pk3 <- df %>%
       filter(rincian_indikator == 'pencari_kerja_yang_ditempatkan') %>%
       select(-2)

# Pencari Kerja yang dihapus
pk4 <- df %>%
       filter(rincian_indikator == 'pencari_kerja_yang_dihapus') %>%
       select(-2)

# Lowongan yang belum dipenuhi
lk1 <- df %>%
       filter(rincian_indikator == 'lowongan_yang_belum_dipenuhi') %>%
       select(-2)

# Lowongan yang terdaftar
lk2 <- df %>%
       filter(rincian_indikator == 'lowongan_yang_terdaftar') %>% 
       select(-2)

# Lowongan yang dipenuhi
lk3 <- df %>%
       filter(rincian_indikator == 'lowongan_yang_dipenuhi') %>%
       select(-2)

# Lowongan Yang dihapus
lk4 <- df %>%
       filter(rincian_indikator == 'lowongan_yang_dihapus') %>%
       select(-2)

# Lowongan Yang Ada (I-II)
lk5 <- df %>%
       filter(rincian_indikator == 'lowongan_yang_ada_i_ii') %>%
       select(-2)

## Buat vector Date (%Y)
df2_date <- c()
index_year <- 1
for (year in 2013:2009) {
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

## descriptive statistic
summarise(group_by(df,rincian_indikator),
          minimum=min(jumlah),
          maksimum=max(jumlah),
          meadian=median(jumlah),
          'rata-rata'=mean(jumlah),
          'simpangan baku'=sd(jumlah))

## Draw a plot to get insight
library(ggvis)

df %>% ggvis(~tahun, ~jumlah,
             fill=~rincian_indikator,
             size=~jumlah) %>%
       layer_points() %>%
       add_axis('x', orient='top', ticks=0, title='Ikhtisar Statistik antar Kerja DKI Jakarta',
                properties = axis_props(
                  axis = list(stroke = 'white'),
                  labels = list(fontSize = 0))) %>%
       add_axis('y', title='Jumlah Slot', title_offset = 65) %>%
       add_axis('x', title='Tahun') %>%
       add_legend('fill', title='Keterangan Warna') %>%
       add_legend('size', title='Keterangan Ukuran',
                  properties = legend_props(
                    legend = list(y = 160)))