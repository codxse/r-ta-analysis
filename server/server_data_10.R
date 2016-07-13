## Topik Ekonomi
## /D10_EKO_KOMODITAS_harga_pangan_tingkat_konsumen/*

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(RJSONIO)
source("libraries/toJSONarray.R")

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

names(df) <- c('wilayah','komoditi','harga','satuan','tanggal')

h <- round(3.5*sd(df$Harga)*length(df$Harga)^(-1/3))
break_point <- c(0,17753,35506,53259,71012,88765,106518,124271,142024)
kelas_interval <- c("0-17753",
                    "17734-35506",
                    "35507-53259",
                    "53260-71012",
                    "71013-88765",
                    "88766-106518",
                    "106519-124271",
                    "124272-142024")

counter <- function(start, end) {
  length(which(df$harga > start & df$harga <= end))
}

frekuensi <- c(counter(0,17753),
               counter(17734,35506),
               counter(35507,53259),
               counter(53260,71012),
               counter(71013,88765),
               counter(88766,106518),
               counter(106519,124271),
               counter(124272,142024))

df.hist <- data.frame("kelas_interval"=kelas_interval,
                      "frekuensi"=frekuensi)

df.hist$frekuensi_relatif <- df.hist$frekuensi/sum(df.hist$frekuensi)

sink('data.json')
cat(toJSONarray(df))
sink()

sink('hist.json')
cat(toJSONarray(df.hist))
sink()
