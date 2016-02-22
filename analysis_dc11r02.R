## dc11_data_ketenaga_kerjaan
## R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv

# Goal: Memprediksi
#   UMR dari variabel kenaikan_ump tahun sebelumnya dan
#   variabel inflasi tahun sebelumnya (inferential statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggvis)
library(plotly)

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
      arrange(tahun)

# Hapus Outlier
df_no_outlier <- df %>%
  filter(tahun != 1998) %>%
  mutate(ump1000=ump/1000)

## Buat Model Linear ggplot2
# UMP vs % Kenaikan tahun sebelumnya
# lm(df_no_outlier$ump ~ df_no_outlier$kenaikan_ump)
# compute_model_prediction(df_no_outlier, ump ~ kenaikan_ump, model='lm', se=TRUE)
# cor(df_no_outlier$ump,df_no_outlier$kenaikan_ump)
lm1 <- ggplot(df_no_outlier,aes(x=kenaikan_ump,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE)

ggplotly(lm1)

# UMP vs % inflasi tahun sebelumnya
# lm(df_no_outlier$ump ~ df_no_outlier$inflasi)
# compute_model_prediction(df_no_outlier, ump ~ inflasi, model='lm', se=TRUE)
# cor(df_no_outlier$ump,df_no_outlier$inflasi)
lm2 <- ggplot(df_no_outlier,aes(x=inflasi,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE)

ggplotly(lm2)

## BBuat Model Linear ggplot ggvis
# Prediksi UM vs % Kenaikan UMP Tahun Sebelumnya 
df_no_outlier %>%
  ggvis(~kenaikan_ump,~ump1000) %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE) %>%
  add_axis('x',title='% Kenaikan UMP Tahun Sebelumnya') %>%
  add_axis('y',title='UMP / 1000',title_offset = 50)

## Line graph ump vs % kenaikan ump vs % inflasi per tahun
ggplot(df, aes(x=tahun,y=ump/10000,col='red',alpha=0.5)) +
  geom_point() +
  geom_path() +
  geom_point(aes(x=tahun,y=kenaikan_ump,col='darkgreen',alpha=0.5)) + 
  geom_path(aes(x=tahun,y=kenaikan_ump,col='darkgreen')) +
  geom_point(aes(x=tahun,y=inflasi,col='blue',alpha=0.5)) + 
  geom_path(aes(x=tahun,y=inflasi,col='blue')) +
  xlab('Tahun') +
  ylab('UMP / 10.000') +
  scale_colour_manual('Keterangan',
                      values=c('red','darkgreen','blue'),
                      labels=c('UMP','% Naik UMP Sebelumnya','% Infasi Sebelumnya')) +
  guides(size=FALSE,alpha=FALSE)