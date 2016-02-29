## dc12_data_ekonomi
## R05_KEUANGAN_pendapatan_perkapita_jakarta_nasional_2006_2012.csv

# Goal: Memprediksi
#   Perkapita nasional vs % Perkapita jakarta
#   cari perkapita nasional dariperkapita jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)

# buka csv
fpath = file.path('rawdata/dc12_data_ekonomi/R05_KEUANGAN_pendapatan_perkapita_jakarta_nasional_2006_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Pendapatan Perkapitra Jakarta dan Nasional')
x <- c('Perkapita Jakarta (Juta Rp.)','Tahun')
y <- c('Perkapita Nasional (Juta Rp.)')
model_pred <- 'y = 0.3322x - 3.1573'

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
# Perkapita Nasional vs Perkapita Jakarta
# fit <- lm(df$perkapita_nasional ~ df$perkapita_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,perkapita_nasional~perkapita_jakarta,model='lm',se=TRUE)
# cor(df$perkapita_nasional, df$perkapita_nasional)

## Scatter Plot
plot1 <- ggplot(df,aes(x=perkapita_jakarta,
                       y=perkapita_nasional)) +
  geom_point() + 
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1])

## Resedual y_pred - perkapita_nasional
ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=perkapita_jakarta,
                   y=perkapita_nasional,
                   xend=perkapita_jakarta,
                   yend=fitted(lm(perkapita_nasional~perkapita_jakarta,
                                  data=df)))) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  guides(col=F)

## Linear Model without SE
# fit <- lm(df$perkapita_nasional ~ df$perkapita_jakarta)
# library(ggvis)
# compute_model_prediction(df,perkapita_nasional~perkapita_jakarta,model='lm',se=TRUE)
ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred)

## Linear Model with SE
ggplot(df,aes(x=perkapita_jakarta,
              y=perkapita_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle(title[1]) +
  scale_color_manual('f(x)',values='red',labels=model_pred) +
  guides(size=F)

## Confident Interval inflasi 7% (x=7)
predict(lm(perkapita_nasional~perkapita_jakarta,
           data=df),
        data.frame(perkapita_jakarta=50),
        interval='confidence')

## Interactive Plot
model_1 <- ggplot(df,aes(x=perkapita_jakarta,
                         y=perkapita_nasional),
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