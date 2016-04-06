## dc22_data_ekspor_impor
## R11_KEUANGAN_ekspor_2011.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(dplyr)
library(ggplot2)
library(tidyr)
if (!exists("multiplot", mode="function")) source("multiplot.R")

# remove scientific numeric
options(scipen=999)

# buka csv
fpath = file.path('rawdata/dc22_data_ekspor_impor/R11_KEUANGAN_ekspor_2011.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)

## Clean Data
# Nilai damal Ribu USD
# Volume dalam Ton
df$volume <- as.double(df$volume)
df$nilai <- as.double(df$nilai)
df$tahun <- as.Date(paste0(df$tahun,'/01/01'))
df$jenis_komoditas <- as.factor(df$jenis_komoditas)

set.seed(100)
## k-Means Scree Diagram
max_k <- 15
ratio_ss <- c(rep(0,max_k))
dummy <- select(df, c(4,5))
dummy$komoditas <- as.numeric(df$jenis_komoditas)*1000

for (k in 1:max_k) {
  df_km <- kmeans(dummy, k, 100)
  ratio_ss[k] <- df_km$tot.withinss/df_km$totss
}

scree_ <- plot(ratio_ss, type='b',xlab='k')
scree_

df_temp <- df

## Itrasi 1
km_1 <- kmeans(dummy, 3, 1)
df_temp$c1 <- as.factor(km_1$cluster)

plotC1_ <- ggplot(df_temp, aes(x=volume, y=nilai)) +
  geom_point(aes(color=c1),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  geom_point(data=data.frame(km_1$centers),
             aes(x=volume, y=nilai),
             pch=17) +
  labs(x='Volume (Ton)',
       y='Juta USD') +
  guides(alpha=FALSE,
         color=FALSE)
plotC1_

## Itrasi 2
km_2 <- kmeans(dummy, 3, 2)
df_temp$c2 <- as.factor(km_2$cluster)

plotC2_ <- ggplot(df_temp, aes(x=volume, y=nilai)) +
  geom_point(aes(color=c2),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  geom_point(data=data.frame(km_2$centers),
             aes(x=volume, y=nilai),
             pch=17) +
  labs(x='Volume (Ton)',
       y='Juta USD') +
  guides(alpha=FALSE,
         color=FALSE)
plotC2_

## Iterasi 3
km_3 <- kmeans(dummy, 3, 3)
df_temp$c3 <- as.factor(km_3$cluster)

plotC3_ <- ggplot(df_temp, aes(x=volume, y=nilai)) +
  geom_point(aes(color=c3),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  geom_point(data=data.frame(km_3$centers),
             aes(x=volume, y=nilai),
             pch=17) +
  labs(x='Volume (Ton)',
       y='Juta USD') +
  guides(alpha=FALSE,
         color=FALSE)
plotC3_

## Iterasi 5
km_5 <- kmeans(dummy, 3, 5)
df_temp$c5 <- as.factor(km_5$cluster)

plotC5_ <- ggplot(df_temp, aes(x=volume, y=nilai)) +
  geom_point(aes(color=c5),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  geom_point(data=data.frame(km_5$centers),
             aes(x=volume, y=nilai),
             pch=17) +
  labs(x='Volume (Ton)',
       y='Juta USD') +
  guides(alpha=FALSE,
         color=FALSE)
plotC5_

## ---------
mult_ <- multiplot(plotC1_, plotC2_,
                   plotC3_, plotC5_, cols=2)
df_km <- km_5

df$cluster <- as.factor(df_km$cluster)
df_center <- df_km$centers
df <- df %>%
  arrange(cluster)
levels(df$cluster) <- c('Barang Mentah',
                         'Barang Setengan Jadi',
                         'Barang Jadi')
  
set.seed(100)
plot_ <- ggplot(df, aes(x=volume,y=nilai)) +
  geom_point(alpha=.5,
             position=position_jitter(width=10,height=1)) +
  labs(x='Volume (Ton)',
       y='Juta USD') 
plot_

set.seed(100)
plotCol_ <- ggplot(df, aes(x=volume, y=nilai)) +
  geom_point(aes(color=cluster),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  labs(x='Volume (Ton)',
       y='Juta USD') +
  guides(alpha=FALSE,
         color=FALSE)
plotCol_

set.seed(100)
cluster_ <- ggplot(df, aes(x=volume, y=nilai)) +
  geom_point(aes(acolor=cluster),
             alpha=.5,
             position=position_jitter(width=10,height=1)) +
  labs(color='Grup',
       x='Volume (Ton)',
       y='Juta USD') +
  ggtitle("Plot Volume Dan Nilai Ekspor Melalui DKI Jakarta\nMenurut Jenis Komoditi Tahun 2011-2012") +
  theme(plot.title=element_text(face='bold',size=15)) +
  guides(alpha=FALSE)
cluster_

## Data Visualization
df.viz <- df
df.viz$hs <- NULL
names(df.viz) <- c('Tahun','Komoditas',
                   'Volume','Nilai',
                   'Grup')
df.viz$Grup <- as.factor(df.viz$Grup)

df.tidy <- gather(df.viz, key, Total, -c(1,2,5))

df.tidy <- df.tidy %>%
  arrange()

bar_ <- ggplot(df.tidy, aes(x=format(Tahun,'%Y'))) +
  geom_bar(position='fill',
           stat='identity',
           aes(fill=Grup,
               y=Total)) +
  scale_y_continuous(labels=scales::percent) +
  labs(x='Tahun',
       y='Total (%)') +
  ggtitle("Volume Ekspor Melalui DKI Jakarta\nTahun 2011-2012") +
  theme(plot.title=element_text(face='bold',size=15)) +
  facet_grid(. ~ key)
bar_