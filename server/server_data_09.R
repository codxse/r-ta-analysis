getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(tidyr)
library(RJSONIO)
library(RCurl)
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# download files
csv1 <- getURL("http://data.jakarta.go.id/dataset/910a39b2-a3a7-4c44-a350-ea442409db3e/resource/f3fcd2bb-a337-410d-9688-a56ff55c4921/download/processed-struktur-ekonomi-jakarta-berdasarkan-sektor-2006-2012.csv")
df <- read.csv(text = csv1) %>% arrange(tahun)
header <- c('tahun', 'jenis_sektor', 'persen_kontribusi')
names(df) <- header

df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$tahun <- as.character(df$tahun)

df$keterangan <-df$jenis_sektor
df$jenis_sektor <- gsub("([A-Za-z]+).*", "\\1", df$keterangan)
df$keterangan <- gsub(".*\\((.*)\\).*", "\\1", df$keterangan)
df$keterangan <- gsub(" ","", df$keterangan)

df <- data.frame(df$tahun,df$persen_kontribusi,df$jenis_sektor,df$keterangan)
names(df) <- c('tahun','persen_kontribusi','jenis_sektor','keterangan')

# convert to json
sink('data.json')
cat(toJSONarray(df))
sink()