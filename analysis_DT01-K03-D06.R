## Topik Ekonomi
## D06_EKO_EKSPOR_IMPOR_ekspor_impor_jakarta.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(tidyr)
library(ggplot2)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/DT01_eko/K03_ekspor_impor/D06_EKO_EKSPOR_IMPOR_ekspor_impor_jakarta.csv')
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
             size=3,
             shape=21,
             fill='white') +
  labs(color='Keterangan',
       x='Tahun',
       y='Juta USD') +
  ggtitle('Laju Ekspor dan Impor DKI Jakarta') +
  theme(plot.title=element_text(face='bold',size=15))
line_