getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(tidyr)
library(RJSONIO)
library(RCurl)
library(gdata)
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# download files
csv1 <- getURL("http://data.jakarta.go.id/dataset/44ea41eb-068c-4dca-976c-23b4da2383bd/resource/0f956d3f-6e56-413a-ad5e-82a615106870/download/UMP-dan-Inflasi-di-Jakarta-1997-2013.csv")
csv2 <- "http://data.jakarta.go.id/dataset/44ea41eb-068c-4dca-976c-23b4da2383bd/resource/3ddd1c6e-39a7-489b-a475-34b5ffdf9294/download/Upah-Minimum-Provinsi-dan-Inflasi-di-DKI-Jakarta-2000-2015.xls"
csv1 <- na.omit(read.csv(text = csv1))
csv2 <- na.omit(read.xls(csv2))

# make the header same for both csv1 and csv2
header <- c('tahun', 'ump', 'kenaikan_ump','inflasi')
names(csv1) <- header
names(csv2) <- header

# merge two files
df <- unique(rbind(csv1, csv2) %>% arrange(tahun))

# buka csv from local
# fpath = file.path('rawdata/DT01_eko/K02_perekonomian/D03_EKO_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional.csv')
# df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
#   arrange(tahun)

df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$tahun <- as.character(df$tahun)

df <- df %>%
  mutate(keterangan=ifelse(inflasi > 0 & inflasi <= 12 & kenaikan_ump > 0 & kenaikan_ump <= 50,
                           'Bukan Outlier','Outlier'))

# make a linear model from given data
dfNoNA <- filter(df, df$keterangan == 'Bukan Outlier')
correlation_coefficient <- cor(dfNoNA$kenaikan_ump, dfNoNA$inflasi) 
model <- lm(dfNoNA$kenaikan_ump ~ dfNoNA$inflasi)
linear_vec <- c(model[1]$coefficients, correlation_coefficient)
names(linear_vec) <- c('coefficient','slope','correlation_coefficient')
data <- unname(split(df, 1:nrow(df)))
list.data <- list(linear_vec, data)
names(list.data) <- c('model', 'data')

# make json
sink('data.json')
cat(toJSON(list.data))
sink()