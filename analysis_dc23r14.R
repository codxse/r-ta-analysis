## dc23_data_harga_komoditas
## R14_PERDAGANGAN_minggu_ke_i_bulan_agustus_tahun_2015_30_juli_2015_sd_05_agustus_2015.csv
## R14_PERDAGANGAN_minggu_ke_i_bulan_april_tahun_2015_02_april_2015_sd_08_april_2015.csv
## R14_PERDAGANGAN_minggu_ke_i_bulan_november_tahun_2015_29_oktober_2015_sd_04_november_2015.csv
## R14_PERDAGANGAN_minggu_ke_i_bulan_september_tahun_2015_27_agustus_2015_sd_02_september_2015.csv
## R14_PERDAGANGAN_minggu_ke_ii_bulan_agustus_tahun_2015_06_agustus_2015_sd_12_agustus_2015.csv
## R14_PERDAGANGAN_minggu_ke_ii_bulan_april_tahun_2015_09_april_2015_sd_15_april_2015.csv
## R14_PERDAGANGAN_minggu_ke_ii_bulan_juni_tahun_2015_04_juni_2015_sd_10_juni_2015.csv
## R14_PERDAGANGAN_minggu_ke_ii_bulan_mei_tahun_2015_07_mei_2015_sd_13_mei_2015.csv
## R14_PERDAGANGAN_minggu_ke_ii_bulan_september_tahun_2015_03_september_2015_sd_09_september_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_agustus_tahun_2015_13_agustus_2015_sd_19_agustus_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_april_tahun_2015_16_april_2015_sd_22_april_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_mei_tahun_2015_14_mei_2015_sd_20_mei_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_november_tahun_2015_12_november_2015_sd_18_november_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_oktober_tahun_2015_15_oktober_2015_sd_21_oktober_2015.csv
## R14_PERDAGANGAN_minggu_ke_iii_bulan_september_tahun_2015_10_september_2015_sd_16_september_2015.csv
## R14_PERDAGANGAN_minggu_ke_iv_bulan_agustus_tahun_2015_20_agustus_2015_sd_26_agustus_2015.csv
## R14_PERDAGANGAN_minggu_ke_iv_bulan_april_tahun_2015_23_april_2015_sd_29_april_2015.csv
## R14_PERDAGANGAN_minggu_ke_iv_bulan_juni_tahun_2015_18_juni_2015_sd_24_juni_2015.csv
## R14_PERDAGANGAN_minggu_ke_iv_bulan_mei_tahun_2015_21_mei_2015_sd_27_mei_2015.csv
## R14_PERDAGANGAN_minggu_ke_iv_bulan_oktober_tahun_2015_22_oktober_2015_sd_28_oktober_2015.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(ggplot2)
library(dplyr)

# remove scientific numeric
options(scipen=999)

# load data.frame
df1 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_i_bulan_agustus_tahun_2015_30_juli_2015_sd_05_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df2 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_i_bulan_april_tahun_2015_02_april_2015_sd_08_april_2015.csv'),
                stringsAsFactors = FALSE)
df3 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_i_bulan_november_tahun_2015_29_oktober_2015_sd_04_november_2015.csv'),
                stringsAsFactors = FALSE)
df4 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_i_bulan_september_tahun_2015_27_agustus_2015_sd_02_september_2015.csv'),
                stringsAsFactors = FALSE)
df5 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_ii_bulan_agustus_tahun_2015_06_agustus_2015_sd_12_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df6 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_ii_bulan_april_tahun_2015_09_april_2015_sd_15_april_2015.csv'),
                stringsAsFactors = FALSE)
df7 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_ii_bulan_juni_tahun_2015_04_juni_2015_sd_10_juni_2015.csv'),
                stringsAsFactors = FALSE)
df8 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_ii_bulan_mei_tahun_2015_07_mei_2015_sd_13_mei_2015.csv'),
                stringsAsFactors = FALSE)
df9 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_ii_bulan_september_tahun_2015_03_september_2015_sd_09_september_2015.csv'),
                stringsAsFactors = FALSE)
