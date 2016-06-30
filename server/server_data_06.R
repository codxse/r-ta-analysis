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
csv1 <- getURL("http://data.jakarta.go.id/dataset/d342dd91-b0db-4e09-b2f3-2a18199b94c3/resource/d66de2b1-6d01-408b-ace5-376eaa0345a8/download/processed-ekspor-impor-jakarta-2006-2012.csv")
df <- read.csv(text = csv1, stringsAsFactors = FALSE)

df.viz <- gather(df, key, value, -tahun)
df.viz$tahun <- as.Date(paste0(df.viz$tahun,'/01/01'))
df.viz$key <- as.factor(df.viz$key)
df.viz$value <- as.numeric(df.viz$value)
df.viz$tahun <- as.character(df.viz$tahun)

header <- c('tahun', 'atribut', 'juta_usd')
names(df.viz) <- header

sink('data.json')
cat(toJSONarray(df.viz))
sink()