library('ggvis')
library('dplyr')
library('ISwR')

# Regresi Linear untuk pertumbuhan ekonomi
eco_growth <- read.csv('cluster_data/makro_data_pertumbuhan_ekonomi/PEREKONOMIAN_laju_pertumbuhan_ekonomi_jakarta_nasional_2006_2012.csv')
names(eco_growth) <- c('year','pertumbuhan_jakarta','pertumbuhan_nasional')
line_fit <- lm(eco_growth[[3]] ~ eco_growth[[2]], data=eco_growth)

eco_growth %>%
  ggvis(~pertumbuhan_jakarta,~pertumbuhan_nasional,fill:='green') %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE)

# Regresi Linear untuk Inflasi
nas_inflation <- read.csv('cluster_data/makro_data_pertumbuhan_ekonomi/PEREKONOMIAN_inflasi_jakarta_nasional_2006_2012.csv')
names(nas_inflation) <- c('year','inflasi_jakarta','inflasi_nasional')
line_fit_if <- lm(nas_inflation[[3]] ~ nas_inflation[[2]], data=nas_inflation)

nas_inflation %>%
  ggvis(~inflasi_jakarta,~inflasi_nasional,fill:='red') %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE)

# Pendapatan Perkapitra Jakarta dan Nasional
perkapita <- read.csv('cluster_data/makro_data_pertumbuhan_ekonomi/KEUANGAN_pendapatan_perkapita_jakarta_nasional_2006_2012.csv')
names(perkapita) <- c('year','jakarta','nasional')
line_fit_2 <- lm(perkapita[[3]] ~ perkapita[[2]], data=perkapita)

perkapita %>%
  ggvis(~jakarta,~nasional,fill:='purple') %>%
  layer_points() %>%
  layer_model_predictions(model='lm', se=TRUE)

# Join table
teco <- data.frame('tahun'=nas_inflation[[1]],
                       'inflasi_jakarta'=nas_inflation[[2]],
                       'inflasi_nasional'=nas_inflation[[3]],
                       'pertumbuhan_jakarta'=eco_growth[[2]],
                       'pertumbuhan_nasional'=eco_growth[[3]],
                       'pkpt_jakarta'=perkapita[[2]],
                       'pkpt_nasional'=perkapita[[3]])

# Inflasi Nasional vs Pertumbuhan Nasional
line_fit_3 <- lm(teco$inflasi_jakarta ~ teco$pertumbuhan_nasional, data=teco)
teco %>%
  ggvis(~inflasi_nasional,~pertumbuhan_nasional,fill:='orange') %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE)

# Perkapita Nasional vs Pertumbuhan Nasional
line_fit_4 <- lm(teco$pkpt_nasional ~ teco$pertumbuhan_nasional, data=teco)
teco %>%
  ggvis(~pkpt_nasional,~pertumbuhan_nasional,fill:='blue') %>%
  layer_points() %>%
  layer_model_predictions(model='lm',se=TRUE)

# Training
# http://katadata.co.id/berita/2015/06/22/perekonomian-ibu-kota-hanya-akan-tumbuh-53-58-persen
# 2015 median dari Perkiraan BI
katadata <- data.frame(c(2013,2014,2015),
                       c(6.1,5.9,5.55),
                       c(5.8,5.02,5.6),
                       c('train','train','train'))

names(katadata) <- c('year','pertumbuhan_jakarta','pertumbuhan_nasional','type')
train_data <- eco_growth %>%
  mutate('type'='test') %>%
  rbind(katadata)

#train_data$tpe <- as.factor(train_data$tpe)

train_data %>%
  ggvis(~pertumbuhan_jakarta,
        ~pertumbuhan_nasional,
        fill=~type) %>%
  layer_points() %>%
  layer_model_predictions(model='lm')
  

iris %>%
  ggvis(~Sepal.Length,~Sepal.Width,fill=~Species) %>%
  layer_points()