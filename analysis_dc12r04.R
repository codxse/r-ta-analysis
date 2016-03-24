## dc12_data_ekonomi
## R04_PEREKONOMIAN_inflasi_jakarta_nasional_2006_2012.csv

# Goal: Memprediksi
#   % inflasi nasional vs % inflasi jakarta
#   cari tahu % nasional dari % inflasi jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R04_PEREKONOMIAN_inflasi_jakarta_nasional_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Tingkat Inflasi Jakarta dan Nasional')
x <- c('Inflasi Jakarta (%)','Tahun')
y <- c('Inflasi Nasional (%)')
model_pred <- 'y = 0.9889x - 0.3296'

# Hapus Outlier
# No Outlier

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun)

line1 <- ggplot(df.tidy, aes(x=tahun, y=persen,col=variable)) +
  geom_line() +
  scale_color_manual('Keterangan',
                     values=c('red','blue'),
                     labels=c(x[1],y[1])) +
  ggtitle(title[1])

## Buat Model Linear ggplot2
# % Nasional vs % Jakarta
# fit <- lm(df$inflasi_nasional ~ df$inflasi_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df, inflasi_nasional ~inflasi_jakarta, model='lm', se=TRUE)
# cor(df$inflasi_nasional, df$inflasi_jakarta)

## Scatter Plot
plot1 <- ggplot(df,aes(x=inflasi_jakarta,
                       y=inflasi_nasional)) +
  geom_point() + 
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1])

## Resedual y_pred - inflasi_nasional
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=inflasi_jakarta,
                   y=inflasi_nasional,
                   xend=inflasi_jakarta,
                   yend=fitted(lm(inflasi_nasional~inflasi_jakarta,
                                  data=df)))) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  guides(col=F)

## Linear Model without SE
# fit <- lm(df$inflasi_nasional ~ df$inflasi_jakarta)
# library(ggvis)
# compute_model_prediction(df,inflasi_nasional ~ inflasi_jakarta, model='lm', se=TRUE)
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred)

## Linear Model with SE
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Confident Interval inflasi 7% (x=7)
predict(lm(inflasi_nasional~inflasi_jakarta,
           data=df),
        data.frame(inflasi_jakarta=7),
        interval='confidence')

## Interactive Plot
model_1 <- ggplot(df,aes(x=inflasi_jakarta,
                         y=inflasi_nasional),
                  size=.1) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Invoke
# ggplotly(model_1)

## Data Visualization
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

# Model Prediction
ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction Inflasi DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Linear Model',values='red',labels=model_pred) +
  guides(size=F)

df.viz <- df
names(df.viz) <- c('Tahun', 'Inflasi Jakarta', 'Inflasi Nasional')
df.viz <- gather(df.viz, key, value, -Tahun)

ggplot(df.viz, aes(x=Tahun, y=value)) +
  geom_line(aes(color=key),size=1) +
  geom_point(aes(color=key),
             size=4,
             shape=21,
             fill='white') +
  labs(color='Keterangan') +
  ggtitle('Inflasi DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  ylab('Inflasi (%)') +
  xlab('Tahun')