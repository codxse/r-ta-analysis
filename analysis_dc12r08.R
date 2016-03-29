## dc12_data_ekonomi
## R08_PEREKONOMIAN_struktur_ekonomi_jakarta_berdasarkan_sektor_2006_2012.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(tidyr)
library(ggplot2)
library(dplyr)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R08_PEREKONOMIAN_struktur_ekonomi_jakarta_berdasarkan_sektor_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$jenis_sektor <- factor(df$jenis_sektor,
                          order=TRUE,
                          levels=c('Primer (Pertanian/Pertambangan)',
                                     'Sekunder (Industri/ Listrik/ Air/ Bangunan)',
                                     'Tersier (Perdagangan/Angkutan/Keuangan/Jasa)'))
df$persen_kontribusi <- as.numeric(df$persen_kontribusi)

df.viz <- df
names(df.viz) <- c('Tahun','Sektor','Kontribusi')

# Bar Percentage graph
df.viz <- df.viz %>% arrange(Sektor)

bar_ <- ggplot(df.viz, aes(x=Tahun)) +
  geom_bar(position='fill',
           stat='identity',
           aes(fill=Sektor,
               y=Kontribusi)) +
  scale_y_continuous(labels=scales::percent) +
  geom_text(aes(y=Kontribusi/100,
                label=paste(Kontribusi,'%')),
            size=2) +
  ggtitle("Struktur Ekonomi Jakarta\nBerdasarkan Sektor Tahun 2006-2012") +
  theme(plot.title=element_text(face='bold',size=15))
bar_