df10 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_agustus_tahun_2015_13_agustus_2015_sd_19_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df11 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_april_tahun_2015_16_april_2015_sd_22_april_2015.csv'),
                stringsAsFactors = FALSE)
df12 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_mei_tahun_2015_14_mei_2015_sd_20_mei_2015.csv'),
                stringsAsFactors = FALSE)
df13 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_november_tahun_2015_12_november_2015_sd_18_november_2015.csv'),
                stringsAsFactors = FALSE)
df14 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_oktober_tahun_2015_15_oktober_2015_sd_21_oktober_2015.csv'),
                stringsAsFactors = FALSE)
df15 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iii_bulan_september_tahun_2015_10_september_2015_sd_16_september_2015.csv'),
                stringsAsFactors = FALSE)
df16 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iv_bulan_agustus_tahun_2015_20_agustus_2015_sd_26_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df17 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iv_bulan_april_tahun_2015_23_april_2015_sd_29_april_2015.csv'),
                stringsAsFactors = FALSE)
df18 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iv_bulan_juni_tahun_2015_18_juni_2015_sd_24_juni_2015.csv'),
                stringsAsFactors = FALSE)
df19 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iv_bulan_mei_tahun_2015_21_mei_2015_sd_27_mei_2015.csv'),
                stringsAsFactors = FALSE)
df20 <- read.csv(file.path('rawdata/dc23_data_harga_komoditas/R14_PERDAGANGAN_minggu_ke_iv_bulan_oktober_tahun_2015_22_oktober_2015_sd_28_oktober_2015.csv'),
                stringsAsFactors = FALSE)

## bind data
df <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14,df15,df16,df17,df18,df19,df20)

## clean data
names(df) <- c('Tanggal','Komoditas','Harga')
df$Tanggal <- as.Date(df$Tanggal)
df$Komoditas <- as.factor(df$Komoditas)
rm_na <- !(is.na(df$Harga))
df_no_na <- df[rm_na, ] 
df_no_na <- arrange(df_no_na, Tanggal)

## Data Visualization
# Line chart
line_ <- ggplot(df_no_na, aes(x=Tanggal, y=Harga)) +
  geom_line(aes(color=Komoditas)) +
  labs(color='Keterangan',
       x='Tanggal',
       y='Harga per Kg (Rp.)') +
  ggtitle('Perkembangan Harga Grosir Di Pasar Induk Beras Cipinang\nDan Pasar Induk Kramat Jati Tahun 2015') +
  theme(plot.title=element_text(face="bold", size=15))
line_

# distribution
df_no_na$Bulan <- paste0(format(df_no_na$Tanggal, '%m'))
df_no_na$Bulan <- as.factor(df_no_na$Bulan)
data_vlines <- data.frame(Bulan=levels(df_no_na$Bulan),
                          Harga=c(mean(filter(df_no_na, df_no_na$Bulan == '04')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '05')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '06')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '07')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '08')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '09')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '10')$Harga),
                                  mean(filter(df_no_na, df_no_na$Bulan == '11')$Harga)))

distAll_ <- ggplot(df_no_na, aes(x=Harga)) +
  geom_histogram(bins=nclass.scott(df_no_na$Harga),
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Harga Grosir Di Pasar Induk Beras Cipinang\nDan Pasar Induk Kramat Jati Tahun 2015') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Harta per Kg (Rp.)',
       y='Frekuensi') +
  geom_vline(data=data_vlines,
             xintercept=mean(df_no_na$Harga),
             color='red',
             size=1,
             alpha=.5)
distAll_

dist_ <- ggplot(df_no_na, aes(x=Harga)) +
  geom_histogram(bins=nclass.scott(df_no_na$Harga),
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Harga Grosir Di Pasar Induk Beras Cipinang\nDan Pasar Induk Kramat Jati Tahun 2015 per Bulan') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Harta per Kg (Rp.)',
       y='Frekuensi') +
  geom_vline(data=data_vlines,
             aes(xintercept=Harga),
             color='red',
             size=1,
             alpha=.5) +
  facet_grid(Bulan ~ .)
dist_