getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(RJSONIO)
library(dplyr)
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# load data.frame
df2 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_i_bulan_agustus_tahun_2015_30_juli_2015_sd_05_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df1 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_i_bulan_april_tahun_2015_02_april_2015_sd_08_april_2015.csv'),
                stringsAsFactors = FALSE)
df4 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_i_bulan_november_tahun_2015_29_oktober_2015_sd_04_november_2015.csv'),
                stringsAsFactors = FALSE)
df3 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_i_bulan_september_tahun_2015_27_agustus_2015_sd_02_september_2015.csv'),
                stringsAsFactors = FALSE)
df6 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_ii_bulan_agustus_tahun_2015_06_agustus_2015_sd_12_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df5 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_ii_bulan_april_tahun_2015_09_april_2015_sd_15_april_2015.csv'),
                stringsAsFactors = FALSE)
df8 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_ii_bulan_juni_tahun_2015_04_juni_2015_sd_10_juni_2015.csv'),
                stringsAsFactors = FALSE)
df7 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_ii_bulan_mei_tahun_2015_07_mei_2015_sd_13_mei_2015.csv'),
                stringsAsFactors = FALSE)
df10 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_ii_bulan_september_tahun_2015_03_september_2015_sd_09_september_2015.csv'),
                 stringsAsFactors = FALSE)
df9 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_agustus_tahun_2015_13_agustus_2015_sd_19_agustus_2015.csv'),
                stringsAsFactors = FALSE)
df12 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_april_tahun_2015_16_april_2015_sd_22_april_2015.csv'),
                 stringsAsFactors = FALSE)
df11 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_mei_tahun_2015_14_mei_2015_sd_20_mei_2015.csv'),
                 stringsAsFactors = FALSE)
df14 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_november_tahun_2015_12_november_2015_sd_18_november_2015.csv'),
                 stringsAsFactors = FALSE)
df13 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_oktober_tahun_2015_15_oktober_2015_sd_21_oktober_2015.csv'),
                 stringsAsFactors = FALSE)
df16 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iii_bulan_september_tahun_2015_10_september_2015_sd_16_september_2015.csv'),
                 stringsAsFactors = FALSE)
df15 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iv_bulan_agustus_tahun_2015_20_agustus_2015_sd_26_agustus_2015.csv'),
                 stringsAsFactors = FALSE)
df18 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iv_bulan_april_tahun_2015_23_april_2015_sd_29_april_2015.csv'),
                 stringsAsFactors = FALSE)
df17 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iv_bulan_juni_tahun_2015_18_juni_2015_sd_24_juni_2015.csv'),
                 stringsAsFactors = FALSE)
df20 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iv_bulan_mei_tahun_2015_21_mei_2015_sd_27_mei_2015.csv'),
                 stringsAsFactors = FALSE)
df19 <- read.csv(file.path('rawdata/DT01_eko/K04_komoditas/D11_EKO_KOMODITAS_perkembangan_harga_grosir/D11_minggu_ke_iv_bulan_oktober_tahun_2015_22_oktober_2015_sd_28_oktober_2015.csv'),
                 stringsAsFactors = FALSE)

## bind data
df <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14,df15,df16,df17,df18,df19,df20)

## clean data
names(df) <- c('tanggal','komoditas','harga')
df$tanggal <- as.Date(df$tanggal)
df$komoditas <- as.factor(df$komoditas)
rm_na <- !(is.na(df$harga))
df.noNA <- df[rm_na, ] 
df.noNA <- arrange(df.noNA, tanggal)

h <- round(3.5*sd(df.noNA$harga)*length(df.noNA$harga)^(-1/3))
break_point <- c(0,2825,5650,8475,11301,14126,16951,19776,22602,
                 25427,28252,31078,33903,36728,39553,42379,45204,
                 48029,50855,53680,56505,59330)

counter <- function(start, end) {
  length(which(df.noNA$harga > start & df.noNA$harga <= end))
}

kelas_interval <- c("0-2825","2826-5650","5651-8475",
                    "8476-11301","11302-14126","14127-16951",
                    "16952-19776","19777-22602","22603-25427",
                    "25428-28252","28253-31078","31079-33903",
                    "33904-35728","35729-39553","39554-42379",
                    "42380-45204","45205-48029","48030-50855",
                    "50856-53680","53681-56505","56506-59330")
frekuensi <- c(counter(0,2825),
               counter(2826,5650),
               counter(5651,8475),
               counter(8476,11301),
               counter(11302,14126),
               counter(14127,16951),
               counter(16952,19776),
               counter(19777,22602),
               counter(22603,25427),
               counter(25428,28252),
               counter(28253,31078),
               counter(31079,33903),
               counter(33904,35728),
               counter(35729,39553),
               counter(39554,42379),
               counter(42380,45204),
               counter(45205,48029),
               counter(48030,50855),
               counter(50856,53680),
               counter(53681,56505),
               counter(56506,59330))

df.hist <- data.frame("kelas_interval"=kelas_interval,
                      "frekuensi"=frekuensi)

df.hist$frekuensi_relatif <- df.hist$frekuensi/sum(df.hist$frekuensi)

sink('hist.json')
cat(toJSONarray(df.hist))
sink(NULL)

sink('data.json')
cat(toJSONarray(df.noNA))
sink(NULL)