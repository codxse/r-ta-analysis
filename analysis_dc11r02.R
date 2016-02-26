## dc11_data_ketenaga_kerjaan
## R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv

# Goal: Memprediksi
#   UMR dari variabel kenaikan_ump tahun sebelumnya dan
#   variabel inflasi tahun sebelumnya (inferential statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)
if (!exists("multiplot", mode="function")) source("multiplot.R")

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
      arrange(tahun)

title <- c('Scatter Plot "% Kenaikan UMP" dengan "Inflasi"')
x <- c('% Inflasi','Tahun')
y <- c('% Kenaikan UMP','UMP (Rp) / 10.000')

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
  geom_line()

## Histogram Inflasi & Kenaikan UMP
hist1 <- ggplot(df.tidy, aes(x=persen, fill=keterangan)) +
  geom_histogram(bins=30,color='white',alpha=.75,position="identity") +
  facet_grid(variable ~ .)
  
## Buat Model Linear ggplot2
# % Kenaikan UMP vs % Inflasi
# lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi)
# summary(lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi))
# library(ggvis)
# compute_model_prediction(df_no_outlier, kenaikan_ump ~ inflasi, model='lm', se=TRUE)
# cor(df_no_outlier$kenaikan_ump, df_no_outlier$inflasi)

## Scatter Plot
plot1 <- ggplot(df, aes(x=inflasi,y=kenaikan_ump,col=factor(keterangan))) +
  geom_text(aes(label=tahun), alpha=.5) + 
  xlab(x[1]) +
  ylab(y[1]) +
  scale_color_manual('Keterangan',
                     values=c('#000000','#FF0000'),
                     labels=c('Bukan Outlier','Outlier')) +
  guides(col=FALSE)

## Scatter Plot Outlier
plot2 <- ggplot(df_no_outlier, aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() + 
  xlab(x[1]) +
  ylab(y[1])

multiplot(plot1 + ggtitle('Semua Plot'),
          plot2 + ggtitle('Tanpa Outlier'),
          cols=2)

# plot2 + facet_grid(. ~ keterangan)

## Resedual y_pred - kenaikan_ump
ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
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

## Linear Model without SE
# lm(df_no_outlier$kenaikan_ump ~ df_no_outlier$inflasi)
# library(ggvis)
# compute_model_prediction(df_no_outlier, kenaikan_ump ~ inflasi, model='lm', se=TRUE)
ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels='y = 1,835x + 6,637')

## Linear Model with SE
ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red'),size=1) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels='y = 1,835x + 6,637') +
  guides(size=F)

## Interactive Plot
model_1 <- ggplot(df_no_outlier,aes(x=inflasi,y=kenaikan_ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red'),size=.1) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels='y = 1,835x + 6,637') +
  guides(size=F)

## Invoke
# ggplotly(model_1)

## Line graph ump vs % kenaikan ump vs % inflasi per tahun
ggplot(df, aes(x=tahun,y=ump/10000,col='red',alpha=.5)) +
  geom_point() +
  geom_path() +
  geom_point(aes(x=tahun,y=kenaikan_ump,col='darkgreen',alpha=.5)) + 
  geom_path(aes(x=tahun,y=kenaikan_ump,col='darkgreen')) +
  geom_point(aes(x=tahun,y=inflasi,col='blue',alpha=.5)) + 
  geom_path(aes(x=tahun,y=inflasi,col='blue')) +
  xlab(x[2]) +
  ylab(y[2]) +
  scale_colour_manual('Keterangan',
                      values=c('red','darkgreen','blue'),
                      labels=c('UMP (Rp)','% Naik UMP Sebelumnya','% Infasi Sebelumnya')) +
  guides(size=FALSE,alpha=FALSE)