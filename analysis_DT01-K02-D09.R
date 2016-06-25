## K02_perekonomian
## D09_EKO_PEREKONOMIAN_struktur_ekonomi_jakarta_berdasarkan_sektor.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(tidyr)
library(ggplot2)
library(dplyr)
source("libraries/toJSONarray.R")

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/DT01_eko/K02_perekonomian/D09_EKO_PEREKONOMIAN_struktur_ekonomi_jakarta_berdasarkan_sektor.csv')
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
  ggtitle("Struktur Ekonomi Jakarta Berdasarkan Sektor") +
  theme(plot.title=element_text(face='bold',size=15))
bar_

df$tahun <- as.numeric(format(df$tahun, '%Y'))
  
# pie chart
pie1_ <- ggplot(df, aes(x='',y=persen_kontribusi,fill=jenis_sektor)) +
  geom_bar(width=10,stat='identity') +
  coord_polar('y', start=0) +
  ggtitle("Persentasi Struktur Ekonomi Jakarta Berdasarkan Sektor") +
  theme(plot.title=element_text(face='bold',size=13)) +
  labs(x='Persen (%)',
       y='Persen (%)') +
  guides(fill=guide_legend(title='Rincian Indikator')) +
  facet_grid(. ~ tahun)
pie1_

# Export to JSON
df <- arrange(df, tahun)
sink("data.json")
cat(toJSONarray(df))
sink()