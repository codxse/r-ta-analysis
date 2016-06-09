## Topik Ekonomi
## D03_EKO_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional.csv

# Goal: Memprediksi
#   % ekonomi nasional vs % ekonomi jakarta
#   cari tahu % pertumbuhan ekonomi nasional dari % ekonomi jakarta

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(tidyr)

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/DT01_eko/K02_perekonomian/D03_EKO_PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
  arrange(tahun)

title <- c('Laju Pertumbuhan Ekonomi Jakarta vs. Nasional')
x <- c('Pertumbuhan Ekonomi Jakarta (%)','Tahun')
y <- c('Pertumbuhan Ekonomi Nasional (%)')
model_pred <- 'f(x) = 1.1119x - 0.9794'

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
       y='Persen (%)') +
  ggtitle('Laju Pertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15))
line1_

## Buat Model Linear ggplot2
# Pertumbuhan Ekonomi Jakarta vs. Nasional
# fit <- lm(df$persen_tumbuh_nasional ~ df$persen_tumbuh_jakarta)
# summary(fit)
# library(ggvis)
# compute_model_prediction(df,persen_tumbuh_nasional~persen_tumbuh_jakarta,model='lm', se=TRUE)
# cor(df$persen_tumbuh_nasional,df$persen_tumbuh_jakarta)

## Scatter Plot
plot1_ <- ggplot(df,aes(x=persen_tumbuh_jakarta,
                        y=persen_tumbuh_nasional)) +
  geom_point() + 
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Laju Pertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15))
plot1_

## Resedual y_pred - kenaikan_ump
plotRes_ <- ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  geom_segment(aes(x=persen_tumbuh_jakarta,
                   y=persen_tumbuh_nasional,
                   xend=persen_tumbuh_jakarta,
                   yend=fitted(lm(persen_tumbuh_nasional~persen_tumbuh_jakarta,
                                  data=df)))) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle('Plot Laju Pertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  guides(col=F)
plotRes_

## Linear Model without SE
# fit <- lm(df$persen_tumbuh_nasional ~ df$persen_tumbuh_jakarta)
# library(ggvis)
# compute_model_prediction(df,persen_tumbuh_nasional~persen_tumbuh_jakarta,model='lm', se=TRUE)
ModelNoSe_ <- ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=FALSE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle(title[1]) +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred)
ModelNoSe_

## Linear Model with SE
ModelSe_ <- ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  labs(x=x[1],
       y=y[1]) +
  ggtitle(title[1]) +
  theme(plot.title=element_text(face='bold',size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred)
ModelSe_

## Confident Interval inflasi 7% (x=7)
predict(lm(persen_tumbuh_nasional~persen_tumbuh_jakarta,
           data=df),
        data.frame(persen_tumbuh_jakarta=7),
        interval='confidence')

## Data Visualization
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))

# Model Prediction
modelPred_ <- ggplot(df,aes(x=persen_tumbuh_jakarta,
              y=persen_tumbuh_nasional)) +
  geom_point() +
  geom_smooth(method='lm',se=TRUE,aes(col='red')) +
  xlab(x[1]) +
  ylab(y[1]) +
  ggtitle('Model Prediction\nPertumbuhan Ekonomi Jakarta vs. Nasional') +
  theme(plot.title=element_text(face="bold", size=15)) +
  scale_color_manual('Model',values='red',labels=model_pred) +
  guides(size=F)
modelPred_

df.viz <- df
names(df.viz) <- c('Tahun','Pertumbuhan Jakarta','Pertumbuhan Nasional')
df.viz <-  gather(df.viz, variable, persen, -Tahun)
df.viz$variable <- as.factor(df.viz$variable)

line_ <- ggplot(df.viz, aes(x=Tahun, y=persen)) +
  geom_line(aes(color=variable),size=1) +
  geom_point(aes(color=variable),
             size=3,
             shape=21,
             fill='white') +
  scale_size(range=c(5,10)) +
  labs(color='Keterangan',
       x='Tahun',
       y='Pertumbuhan (%)') +
  ggtitle('Laju Pertumbuhan Ekonomi Jakarta & Nasional') +
  theme(plot.title=element_text(face="bold", size=15))
line_