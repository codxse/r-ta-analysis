## dc12_data_ekonomi
## R05_KEUANGAN_pendapatan_perkapita_jakarta_nasional_2006_2012.csv

# Goal: Memprediksi
#   Perkapita nasional vs % Perkapita jakarta
#   cari perkapita nasional dariperkapita jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R05_KEUANGAN_pendapatan_perkapita_jakarta_nasional_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Pendapatan Perkapitra Jakarta dan Nasional')
x <- c('Perkapita Jakarta','Tahun')
y <- c('Perkapita Nasional')
model_pred <- 'f(x) = 0.3322x - 3.1573'

# Hapus Outlier
# No Outlier

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun)

line1_ <- ggplot(df.tidy, aes(x=tahun, y=persen,col=variable)) +
  geom_line() +
  scale_color_manual('Keterangan',
                     values=c('red','blue'),
                     labels=c(x[1],y[1])) +
  labs(x='Tahun',
       y='Pendapatan Perkapita (Juta Rp.)') +
  ggtitle('Pendapatan Perkapita\nDKI Jakarta dan Nasional Tahun 2008-2012') +
  theme(plot.title=element_text(face="bold", size=15))
line1_

## Buat Model Linear ggplot2
# Perkapita Nasional vs Perkapita Jakarta
# fit <- lm(df$perkapita_nasional ~ df$perkapita_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,perkapita_nasional~perkapita_jakarta,model='lm',se=TRUE)
# cor(df$perkapita_nasional, df$perkapita_nasional)

## Scatter Plot
plot1_ <- ggplot(df,aes(x=perkapita_jakarta,
                       y=perkapita_nasional)) +
  geom_point() + 
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Pendapatan Perkapita DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15))
plot1_

## Resedual y_pred - perkapita_nasional
plotRes_ <- ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=perkapita_jakarta,
                   y=perkapita_nasional,
                   xend=perkapita_jakarta,
                   yend=fitted(lm(perkapita_nasional~perkapita_jakarta,
                                  data=df)))) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Pendapatan Perkapita DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  guides(col=FALSE)
plotRes_

## Linear Model without SE
# fit <- lm(df$perkapita_nasional ~ df$perkapita_jakarta)
# library(ggvis)
# compute_model_prediction(df,perkapita_nasional~perkapita_jakarta,model='lm',se=TRUE)
modelNoSe_ <- ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Model Prediction\nPendapatan Perkapita DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred)
modelNoSe_

## Linear Model with SE
modelSe_ <- ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Model Prediction\nPendapatan Perkapita DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  guides(col=FALSE)
modelSe_

## Confident Interval inflasi 7% (x=7)
predict(lm(perkapita_nasional~perkapita_jakarta,
           data=df),
        data.frame(perkapita_jakarta=50),
        interval='confidence')

## Data Visualization
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

# Model Prediction
modelPred_ <- ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Model Prediction\nPendapatan Perkapita Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelPred_

df.viz <- df
names(df.viz) <- c('Tahun', 'Pendapatan Perkapita Jakarta',
                   'Pendapatan Perkapita Nasional')
df.viz <- gather(df.viz, key, value, -Tahun)

line_ <- ggplot(df.viz, aes(x=Tahun, y=value)) +
  geom_line(aes(color=key),size=1) +
  geom_point(aes(color=key),
             size=3,
             shape=21,
             fill='white') +
  labs(color='Keterangan',
       x='Tahun',
       y='Pendapatan Perkapita (Juta Rp.)') +
  ggtitle('Pendapatan Perkapita\nDKI Jakarta vs. Nasional Tahun 2006-2012') +
  theme(plot.title=element_text(face="bold", size=15))
line_