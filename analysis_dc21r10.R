## dc21_data_keuangan_daerah
## R10_KEUANGAN_realisasi_belanja_2015.csv

# Goal: Clustering
#   Bagi tiga cluster berdasarkan realisasi pengeluaran

getwd()
setwd('~/Workspaces/r-ta-analysys')
library(dplyr)
library(ggplot2)
options(digits=14)

# buka csv
fpath = file.path('rawdata/dc21_data_keuangan_daerah/R10_KEUANGAN_realisasi_belanja_2015.csv')
df <- read.csv(fpath,stringsAsFactors = TRUE, na.strings = c('','NA'))

## Clean Data
# Convert string as numeric
df$ANGGARAN <- as.double(gsub('[,]', '.', gsub('[.]', '', df$ANGGARAN)))
df$REALISASI <- as.double(gsub('[,]', '.', gsub('[.]', '', df$REALISASI)))
df$C_URUSAN <- as.factor(df$C_URUSAN)

# Rearrange desc(anggaran)
df <- df %>%
  arrange(desc(ANGGARAN))

## VARS
R100_ <- 100000
J_ <- 10 * R100_
J10_ <- 10 * J_
J100_ <- 10 * J10_
M_ <- 10 * J100_
M10_ <- 10 * M_
M100_ <- 10 * M10_
T_ <- 10 * M100_

## Buat Kolom SELISIH, PERSEN_ANGGARAN,
#  PERSEN_REALISASI, SELISIH_PERSEN
persen <- sum(df$ANGGARAN)/100
df <- df %>%
  mutate('SELISIH' = ANGGARAN-REALISASI) %>%
  mutate('PERSEN_ANGGARAN' = ANGGARAN/persen) %>%
  mutate('PERSEN_REALISASI' = REALISASI/persen) %>%
  mutate('PERSEN_SELISIH' = PERSEN_ANGGARAN - PERSEN_REALISASI)

## Pilih data yang ada anggarannya
df_anggaran <- df %>%
  filter(ANGGARAN > 0) %>%
  arrange(desc(ANGGARAN))

## Pilih data yang realisasinya != 0 
df_realisasi_neg <- df %>%
  filter(REALISASI != 0) %>%
  arrange(SELISIH)

## Pilih data yang realisasinya > 0 
df_realisasi <- df %>%
  filter(REALISASI > 0 ) %>%
  # filter(SELISIH >= 0) %>%
  arrange(desc(REALISASI))

## for positif scew (mode < median < mean) (scott)
df_bellow_median <- df_realisasi %>%
  filter(ANGGARAN <= median(df_realisasi$ANGGARAN)) %>%
  arrange(desc(ANGGARAN))

df_above_median <- df_realisasi %>%
  filter(ANGGARAN > median(df_realisasi$ANGGARAN)) %>%
  arrange(desc(ANGGARAN))

## Outlier (scott)
# Outlier
# M_ * 9 didadapat dari str(hist(df_above_median$ANGGARAN, breaks='scott))
df_am_above <- df_above_median %>%
  filter(ANGGARAN >= M_ * 9) %>%
  arrange(desc(ANGGARAN))

df_am_bellow <- df_above_median %>%
  filter(ANGGARAN < M_ * 5) %>%
  arrange(desc(ANGGARAN))


## HISTOGRAM
# below median
ggplot(df_bellow_median, aes(x=ANGGARAN)) +
  geom_histogram(bins=nclass.scott(df_bellow_median$ANGGARAN),
                 colour="black", fill="white")

## above median
ggplot(df_above_median, aes(x=ANGGARAN)) +
  geom_histogram(bins=nclass.scott(df_above_median$ANGGARAN),
                 colour="black", fill="white")

# above (above median) witches outlier
ggplot(df_am_above, aes(x=ANGGARAN)) +
  geom_histogram(bins=nclass.scott(df_am_above$ANGGARAN),
                 colour="black", fill="white")

# below (above median)
ggplot(df_am_bellow, aes(x=ANGGARAN)) +
  geom_histogram(bins=nclass.scott(df_am_bellow$ANGGARAN),
                 colour="black", fill="white")

###############
### k-Menas ###
###############
## Plot Data
ggplot(df_realisasi_neg, aes(y=ANGGARAN, x=as.numeric(N_URUSAN))) +
  geom_point(aes(size=ANGGARAN,
                 alpha=.1)) +
  geom_point(aes(size=REALISASI,
                 alpha=.1,
                 colour='white')) +
  guides(size=FALSE,
         alpha=FALSE,
         col=FALSE)

## Jitter Plot
set.seed(100)
ggplot(df_realisasi_neg, aes(y=ANGGARAN, x=as.numeric(N_URUSAN))) +
  geom_point(aes(size=REALISASI,
                 alpha=.1),
             position=position_jitter(width=5,height=1)) +
  guides(size=FALSE,
         alpha=FALSE,
         col=FALSE)

## K-means
# remove unnecessary columns
df_col_cleans <- df_realisasi_neg %>%
  select(NAMA_SKPD,N_URUSAN,NAMA_AKUN,ANGGARAN,REALISASI)
 
## Making a scree plot
## determine how many cluster k

dummy <- df_col_cleans
dummy$NAMA_SKPD <- as.numeric(dummy$NAMA_SKPD)
dummy$N_URUSAN <- as.numeric(dummy$N_URUSAN)
dummy$NAMA_AKUN <- as.numeric(dummy$NAMA_AKUN)

max_k <- 20
ratio_ss <- c(rep(0,max_k))

for (k in 1:max_k) {
  df_km <- kmeans(dummy, k, 500)
  ratio_ss[k] <- df_km$tot.withinss/df_km$totss
}

# scree plot
plot(ratio_ss, type='b',xlab='k')

## based on scree plot 'the elbow' falls after 15,
# so the k best fit > 15
fit_km <- 15
df_km <- kmeans(dummy, fit_km, 500)
df_col_cleans$CLUSTER <- as.factor(df_km$cluster)

# plot a cluster
set.seed(100)
ggplot(df_col_cleans, aes(y=REALISASI,
                          x=as.numeric(ANGGARAN))) +
  geom_point(aes(size=ANGGARAN,
                 color=CLUSTER),
             alpha=.7,
             position=position_jitter(width=10,height=1)) +
  guides(size=FALSE,
         alpha=FALSE)