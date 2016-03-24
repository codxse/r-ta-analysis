## dc22_data_ekspor_impor
## R07_PEREKONOMIAN_ekspor_impor_jakarta_2006_2012.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(tidyr)
library(ggplot2)

# buka csv
fpath = file.path('rawdata/dc22_data_ekspor_impor/R07_PEREKONOMIAN_ekspor_impor_jakarta_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Tidy data
names(df) <- c('Tahun',
               'Ekspor Melalui Jakarta',
               'Ekspor Produk Jakarta',
               'Impor Melalui Jakarta')
df.viz <- gather(df, key, value, -Tahun)
df.viz$Tahun <- as.Date(paste0(df.viz$Tahun,'/01/01'))
df.viz$key <- as.factor(df.viz$key)
df.viz$value <- as.numeric(df.viz$value)

## Data Viz
line_ <- ggplot(df.viz, aes(x=Tahun, y=value)) +
  geom_line(aes(color=key), size=1) +
  geom_point(aes(color=key),
             size=4,
             shape=21,
             fill='white') +
  ggtitle('Data Ekspor Impor DKI Jakarta 2006-2012') +
  theme(plot.title=element_text(face='bold',size=15)) +
  ylab('Juta USD') +
  xlab('Tahun')

line_
