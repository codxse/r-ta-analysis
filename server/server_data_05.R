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
csv1 <- getURL("http://data.jakarta.go.id/dataset/5714df5a-069a-459d-b41a-27db51cf3247/resource/853274ca-ee51-4ac2-96c8-7878dafda4c3/download/processed-komponen-inflasi-jakarta-2012.csv")
df <- read.csv(text = csv1)
df$persen_inflasi[is.na(df$persen_inflasi)] <- 0
df$bulan <- 1:6
df$komponen <- as.character(df$komponen)
df$bulan <- as.Date(paste0('2012/',df$bulan,'/01'))
names(df) <- c('komponen','tanggal','inflasi')
komponen <- as.character(unique(df$komponen))

df.tab <- data.frame('komponen'=komponen,
                     'persen_inflasi'=c(sum(subset(df, df$komponen == 'Umum')$inflasi),
                                 sum(subset(df, df$komponen == 'Bukan Makanan')$inflasi),
                                 sum(subset(df, df$komponen == 'Makanan jadi, Minuman, Rokok dan tembakau')$inflasi),
                                 sum(subset(df, df$komponen == 'Perumahan, Air, Listrik, Gas, dan Bahan bakar')$inflasi),
                                 sum(subset(df, df$komponen == 'Sandang')$inflasi),
                                 sum(subset(df, df$komponen == 'Kesehatan')$inflasi),
                                 sum(subset(df, df$komponen == 'Pendidikan, Rekreasi dan Olah Raga')$inflasi),
                                 sum(subset(df, df$komponen == 'Transportasi, Komunikasi dan Jasa Keuangan')$inflasi)))

# tabulasi
df.tab$persen_kontribusi <- 100*(df.tab$persen_inflasi/sum(df.tab$persen_inflasi))

df.tab$tahun <- '2012-01-01'
data <- unname(split(df.tab, 1:nrow(df.tab)))
df.tab <- data.frame("tahun"=df.tab$tahun,
                     "komponen"=df.tab$komponen,
                     "persen_inflasi"=df.tab$persen_inflasi,
                     "persen_kontribusi"=df.tab$persen_kontribusi)

# convert to json
sink('data.json')
cat(toJSONarray(df.tab))
sink()