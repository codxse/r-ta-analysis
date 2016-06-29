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
csv1 <- getURL("http://data.jakarta.go.id/dataset/288b8758-104e-4d86-88f2-32f32ca2d21f/resource/0ec23b21-10f3-48a4-8738-dbf264116d14/download/processedinflasijakartanasional20062012.csv")
df <- read.csv(text = csv1) %>% arrange(tahun)
header <- c('tahun', 'inflasi_jakarta', 'inflasi_nasional')
names(df) <- header

df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$tahun <- as.character(df$tahun)

df <- df %>%
  mutate(keterangan=ifelse(inflasi_jakarta > 0 & inflasi_jakarta <= 12 & inflasi_nasional > 0 & inflasi_nasional <= 12,
                           'Bukan Outlier','Outlier'))

# make a linear model from given data
dfNoNA <- filter(df, df$keterangan == 'Bukan Outlier')
correlation_coefficient <- cor(dfNoNA$inflasi_nasional, dfNoNA$inflasi_jakarta) 
model <- lm(dfNoNA$inflasi_nasional ~ dfNoNA$inflasi_jakarta)
linear_vec <- c(model[1]$coefficients, correlation_coefficient)
names(linear_vec) <- c('coefficient','slope','correlation_coefficient')
data <- unname(split(df, 1:nrow(df)))
list.data <- list(linear_vec, data)
names(list.data) <- c('model', 'data')

# make json
sink('data.json')
cat(toJSON(list.data))
sink()