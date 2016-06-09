## Topik Ekonomi
## /D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/*

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(ggplot2)
library(dplyr)

# remove scientific numeric
options(scipen=999)

# load data.frame
df3 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_maret_2015.csv'),
                stringsAsFactors = FALSE)
df3$Bulan <- as.Date('2015/3/1')
  
df4 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_april_2015.csv'),
                stringsAsFactors = FALSE)
df4$Bulan <- as.Date('2015/4/1')

df5 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_mei_2015.csv'),
                stringsAsFactors = FALSE)
df5$Bulan <- as.Date('2015/5/1')

df6 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_juni_2015.csv'),
                stringsAsFactors = FALSE)
df6$Bulan <- as.Date('2015/6/1')

df7 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_juli_2015.csv'),
                stringsAsFactors = FALSE)
df7$Bulan <- as.Date('2015/7/1')

df8 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df8$Bulan <- as.Date('2015/8/1')

df9 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/D10_harga_pangan_tingkat_konsumen_september_2015.csv'),
                stringsAsFactors = FALSE)
df9$Bulan <- as.Date('2015/9/1')

## bind data
df <- rbind(df3,df4,df5,df6,df7,df8,df9)

## clean data
df$wilayah <- as.factor(df$wilayah)
df$komoditi <- as.factor(df$komoditi)
df$satuan <- as.factor(df$satuan)
df$harga_per_satuan <- as.numeric(df$harga_per_satuan)

names(df) <- c('Wilayah','Komoditi','Harga','Satuan','Tanggal')

## Data Visualization
df$Bulan <- as.factor(paste0(format(df$Tanggal,'%m')))

## Distribution
data_vlines <- data.frame(Wilayah=levels(df$Wilayah),
                         Harga=c(mean(filter(df, Wilayah == 'Jakarta Barat')$Harga),
                                 mean(filter(df, Wilayah == 'Jakarta Pusat')$Harga),
                                 mean(filter(df, Wilayah == 'Jakarta Selatan')$Harga),
                                 mean(filter(df, Wilayah == 'Jakarta Timur')$Harga),
                                 mean(filter(df, Wilayah == 'Jakarta Utara')$Harga)))

h <- round(3.5*sd(df$Harga)*length(df$Harga)^(-1/3))
dist_ <- ggplot(df, aes(x=Harga)) +
  geom_histogram(binwidth=h,
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Harga Pangan Tingkat Konsumen DKI Jakarta') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Harga per Satuan (Rp.)',
       y='Frekuensi') +
  geom_vline(data=data_vlines,
             aes(xintercept=Harga),
             color='red',
             size=1,
             alpha=.5) +
  facet_grid(. ~ Wilayah)
dist_

# primitive
break_point <- c(0,17753,35506,53259,71012,88765,106518,124271,142024)
distAll_ <- ggplot(df, aes(x=Harga)) +
  geom_histogram(breaks = break_point,
                 #binwidth = h,
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Harga Pangan DKI Jakarta Tingkat Konsumen') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Harga per Satuan (Rp.)',
       y='Frekuensi') +
  geom_vline(data=data_vlines,
             xintercept=mean(df$Harga),
             color='red',
             size=1,
             alpha=.5)
distAll_

# Line chart
line_ <- ggplot(df, aes(x=Tanggal, y=Harga/1000)) +
  geom_line(aes(color=Komoditi),size=1) +
  geom_point(aes(color=Komoditi),
             size=3,
             shape=21,
             fill='white') +
  labs(color='Keterangan',
       x='Bulan',
       y='Harga per Satuan (Ribu Rp.)') +
  ggtitle('Laju Harga Pangan Tingkat Konsumen DKI Jakarta') +
  theme(plot.title=element_text(face="bold", size=15)) +
  facet_grid(. ~ Wilayah)
line_

# write data
# write.csv(df, "df.csv", row.names=FALSE, na="")