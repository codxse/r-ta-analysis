## dc11_data_ketenaga_kerjaan
## R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv

# Goal: Memprediksi
#   UMR dari variabel kenaikan_ump tahun sebelumnya dan
#   variabel inflasi tahun sebelumnya (inferential statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(tidyr)
if (!exists("multiplot", mode="function")) source("multiplot.R")

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
      arrange(tahun)

title <- c('Scatter Plot "Kenaikan UMP (%)" vs. "Inflasi (%)"',
           '"Kenaikan UMP (%)" dengan "Inflasi (%)"',
           'Histogram "Kenaikan UMP (%)" dengan "Inflasi (%)"')
x <- c('Inflasi (%)','Tahun')
y <- c('Kenaikan UMP (%)','UMP (Rp) / 10.000')
model_pred <- 'f(x) = 1.835x + 6.637'

# Buat kolom outlier
df <- df %>%
  mutate(keterangan=ifelse(inflasi > 0 & inflasi <= 12 & kenaikan_ump > 0 & kenaikan_ump <= 50,
                        'Bukan Outlier','Outlier'))

# Hapus Outlier
df_no_outlier <- df %>%
  filter(inflasi > 0 & inflasi <= 12 & kenaikan_ump > 0 & kenaikan_ump <= 50 ) %>%
  mutate(ump1000=ump/1000)

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun, -keterangan)
df.tidy <- df.tidy %>%
  filter(variable != 'ump')

line1 <- ggplot(df.tidy, aes(x=tahun, y=persen,col=variable)) +
  geom_line() +
  scale_color_manual('Keterangan',
                      values=c('blue','red'),
                      labels=c('% Inflasi','% Kenaikan UMP')) +
  ggtitle(title[2])

## Histogram Inflasi & Kenaikan UMP
hist_ <- ggplot(df.tidy, aes(x=persen, fill=keterangan)) +
  geom_histogram(bins=30,color='white',alpha=.75,position="identity") +
  facet_grid(variable ~ .) +
  ggtitle(title[3])
hist_
  
## Buat Model Linear ggplot2
# % Kenaikan UMP vs % Inflasi
# lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi)
# summary(lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi))
# library(ggvis)
# compute_model_prediction(df_no_outlier, kenaikan_ump ~ inflasi, model='lm', se=TRUE)
# cor(df_no_outlier$kenaikan_ump, df_no_outlier$inflasi)

## Scatter Plot
plot_ <- ggplot(df, aes(x=inflasi,y=kenaikan_ump,col=factor(keterangan))) +
  geom_text(aes(label=tahun), alpha=.5) + 
  xlab(x[1]) +
  ylab(y[1]) +
  scale_color_manual('Keterangan',
                     values=c('#000000','#FF0000'),
                     labels=c('Bukan Outlier','Outlier')) +
  guides(col=FALSE)
plot_

## Scatter Plot Outlier
plotOut_ <- ggplot(df_no_outlier, aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() + 
  xlab(x[1]) +
  ylab(y[1])
plotOut_

multiplot(plot_ + ggtitle('Semua Plot'),
          plotOut_ + ggtitle('Tanpa Outlier'),
          cols=2)

# plot2 + facet_grid(. ~ keterangan)

## Resedual y_pred - kenaikan_ump
plotRes_ <- ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=inflasi,
                   y=kenaikan_ump,
                   xend=inflasi,
                   yend=fitted(lm(kenaikan_ump~inflasi,data=df_no_outlier)))) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  guides(col=F)
plotRes_

## Linear Model without SE
# lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi)
# library(ggvis)
# compute_model_prediction(df_no_outlier, kenaikan_ump ~ inflasi, model='lm', se=TRUE)
plotNoSe_ <- ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred)
plotNoSe_

## Linear Model with SE
plotSe_ <- ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red'),size=1) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)
plotSe_

## Confident Interval inflasi 7% (x=7)
predict(lm(kenaikan_ump~inflasi,
           data=df_no_outlier),
        data.frame(inflasi=7),
        interval='confidence')

## Data Visualization
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

# Model Prediction
modelPred_ <- ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red'),size=1) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction\nKenaikan UMP vs. Inflasi DKI Jakarta') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelPred_

df.viz <- gather(df, variable, persen, -tahun, -keterangan, -ump)
df.viz <- df.viz %>%
  select(-keterangan)
df.viz$variable <- as.factor(df.viz$variable)

line_ <- ggplot(df.viz, aes(x=tahun, y=persen)) +
  geom_line(aes(color=variable),size=1) +
  geom_point(aes(color=variable),
             size=3,
             shape=21,
             fill='white') +
  geom_point(aes(x=tahun, y=ump/40000, size=ump), alpha=.1) +
  scale_size(range=c(5,10)) +
  labs(color='Keterangan',
       size='UMP (Rp.)',
       y='Kenaikan (%)',
       x='Tahun') +
  ggtitle('Kenaikan UMP vs. Inflasi DKI Jakarta\nTahun 1997-2014') +
  theme(plot.title=element_text(face="bold", size=15))
line_