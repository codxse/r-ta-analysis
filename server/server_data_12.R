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
csv1 <- getURL("http://data.jakarta.go.id/dataset/46976579-3f79-40e3-8fb6-f1de2dd85ef9/resource/8043ea60-9c7d-4948-8d61-2cc2622b0ee0/download/processed-pendapatan-perkapita-jakarta-nasional-2006-2012.csv")
df <- read.csv(text = csv1) %>% arrange(tahun)
header <- c('tahun', 'perkapita_jakarta', 'perkapita_nasional')
names(df) <- header

df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$tahun <- as.character(df$tahun)

df <- df %>%
  mutate(keterangan=ifelse(perkapita_jakarta > 0 & perkapita_jakarta <= 1000 & perkapita_nasional > 0 & perkapita_nasional <= 1000,
                           'Bukan Outlier','Outlier'))

# make a linear model from given data
dfNoNA <- filter(df, df$keterangan == 'Bukan Outlier')
correlation_coefficient <- cor(dfNoNA$perkapita_nasional, dfNoNA$perkapita_jakarta) 
model <- lm(dfNoNA$perkapita_nasional ~ dfNoNA$perkapita_jakarta)
linear_vec <- c(model[1]$coefficients, correlation_coefficient)
names(linear_vec) <- c('coefficient','slope','correlation_coefficient')
data <- unname(split(df, 1:nrow(df)))
list.data <- list(linear_vec, data)
names(list.data) <- c('model', 'data')

# make json
sink('data.json')
cat(toJSON(list.data))
sink()