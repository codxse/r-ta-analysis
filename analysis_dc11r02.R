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
  filter(inflasi > 0 & inflasi <= 12 & kenaikan_ump > 0 & kenaikan_ump <= 50 ) %>%
  mutate(ump1000=ump/1000)

## Buat Model Linear ggplot2
# UMP vs % Kenaikan tahun sebelumnya
# lm(df_no_outlier$ump ~ df_no_outlier$kenaikan_ump)
# summary(lm(df_no_outlier$ump ~ df_no_outlier$kenaikan_ump))
# compute_model_prediction(df_no_outlier, ump ~ kenaikan_ump, model='lm', se=TRUE)
# cor(df_no_outlier$ump,df_no_outlier$kenaikan_ump)
lm1_res <- ggplot(df_no_outlier,aes(x=kenaikan_ump,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=kenaikan_ump,
                   y=ump,
                   xend=kenaikan_ump,
                   yend=fitted(lm(ump~kenaikan_ump,data=df_no_outlier)))) +
  xlab('% Kenaikan UMP Tahun Sebelumnya') +
  ylab('UMP (Rp)') +
  guides(col=F)

# Invoke
lm1_res

# ggplot(df_no_outlier,aes(x=kenaikan_ump,y=ump)) +
#   geom_point() +
#   xlab('% Kenaikan UMP Tahun Sebelumnya') +
#   ylab('UMP (Rp)') 

lm1 <- ggplot(df_no_outlier,aes(x=kenaikan_ump,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=F,aes(col='red')) +
  xlab('% Kenaikan UMP Tahun Sebelumnya') +
  ylab('UMP (Rp)')  +
  scale_color_manual('f(x)',values='red',labels='y = 3504x + 909588')

lm1
## plot interactive
# ggplotly(lm1)

# UMP vs % inflasi tahun sebelumnya
# lm(df_no_outlier$ump ~ df_no_outlier$inflasi)
# compute_model_prediction(df_no_outlier, ump ~ inflasi, model='lm', se=TRUE)
# cor(df_no_outlier$ump,df_no_outlier$inflasi)
lm2_res <- ggplot(df_no_outlier,aes(x=inflasi,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='blue')) +
  geom_segment(aes(x=inflasi,
                   y=ump,
                   xend=inflasi,
                   yend=fitted(lm(ump~inflasi,data=df_no_outlier)))) +
  xlab('% Inflasi') +
  ylab('UMP (Rp)') +
  guides(col=F)

# Invoke
lm2_res

# ggplot(df_no_outlier,aes(x=inflasi,y=ump)) +
#   geom_point() +
#   xlab('% Inflasi') +
#   ylab('UMP (Rp)') 

lm2 <- ggplot(df_no_outlier,aes(x=inflasi,y=ump)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE, aes(col='red'))  +
  xlab('% Inflasi') +
  ylab('UMP (Rp)') +
  scale_color_manual('f(x)',values='red',labels='y = -50134x + 1331398')

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
  ylab('UMP (Rp) / 10.000') +
  scale_colour_manual('Keterangan',
                      values=c('red','darkgreen','blue'),
                      labels=c('UMP (Rp)','% Naik UMP Sebelumnya','% Infasi Sebelumnya')) +
  guides(size=FALSE,alpha=FALSE)

## Using tidyr
df.tidy <- gather(df, variable, nilai, -tahun)
ggplot(df.tidy, aes(x=tahun, y=nilai,col=variable)) +
  geom_line()