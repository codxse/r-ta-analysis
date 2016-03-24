## dc12_data_ekonomi
## R03_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional_2006_2012.csv

# Goal: Memprediksi
#   % ekonomi nasional vs % ekonomi jakarta
#   cari tahu % pertumbuhan ekonomi nasional dari % ekonomi jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R03_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Laju Pertumbuhan Ekonomi Jakarta vs. Nasional')
x <- c('Pertumbuhan Ekonomi Jakarta (%)','Tahun')
y <- c('Pertumbuhan Ekonomi Nasional (%)')
model_pred <- 'y = 1.1119x - 0.9794'

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
# Pertumbuhan Ekonomi Jakarta vs. Nasional
# fit <- lm(df$persen_tumbuh_nasional ~ df$persen_tumbuh_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,persen_tumbuh_nasional~persen_tumbuh_jakarta,model='lm', se=TRUE)
# cor(df$persen_tumbuh_nasional,df$persen_tumbuh_jakarta)

## Scatter Plot
plot1 <- ggplot(df,aes(x=persen_tumbuh_jakarta,
                        y=persen_tumbuh_nasional)) +
  geom_point() + 
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1])

## Resedual y_pred - kenaikan_ump
ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=persen_tumbuh_jakarta,
                   y=persen_tumbuh_nasional,
                   xend=persen_tumbuh_jakarta,
                   yend=fitted(lm(persen_tumbuh_nasional~persen_tumbuh_jakarta,
                                  data=df)))) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  guides(col=F)

## Linear Model without SE
# fit <- lm(df$persen_tumbuh_nasional ~ df$persen_tumbuh_jakarta)
# library(ggvis)
# compute_model_prediction(df,persen_tumbuh_nasional~persen_tumbuh_jakarta,model='lm', se=TRUE)
ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred)

## Linear Model with SE
ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Confident Interval inflasi 7% (x=7)
predict(lm(persen_tumbuh_nasional~persen_tumbuh_jakarta,
           data=df),
        data.frame(persen_tumbuh_jakarta=7),
        interval='confidence')

## Interactive Plot
model_1 <- ggplot(df,aes(x=persen_tumbuh_jakarta,
                         y=persen_tumbuh_nasional),
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
ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction Pertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Linear Model',values='red',labels=model_pred) +
  guides(size=F)

df.viz <- df
names(df.viz) <- c('Tahun','Pertumbuhan Jakarta','Pertumbuhan Nasional')
df.viz <-  gather(df.viz, variable, persen, -Tahun)
df.viz$variable <- as.factor(df.viz$variable)

ggplot(df.viz, aes(x=Tahun, y=persen)) +
  geom_line(aes(color=variable),size=1) +
  geom_point(aes(color=variable),
             size=4,
             shape=21,
             fill='white') +
  scale_size(range=c(5,10)) +
  labs(color='Keterangan') +
  ggtitle('Pertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  ylab('Pertumbuhan (%)') +
  xlab('Tahun')
  

