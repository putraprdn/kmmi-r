# Membaca Data Ayam
# CSV jenis format file seperti XLS/XLXS hanya satu set
library(dplyr)
data_ayam <- read.csv("dataset-ayam.csv")

# Ambil data yg Title-nya mengandung kata tertentu
cariKata <- dplyr::filter(data_ayam, stringr::str_detect(Title, "gurih"))
### stringr::str_detect() untuk mencari kata dalam data

# Pilih beberapa data
dataPilihan <- dplyr::filter(data_ayam, stringr::str_detect(Ingredients, "cabai|lombok|cabe"))
dataPopuler <- dplyr::arrange(data_ayam, desc(Loves))

colnames(data_ayam)
### colnames untuk melihat nama kolom yg ada pada suatu data

# Mengambil 5 data teratas dengan jumlah "Loves" terbanyak
dataTop5 <- data_ayam %>%
  dplyr::arrange(desc(Loves)) %>%
  dplyr::select(Title, Loves) %>%
  dplyr::slice(1:5)
  
# Penyelesaian 
# 1. Cari Masakan pedas
#     a. Apa ciri masakan pedas? 
#        * Mengandung kata cabai/cabe/sambal/sambel/merica
#     b. Bagaimana kita bisa mengetahui masakan yang mengandung cabai?
# 2. Mengurutkan masakan berdasarkan popularitas
# 3. Memilih 5 makanan terpopuler


# Ria ingin mencoba salah satu resep ayam dari kumpulan resep yg ia temukan di internet
# Ria punya alergi telur dan pedas
# Rekomendasi 2 masakan yg sesuai dengan kondisi Ria

dataRia <- data_ayam %>%
  dplyr::filter(!stringr::str_detect(Ingredients, "pedas|telur|cabai|cabe|lombok|sambel|sambal|merica")) %>%
  dplyr::slice(1:2) # 2 resep teratas

dataRia2 <- data_ayam %>%
  dplyr::filter(!stringr::str_detect(Ingredients, "pedas|telur|cabai|cabe|lombok|sambel|sambal|merica")) %>%
  dplyr::arrange(desc(Loves)) %>%
  dplyr::slice(1:2) # 2 resep terpopuler

