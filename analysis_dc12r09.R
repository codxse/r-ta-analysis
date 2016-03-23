## dc12_data_ekonomi
## R09_PEREKONOMIAN_Data_Inflasi_Bulanan_Jakarta_dan-Indonesia_2010_2015.csv

# Goal: Memprediksi
#   Inflasi nasional vs Inflasi jakarta (Bulanan)
#   cari inflasi nasional dari inflasi jakarta (bulanan)

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R09_PEREKONOMIAN_Data_Inflasi_Bulanan_Jakarta_dan-Indonesia_2010_2015.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Inflasi Bulanan Jakarta dan Indonesia')
x <- c('Inflasi Jakarta (%)','Tahun')
y <- c('Inflasi Nasional (%)')
model_pred <- 'y = 0.99787x - 0.00245'

# Hapus Outlier
# No Outlier

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun, -bulan)

line1 <- ggplot(df.tidy, aes(x=tahun, y=persen,col=variable)) +
  geom_line() +
  scale_color_manual('Keterangan',
                     values=c('red','blue'),
                     labels=c(x[1],y[1])) +
  ggtitle(title[1])

## Buat Model Linear ggplot2
# Perkapita Nasional vs Perkapita Jakarta
# fit <- lm(df$inflasi_indonesia~df$inflasi_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,inflasi_indonesia~inflasi_jakarta,model='lm',se=TRUE)
# cor(df$inflasi_indonesia, df$inflasi_jakarta)

## Scatter Plot
plot1 <- ggplot(df,aes(x=inflasi_jakarta,
                       y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) + 
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1])

## Resedual y_pred - perkapita_nasional
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=inflasi_jakarta,
                   y=inflasi_indonesia,
                   xend=inflasi_jakarta,
                   yend=fitted(lm(inflasi_indonesia~inflasi_jakarta,
                                  data=df)))) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  guides(col=F)

## Linear Model without SE
# fit <- lm(df$inflasi_indonesia~df$inflasi_jakarta)
# library(ggvis)
# compute_model_prediction(df,inflasi_indonesia~inflasi_jakarta,model='lm',se=TRUE)
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred)

## Linear Model with SE
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Confident Interval inflasi 0.7% (x=0.7)
predict(lm(inflasi_indonesia~inflasi_jakarta,
           data=df),
        data.frame(inflasi_jakarta=0.7),
        interval='confidence')

## Interactive Plot
model_1 <- ggplot(df,aes(x=inflasi_jakarta,
                         y=inflasi_indonesia),
                  size=.1) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Invoke
# ggplotly(model_1)

## Data Visualization
df.viz <- rbind(df, data.frame('bulan'=c('November','Desember'),
                     'tahun'=c(2015,2015),
                     'inflasi_jakarta'=c(0,0),
                     'inflasi_indonesia'=c(0,0)))
df.viz$bulan <- 1:12
df.viz <- df.viz[1:70,]
df.viz$tahun <- as.Date(paste0(df.viz$tahun,'/',df.viz$bulan,'/01'))
df.viz$bulan <- NULL

# Linear Model
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction Inflasi Bulanan Jakarta vs. Nasional 2010-2015') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Linear Model',values='red',labels=model_pred) +
  guides(size=F)

# Line graph
names(df.viz) <- c('Tanggal','Inflasi Jakarta', 'Inflasi Nasional')
df.viz <- gather(df.viz, key, value, -Tanggal)

ggplot(df.viz, aes(x=Tanggal, y=value)) +
  geom_line(aes(color=key),size=1) +
  geom_point(aes(color=key),
             size=4,
             shape=21,
             fill='white') +
  labs(color='Keterangan') +
  ggtitle('Inflasi Bulanan Jakarta vs. Nasional 2010-2015') +
  theme(plot.title=element_text(face="bold", size=15)) +
  ylab('Inflasi (%)') +
  xlab('Tanggal')