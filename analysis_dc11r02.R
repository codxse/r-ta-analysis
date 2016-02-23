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
  geom_smooth(method='lm',se=TRUE,aes(col='blue')) +
  xlab('% Kenaikan UMP Tahun Sebelumnya') +
  ylab('UMP') +
  scale_color_manual('f(x)',values='blue',labels='y = 3504x + 909588')

## plot interactive
lm1
# ggplotly(lm1)

# UMP vs % inflasi tahun sebelumnya
# lm(df_no_outlier$ump ~ df_no_outlier$inflasi)
# compute_model_prediction(df_no_outlier, ump ~ inflasi, model='lm', se=TRUE)
# cor(df_no_outlier$ump,df_no_outlier$inflasi)
lm2 <- ggplot(df_no_outlier,aes(x=inflasi,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE, aes(col='blue'))  +
  xlab('% Inflasi Tahun Sebelumnya') +
  ylab('UMP') +
  scale_color_manual('f(x)',values='blue',labels='y = -50134x + 1331398')

## plot interactive
lm2
# ggplotly(lm2)

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

## Using tidyr
df.tidy <- gather(df, variable, nilai, -tahun)
ggplot(df.tidy, aes(x=tahun, y=nilai,col=variable)) +
  geom_line()