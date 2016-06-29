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
csv1 <- getURL("http://data.jakarta.go.id/dataset/3e6df719-4863-4649-9acc-dd4558fa4c23/resource/7a4ea4bd-cdbf-4339-b84d-d4381dd0356c/download/processed-laju-pertumbuhan-ekonomi-jakarta-nasional-2006-2012.csv")
csv2 <- getURL("http://data.jakarta.go.id/dataset/9fee9666-1bab-4963-b53c-f126fd65f64a/resource/e4a8da81-230f-463c-af82-ff7574f49c05/download/processed-laju-pertumbuhan-ekonomi-jakarta-nasional-2013-2015.csv")
csv1 <- read.csv(text = csv1)
csv2 <- read.csv(text = csv2)

# make the header same for both csv1 and csv2
header <- c('tahun', 'persen_tumbuh_jakarta', 'persen_tumbuh_nasional')
names(csv1) <- header
names(csv2) <- header

# merge two files
df <- rbind(csv1, csv2) %>% arrange(tahun)

# buka csv from local
# fpath = file.path('rawdata/DT01_eko/K02_perekonomian/D03_EKO_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional.csv')
# df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
#   arrange(tahun)

df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$tahun <- as.character(df$tahun)

df <- df %>%
  mutate(keterangan=ifelse(persen_tumbuh_jakarta > 0 & persen_tumbuh_jakarta <= 12 & persen_tumbuh_nasional > 0 & persen_tumbuh_nasional <= 12,
                           'Bukan Outlier','Outlier'))

# make a linear model from given data
dfNoNA <- filter(df, df$keterangan == 'Bukan Outlier')
correlation_coefficient <- cor(dfNoNA$persen_tumbuh_nasional, dfNoNA$persen_tumbuh_jakarta) 
model <- lm(dfNoNA$persen_tumbuh_nasional ~ dfNoNA$persen_tumbuh_jakarta)
linear_vec <- c(model[1]$coefficients, correlation_coefficient)
names(linear_vec) <- c('coefficient','slope','correlation_coefficient')
data <- unname(split(df, 1:nrow(df)))
list.data <- list(linear_vec, data)
names(list.data) <- c('model', 'data')

# make json
sink('data.json')
cat(toJSON(list.data))
sink()