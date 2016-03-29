## dc12_data_ekonomi
## R06_PEREKONOMIAN_komponen_inflasi_jakarta_2012.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(tidyr)
library(ggplot2)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R06_PEREKONOMIAN_komponen_inflasi_jakarta_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

df$persen_inflasi[is.na(df$persen_inflasi)] <- 0
df$komponen_inflasi <- as.factor(df$komponen_inflasi)
df$bulan <- 1:6
df$bulan <- as.Date(paste0('2012/',df$bulan,'/01'))

# Line chart as continue
names(df) <- c('Komponen','Tanggal','Inflasi')

line_ <- ggplot(df, aes(x=Tanggal,y=Inflasi)) +
  geom_line(aes(color=Komponen),size=1) +
#   geom_hline(yintercept=mean(df$Inflasi),
#              size=1,
#              linetype="dashed") +
  geom_point(aes(color=Komponen),
             size=3,
             shape=21,
             fill='white') +
  labs(x='Bulan',
       y='Inflasi (%)',
       line='Rata-rata') +
  ggtitle('Komponen Inflasi DKI Jakarta\nBulan Januari-Juni 2012') +
  theme(plot.title=element_text(face='bold',size=15))
line_

# Pie Chart As Chategorical
df.tab <- data.frame('Komponen'=c('Umum',
                                  'Bukan Makanan',
                                  'Makanan jadi, Minuman, Rokok dan tembakau',
                                  'Perumahan, Air, Listrik, Gas, dan Bahan bakar',
                                  'Sandang',
                                  'Kesehatan',
                                  'Pendidikan, Rekreasi dan Olah Raga',
                                  'Transportasi, Komunikasi dan Jasa Keuangan'),
                     'Inflasi'=c(sum(subset(df, df$Komponen == 'Umum')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Bukan Makanan')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Makanan jadi, Minuman, Rokok dan tembakau')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Perumahan, Air, Listrik, Gas, dan Bahan bakar')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Sandang')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Kesehatan')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Pendidikan, Rekreasi dan Olah Raga')$Inflasi),
                                 sum(subset(df, df$Komponen == 'Transportasi, Komunikasi dan Jasa Keuangan')$Inflasi)))

df.tab$Inflasi <- df.tab$Inflasi * 100
df.tab$Persen <- df.tab$Inflasi/(sum(df.tab$Inflasi)/100)
df.tab$Komponen <- paste0(df.tab$Komponen," (",
                          format(round(df.tab$Persen, 2), nsmall=2)," %)")
  
pie_ <- ggplot(df.tab, aes(x='',y=Persen,fill=Komponen)) +
  geom_bar(width=10,stat='identity') +
  coord_polar('y', start=0) +
  ggtitle("Persentasi Komponen Inflasi\nBulan Januari-Juni 2012 DKI Jakarta") +
  theme(plot.title=element_text(face='bold',size=13)) +
  scale_x_discrete('') +
  xlab('Komponen (%)')
pie_