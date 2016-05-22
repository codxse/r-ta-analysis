## dc22_data_ekspor_impor
## R12_KEUANGAN_impor_hs_2_mei_2014.csv
## R12_KEUANGAN_impor_hs_2_juli_2014.csv
## R12_KEUANGAN_impor_hs_2_september_2014.csv
## R12_KEUANGAN_impor_hs_2_oktober_2014.csv

getwd()
setwd('~/Workspaces/r-ta-analysys')
rm(list=ls())
library(ggplot2)
library(dplyr)

# remove scientific numeric
options(scipen=999)

## clean csv
df1 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_mei_2014.csv'),
                stringsAsFactors = FALSE)
df1$nilai_fob <- as.numeric(df1$nilai_fob)
df1$bulan <- as.factor(df1$bulan)
levels(df1$bulan) <- c(4,5)
df1$bulan <- as.Date(paste0(df1$tahun,'/',df1$bulan,'/01'))
df1 <- df1 %>% arrange(bulan)
df1$tahun <- NULL
df1$satuan <- NULL

df2 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_juli_2014.csv'),
                stringsAsFactors = FALSE)
df2$nilai_fob <- as.numeric(df2$nilai_fob)
df2$bulan <- as.factor(df2$bulan)
levels(df2$bulan) <- c(7,6)
df2$bulan <- as.Date(paste0(df2$tahun,'/',df2$bulan,'/01'))
df2 <- df2 %>% arrange(bulan)
df2$tahun <- NULL
df2$satuan <- NULL

df3 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_september_2014.csv'),
                stringsAsFactors = FALSE)
df3$nilai_fob <- as.numeric(df3$nilai_fob)
df3$bulan <- as.factor(df3$bulan)
levels(df3$bulan) <- c(8,9)
df3$bulan <- as.Date(paste0(df3$tahun,'/',df3$bulan,'/01'))
df3 <- df3 %>% arrange(bulan)
df3$tahun <- NULL
df3$satuan <- NULL

df4 <- read.csv(file.path('rawdata/dc22_data_ekspor_impor/R12_KEUANGAN_impor_hs_2_oktober_2014.csv'),
                stringsAsFactors = FALSE)
df4$nilai_fob <- as.numeric(df4$nilai_fob)
df4$bulan <- as.factor(df4$bulan)
levels(df4$bulan) <- c(10,9)
df4$bulan <- as.Date(paste0(df4$tahun,'/',df4$bulan,'/01'))
df4 <- df4 %>% arrange(bulan)
df4$tahun <- NULL
df4$satuan <- NULL
# remove row with NA value
na <- !(is.na(df4$nilai_fob))
df4.no_na <- df4[na,]

# bind all data
df <- rbind(df1,df2,df3,df4.no_na)
df <- arrange(df, bulan)

# convert to factor data type
df$golongan_barang <- as.factor(df$golongan_barang)

## Data Visualization
df.viz <- df
names(df.viz) <- c('Bulan','Golongan','Nilai')

# line chart
line_ <- ggplot(df.viz, aes(x=Bulan, y=Nilai)) +
  geom_line(aes(color=Golongan), size=1) +
  geom_point(aes(color=Golongan),
             size=3,
             shape=21,
             fill='white') +
  ggtitle('Nilai Impor DKI Jakarta\nMenurut Golongan Barang Tahun 2013-2014') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(y='Juta USD',
       x='Bulan')
line_

# distribution
df.viz$Tahun <- as.factor(paste0(format(df.viz$Bulan, '%Y')))
mean2013 <- mean(subset(df.viz, df.viz$Tahun == 2013)$Nilai)
mean2014 <- mean(subset(df.viz, df.viz$Tahun == 2014)$Nilai)
data_vlines <- data.frame(Tahun=levels(df.viz$Tahun),
                          Nilai=c(mean2013,mean2014))

h <- round(3.5*sd(df.viz$Nilai)*length(df.viz$Nilai)^(-1/3))
dist_ <- ggplot(df.viz, aes(x=Nilai)) +
  geom_histogram(binwidth=h,
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Impor DKI Jakarta Menurut Golongan Barang\nTahun 2013 dan 2014') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Juta USD',
       y='Frekuensi') +
  geom_vline(data=data_vlines,
             aes(xintercept=Nilai),
             color='red',
             size=1,
             alpha=.5) +
  facet_grid(. ~ Tahun)
dist_

break_point <- c(0,289,579,869,1159,1449,1739)
distAll_ <- ggplot(df.viz, aes(x=Nilai)) +
  geom_histogram(breaks=break_point,
                 color='black',
                 fill='white') +
  ggtitle('Distribusi Impor DKI Jakarta Menurut Golongan Barang') +
  theme(plot.title=element_text(face='bold', size=15)) +
  labs(x='Juta USD',
       y='Frekuensi') +
  geom_vline(xintercept=mean(df.viz$Nilai),
             color='red',
             size=1,
             alpha=.5)
distAll_