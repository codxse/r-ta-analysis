## dc11_data_ketenaga_kerjaan
## R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2010_2012.csv

# Buat tabel pada dc1_data_ketenaga_kerjaan menjadi lebih rapih
# Kolom yang ada menjadi:
#   tahun, pk_belum_ditempatkan_awal_tahun, pk_terdaftar, pk_ditempatkan, pk_dihapus,
#   lk_belum_dipenuhi, lk_terdaftar, lk_dipenuhi, lk_dihapus, lk_ada_untuk_i_ii

# buka csv
fpath = file.path('~/Workspaces/r-ta-analysys/rawdata/dc11_data_ketenaga_kerjaan/R01_PEREKONOMIAN_ikhtisar_statistik_antar_kerja_2010_2012.csv')
df <- read.csv(fpath,stringsAsFactors = FALSE)
df$jumlah <- replace(df$jumlah, c(31,35), 0)
df$tahun <- as.character(df$tahun)
df$jumlah <- as.numeric(df$jumlah)

## subset row yang sama
# Pencari Kerja yang belum ditempatkan Awal Tahun
pk1 <- subset(df,df$rincian_indikator == 'Pencari Kerja yang belum ditempatkan Awal Tahun')
pk1 <- subset(pk1,select = -c(2,3))

# Pencari Kerja yang Terdaftar
pk2 <- subset(df,df$rincian_indikator == 'Pencari Kerja yang Terdaftar')
pk2 <- subset(pk2,select = -c(2,3))

# Pencari Kerja yang ditempatkan
pk3 <- subset(df,df$rincian_indikator == 'Pencari Kerja yang ditempatkan')
pk3 <- subset(pk3,select = -c(2,3))

# Pencari Kerja yang dihapus
pk4 <- subset(df,df$rincian_indikator == 'Pencari Kerja yang dihapus')
pk4 <- subset(pk4,select = -c(2,3))

# Lowongan yang belum dipenuhi
lk1 <- subset(df,df$rincian_indikator == 'Lowongan yang belum dipenuhi')
lk1 <- subset(lk1,select = -c(2,3))

# Lowongan yang terdaftar
lk2 <- subset(df,df$rincian_indikator == 'Lowongan yang terdaftar')
lk2 <- subset(lk2,select = -c(2,3))

# Lowongan yang dipenuhi
lk3 <- subset(df,df$indikator == 'Lowongan yang dipenuhi')
lk3 <- subset(lk3,select = -c(2,3))

# Lowongan Yang dihapus
lk4 <- subset(df,df$indikator == 'Lowongan Yang dihapus')
lk4 <- subset(lk4,select = -c(2,3))

# Lowongan Yang Ada (I-II)
lk5 <- subset(df,df$indikator == 'Lowongan Yang Ada (I-II)')
lk5 <- subset(lk5,select = -c(2,3))
