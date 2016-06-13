## K02_perekonomian
## D04_EKO_PEREKONOMIAN_inflasi_jakarta_nasional.csv

# Goal: Memprediksi
#   % inflasi nasional vs % inflasi jakarta
#   cari tahu % nasional dari % inflasi jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(tidyr)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/DT01_eko/K02_perekonomian/D04_EKO_PEREKONOMIAN_inflasi_jakarta_nasional.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Tingkat Inflasi Jakarta dan Nasional')
x <- c('Inflasi Jakarta (%)','Tahun')
y <- c('Inflasi Nasional (%)')
model_pred <- 'f(x) = 0.9889x + 0.3296'

# Hapus Outlier
# No Outlier

## Using tidyr
df.tidy <- gather(df, variable, persen, -tahun)

line1_ <- ggplot(df.tidy, aes(x=tahun, y=persen,col=variable)) +
  geom_line(size=1) +
  scale_color_manual('Keterangan',
                     values=c('red','blue'),
                     labels=c(x[1],y[1])) +
  labs(x='Tahun',
       y='Inflasi (%)') +
  ggtitle(title[1]) +
  theme(plot.title=element_text(face="bold", size=15))
line1_

## Buat Model Linear ggplot2
# % Nasional vs % Jakarta
# fit <- lm(df$inflasi_nasional ~ df$inflasi_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df, inflasi_nasional ~inflasi_jakarta, model='lm', se=TRUE)
# cor(df$inflasi_nasional, df$inflasi_jakarta)

## Scatter Plot
plot1_ <- ggplot(df,aes(x=inflasi_jakarta,
                       y=inflasi_nasional)) +
  geom_point() + 
  labs(x=x[1],
       y=y[1]) +
  ggtitle(title[1]) +
  theme(plot.title=element_text(face="bold", size=15))
plot1_

## Resedual y_pred - inflasi_nasional
plotRes_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=inflasi_jakarta,
                   y=inflasi_nasional,
                   xend=inflasi_jakarta,
                   yend=fitted(lm(inflasi_nasional~inflasi_jakarta,
                                  data=df)))) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Inflasi DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  guides(col=F)
plotRes_

## Linear Model without SE
# fit <- lm(df$inflasi_nasional ~ df$inflasi_jakarta)
# library(ggvis)
# compute_model_prediction(df,inflasi_nasional ~ inflasi_jakarta, model='lm', se=TRUE)
modelNoSe_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Inflasi DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred)
modelNoSe_

## Linear Model with SE
modelSe_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle(title[1]) +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelSe_

## Confident Interval inflasi 7% (x=7)
predict(lm(inflasi_nasional~inflasi_jakarta,
           data=df),
        data.frame(inflasi_jakarta=7),
        interval='confidence')

## Data Visualization
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

# Model Prediction
modelPred_ <- ggplot(df,aes(x=inflasi_jakarta,
              y=inflasi_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Model Prediction\nInflasi DKI Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelPred_

df.viz <- df
names(df.viz) <- c('Tahun', 'Inflasi Jakarta', 'Inflasi Nasional')
df.viz <- gather(df.viz, key, value, -Tahun)

line_ <- ggplot(df.viz, aes(x=Tahun, y=value)) +
  geom_line(aes(color=key),size=1) +
  geom_point(aes(color=key),
             size=3,
             shape=21,
             fill='white') +
  labs(color='Keterangan',
       x='Tahun',
       y='Inflasi (%)') +
  ggtitle('Laju Inflasi DKI Jakarta dan Nasional') +
  theme(plot.title=element_text(face="bold", size=15))
line_