## dc22_data_ekspor_impor
## R11_KEUANGAN_ekspor_impor_2011.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
if (!exists("multiplot", mode="function")) source("multiplot.R")
options(digits=14)

# buka csv
fpath = file.path('rawdata/dc22_data_ekspor_impor/R11_KEUANGAN_ekspor_impor_2011.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Clean Data
# Nilai damal Ribu USD
# Volume dalam Ton
df$volume <- as.double(df$volume)
df$nilai <- as.double(df$nilai)
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

## k-Means Scree Diagram
max_k <- 15
ratio_ss <- c(rep(0,max_k))
dummy <- select(df, c(4,5))

for (k in 1:max_k) {
  df_km <- kmeans(dummy, k, 100)
  ratio_ss[k] <- df_km$tot.withinss/df_km$totss
}

plot(ratio_ss, type='b',xlab='k')

df_km <- kmeans(dummy, 6, 100)

df$cluster <- as.factor(df_km$cluster)
df_center <- df_km$centers
  
set.seed(100)
ggplot(df, aes(x=volume, y=nilai)) +
  geom_point(aes(alpha=.1,
                 color=cluster),
             position=position_jitter(width=1,height=1)) +
  geom_point(data=df_center, aes(x=volume, y=nilai))