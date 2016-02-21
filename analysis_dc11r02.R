## dc11_data_ketenaga_kerjaan
## R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv

# Goal: Memprediksi
#   UMR dari variabel kenaikan_ump tahun sebelumnya dan
#   variabel inflasi tahun sebelumnya (inferential statistic)

getwd()
setwd('~/Workspaces/r-ta-analysys')
library('dplyr')
library('ggvis')

# buka csv
fpath = file.path('rawdata/dc11_data_ketenaga_kerjaan/R02_PEREKONOMIAN_upah_minimum_provinsi_dan_inflasi_di_dki_jakarta_1997_2014.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE) %>%
      arrange(tahun)

# Hapus Outlier
df_no_outlier <- df %>%
  filter(tahun != 1998) %>%
  mutate(ump1000=ump/1000)

## Buat regresi
# Prediksi UM vs % Kenaikan UMP Tahun Sebelumnya 
df_no_outlier %>%
  ggvis(~kenaikan_ump,~ump1000) %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE) %>%
  add_axis('x',title='% Kenaikan UMP Tahun Sebelumnya') %>%
  add_axis('y',title='UMP / 1000',title_offset = 50)
