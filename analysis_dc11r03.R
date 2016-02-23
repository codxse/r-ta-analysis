## dc11_data_ketenaga_kerjaan
## R03_NG_data_upah_minimum_sektoral_provinsi_umsp_dki_jakarta_2016.csv

# Goal: memberikan insight dari data yang ada (descriptive statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggplot2)

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R03_NG_data_upah_minimum_sektoral_provinsi_umsp_dki_jakarta_2016.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  select(-keterangan)

# pisahkan perhari vs perbulan
df_perhari <- df %>%
  select(-kegiatan) %>% 
  filter(jenis_sektor == 'Sektor Bangunan dan Pekerjaan Umum')

df_perbulan <- df %>%
  select(-kualifikasi_pekerja) %>%
  filter(jenis_sektor != 'Sektor Bangunan dan Pekerjaan Umum')

ggplot(df_perbulan, aes(x=jumlah)) +
  geom_histogram(aes(y=..density..),
                 position='dodge',
                 color='black',
                 fill='white',
                 bins=nclass.Sturges(df_perbulan$jumlah)) +
  geom_density(alpha=.2, fill="red")

ggplot(df_perhari, aes(x=jumlah)) +
  geom_histogram(aes(y=..density..),
                 position='dodge',
                 color='black',
                 fill='white',
                 bins=2) +
  geom_density(alpha=.2, fill="red")