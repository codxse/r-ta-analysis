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
library(tidyr)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R09_PEREKONOMIAN_Data_Inflasi_Bulanan_Jakarta_dan-Indonesia_2010_2015.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Inflasi Bulanan Jakarta dan Indonesia')
x <- c('Inflasi Jakarta (%)','Tahun')
y <- c('Inflasi Nasional (%)')
model_pred <- 'f(x) = 0.99787x - 0.00245'

# Hapus Outlier
# No Outlier

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun, -bulan)

## Buat Model Linear ggplot2
# Perkapita Nasional vs Perkapita Jakarta
# fit <- lm(df$inflasi_indonesia~df$inflasi_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,inflasi_indonesia~inflasi_jakarta,model='lm',se=TRUE)
# cor(df$inflasi_indonesia, df$inflasi_jakarta)

## Scatter Plot
plot1_ <- ggplot(df,aes(x=inflasi_jakarta,
                       y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) + 
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Inflasi Bulanan Tahun 2010-2015\nDKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face='bold',size=15))
plot1_

## Resedual y_pred - perkapita_nasional
plotRes_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=inflasi_jakarta,
                   y=inflasi_indonesia,
                   xend=inflasi_jakarta,
                   yend=fitted(lm(inflasi_indonesia~inflasi_jakarta,
                                  data=df)))) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Inflasi Bulanan Tahun 2010-2015\nDKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face='bold',size=15)) +
  guides(col=F)
plotRes_

## Linear Model without SE
# fit <- lm(df$inflasi_indonesia~df$inflasi_jakarta)
# library(ggvis)
# compute_model_prediction(df,inflasi_indonesia~inflasi_jakarta,model='lm',se=TRUE)
modelNoSe_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Inflasi Bulanan Tahun 2010-2015\nDKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face='bold',size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred)
modelNoSe_

## Linear Model with SE
modelSe_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Inflasi Bulanan Tahun 2010-2015\nDKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face='bold',size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelSe_

## Confident Interval inflasi 0.7% (x=0.7)
predict(lm(inflasi_indonesia~inflasi_jakarta,
           data=df),
        data.frame(inflasi_jakarta=0.7),
        interval='confidence')

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
modelPred_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_indonesia)) +
  geom_jitter(position=position_jitter(width=1,height=1)) +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction Inflasi Bulanan\nJakarta vs. Nasional Tahun 2010-2015') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelPred_

# Line graph
names(df.viz) <- c('Tanggal','Inflasi Jakarta', 'Inflasi Nasional')
df.line <- gather(df.viz, key, value, -Tanggal)

line_ <- ggplot(df.line, aes(x=Tanggal, y=value)) +
  geom_line(aes(color=key),size=1) +
#   geom_point(aes(color=key),
#              size=3,
#              shape=21,
#              fill='white') +
  labs(color='Keterangan',
       x='Bulan',
       y='Inflasi (%)') +
  ggtitle('Inflasi Bulanan Jakarta vs. Nasional Tahun 2010-2015') +
  theme(plot.title=element_text(face="bold", size=15))
line_