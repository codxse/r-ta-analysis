## dc12_data_ekonomi
## R06_PEREKONOMIAN_komponen_inflasi_jakarta_2012.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R06_PEREKONOMIAN_komponen_inflasi_jakarta_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

df$persen_inflasi[is.na(df$persen_inflasi)] <- 0
df$komponen_inflasi <- as.factor(df$komponen_inflasi)
df$bulan <- 1:6
df$bulan <- as.Date(paste0('2012/',df$bulan,'/01'))

# Line chart as continue
names(df) <- c('Komponen','Tanggal','Inflasi')

ggplot(df, aes(x=Tanggal,y=Inflasi)) +
  geom_line(aes(color=Komponen),size=1) +
  geom_point(aes(color=Komponen),
             size=4,
             shape=21,
             fill='white') +
  ggtitle('Komponen Inflasi DKI Jakarta Bulan Januari-Juni 2012') +
  theme(plot.title=element_text(face='bold',size=15)) +
  ylab('Inflasi (%)') +
  xlab('Bulan')

# Pie chart as categorical