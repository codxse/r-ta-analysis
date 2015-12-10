xberas <- read.csv('./cluster_data/mikro_data_komoditas_beras/PERDAGANGAN_perkembangan_harga_rata_rata_beras_grosir_di_pasar_induk_cipinang_pic_menurut_jenis_beras_2011.csv',
                    stringsAsFactors = FALSE)
bulan <- factor(xberas$bulan, ordered=FALSE)
jenis_beras <- factor(xberas$jenis_beras, ordered=FALSE)
header <- c('bulan','jenis_beras','harga')
t_beras <- data.frame(bulan,jenis_beras,xberas$harga)
names(t_beras) <- header
sd_harga <- sd(t_beras$harga)
mean_harga <- mean(t_beras$harga)
bulan <- c('January','February','March','April','Mey','June',
           'July','August','September','Oktober','November','December')
bulan <- vapply(bulan, as.Date, character(1), format='%B')
m_header <- c('bulan','harga')

# Tabel per Jenis Beras
t_cianjur_kepala <- t_beras[t_beras$jenis_beras == 'Cianjur Kepala', ]
t_cianjur_kepala <- data.frame(bulan,t_cianjur_kepala$harga,
                               stringsAsFactors=FALSE)
names(t_cianjur_kepala) <- m_header

plot(t_cianjur_kepala$harga/1000,
     main='Pergerakan Harga Rata-Rata Beras Cianjur Kepala 2011',
     ylab='(Rp.) Harga Beras Nasional x 1000',
     xlab='Bulan',
     col='red',
     #type='o',
     pch=1
     #lty=5
     )

#lm_t_cianjur_kepala <- (t_cianjur_kepala$harga ~ c(1:12))
#abline(coef(lm_t_cianjur_kepala),lwd=2)

mean_t_cianjur_kepala <- mean(t_cianjur_kepala$harga)
sd_t_cianjur_kepala <- sd(t_cianjur_kepala$harga)

# Plotting GLOBAL
hist(t_beras$harga/1000,
     main='Distribusi Harga Rata-Rata Beras 2011',
     xlab='(Rp.) Harga Beras Nasional x 1000',
     col='orange',
     breaks='sturges')

plot_a <- plot(t_beras$jenis_beras, t_beras$harga/1000,
               ylab='(Rp.) Harga Beras Nasional x 1000',
               xlab='Jenis Beras',
               cex.axis=1)

plot_a <- plot(t_beras$harga/1000,
               ylab='(Rp.) Harga Beras Nasional x 1000',
               col='orange',
               type='o',
               pch=4, # Symbol
               lty=5, # Line Type
               cex.axis=1
               #xlim=c(1,24)
               )

# Graph Keseluruhan
# plot(t_beras[,c('harga','jenis_beras','bulan')])