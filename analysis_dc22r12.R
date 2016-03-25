## dc22_data_ekspor_impor
## R12_KEUANGAN_impor_hs_2_mei_2014.csv
## R12_KEUANGAN_impor_hs_2_juli_2014.csv
## R12_KEUANGAN_impor_hs_2_september_2014.csv
## R12_KEUANGAN_impor_hs_2_oktober_2014.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(tidyr)

## clean csv
df1 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_mei_2014.csv'),
                stringsAsFactors = FALSE)
df1$nilai_fob <- as.numeric(df1$nilai_fob)
df1$bulan <- as.factor(df1$bulan)
levels(df1$bulan) <- c(4,5)
df1$bulan <- as.Date(paste0(df1$tahun,'/',df1$bulan,'/01'))
df1 <- df1 %>% arrange(bulan)
df1$tahun <- NULL
df1$satuan <- NULL

df2 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_juli_2014.csv'),
                stringsAsFactors = FALSE)
df2$nilai_fob <- as.numeric(df2$nilai_fob)
df2$bulan <- as.factor(df2$bulan)
levels(df2$bulan) <- c(7,6)
df2$bulan <- as.Date(paste0(df2$tahun,'/',df2$bulan,'/01'))
df2 <- df2 %>% arrange(bulan)
df2$tahun <- NULL
df2$satuan <- NULL

df3 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_september_2014.csv'),
                stringsAsFactors = FALSE)
df3$nilai_fob <- as.numeric(df3$nilai_fob)
df3$bulan <- as.factor(df3$bulan)
levels(df3$bulan) <- c(8,9)
df3$bulan <- as.Date(paste0(df3$tahun,'/',df3$bulan,'/01'))
df3 <- df3 %>% arrange(bulan)
df3$tahun <- NULL
df3$satuan <- NULL

df4 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_oktober_2014.csv'),
                stringsAsFactors = FALSE)
df4$nilai_fob <- as.numeric(df4$nilai_fob)
df4$bulan <- as.factor(df4$bulan)
levels(df4$bulan) <- c(10,9)
df4$bulan <- as.Date(paste0(df4$tahun,'/',df4$bulan,'/01'))
df4 <- df4 %>% arrange(bulan)
df4$tahun <- NULL
df4$satuan <- NULL
# remove row with NA value
na <- !(is.na(df4$nilai_fob))
df4.no_na <- df4[na,]

# bind all data
df <- rbind(df1,df2,df3,df4.no_na)
df <- arrange(df, bulan)

# convert to factor data type
df$golongan_barang <- as.factor(df$golongan_barang)

## Data Visualization