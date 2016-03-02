## dc21_data_keuangan_daerah
## R10_KEUANGAN_realisasi_belanja_2015.csv

# Goal: Clustering
#   Bagi tiga cluster berdasarkan realisasi pengeluaran

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggplot2)
options(digits=14)

# buka csv
fpath = file.path('rawdata/dc21_data_keuangan_daerah/R10_KEUANGAN_realisasi_belanja_2015.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Clean Data
# Convert string as numeric
df$ANGGARAN <- as.double(gsub('[,]', '.', gsub('[.]', '', df$ANGGARAN)))
df$REALISASI <- as.double(gsub('[,]', '.', gsub('[.]', '', df$REALISASI)))

## VARS
R100_ <- 100000
J_ <- 10 * R100_
J10_ <- 10 * J_
J100_ <- 10 * J10_
M_ <- 10 * J100_
M10_ <- 10 * M_
M100_ <- 10 * M10_
T_ <- 10 * M100_

## Buat Kolom SELISIH, PERSEN_ANGGARAN,
#  PERSEN_REALISASI, SELISIH_PERSEN
persen <- sum(df$ANGGARAN)/100
df <- df %>%
  mutate('SELISIH' = ANGGARAN-REALISASI) %>%
  mutate('PERSEN_ANGGARAN' = ANGGARAN/persen) %>%
  mutate('PERSEN_REALISASI' = REALISASI/persen) %>%
  mutate('PERSEN_SELISIH' = PERSEN_ANGGARAN - PERSEN_REALISASI)

## Pilih data yang ada anggarannya
df_anggaran <- df %>%
  filter(ANGGARAN > 0) %>%
  arrange(desc(ANGGARAN))

## Pilih data yang realisasinya >!= 0 
df_realisasi_neg <- df %>%
  filter(REALISASI != 0) %>%
  arrange(SELISIH)

## Pilih data yang realisasinya > 0 
df_realisasi <- df %>%
  filter(REALISASI > 0 ) %>%
  # filter(SELISIH >= 0) %>%
  arrange(desc(REALISASI))

## Pilih data berdasarkan satuan anggaran
# puluh ribuan
df_puluhribu <- df_realisasi %>%
  filter(ANGGARAN < R100_) %>%
  arrange(desc(REALISASI))

# ratus ribuan
df_ratusribu <- df_realisasi %>%
  filter(ANGGARAN >= R100_ & ANGGARAN < J_) %>%
  arrange(desc(REALISASI))

# jutaan
df_juta <-  df_realisasi %>%
  filter(ANGGARAN >= J_ & ANGGARAN < J10_) %>%
  arrange(desc(REALISASI))

ggplot(df_juta, aes(x=ANGGARAN, y=REALISASI)) +
  geom_point(alpha=.2) +
  geom_abline(intercept=0, slope=1,colour='#E41A1C') +
  geom_abline(intercept=0, slope=.5,colour='#E41A1C')

# puluhan juta
df_puluhjuta <-  df_realisasi %>%
  filter(ANGGARAN >= J10_ & ANGGARAN < J100_) %>%
  arrange(desc(REALISASI))

# ratus juta
df_ratusjuta <-  df_realisasi %>%
  filter(ANGGARAN >= J100_ & ANGGARAN < M_) %>%
  arrange(desc(REALISASI))

# miliar
df_miliar <-  df_realisasi %>%
  filter(ANGGARAN >= M_ & ANGGARAN < M10_) %>%
  arrange(desc(REALISASI))

# puluhan miliar
df_puluhmiliar <-  df_realisasi %>%
  filter(ANGGARAN >= M10_ & ANGGARAN < M100_) %>%
  arrange(desc(REALISASI))

# ratusan miliar
df_ratusmiliar <-  df_realisasi %>%
  filter(ANGGARAN >= M100_ & ANGGARAN < T_) %>%
  arrange(desc(REALISASI))

# triliun-an
df_triliun <-  df_realisasi %>%
  filter(ANGGARAN >= T_) %>%
  arrange(desc(REALISASI))

######
## ODS DATA
#####
df_ods <- df_realisasi %>%
  filter(ANGGARAN <= R100_) %>%
  arrange(desc(REALISASI))
######

## ANGGARAN vs REALISASI
ggplot(df_juta, aes(x=ANGGARAN, y=REALISASI)) +
  geom_point(position = 'jitter',
             alpha=.5)
