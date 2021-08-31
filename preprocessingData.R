# Data preparation/Mempersiapkan data
# Mengolah suatu tabel untuk siap dianalisis
# Ambil dataframe dari bawaan R

?airquality
data("airquality")

# force(airquality)

# Descriptive Analysist
summary(airquality)

# View(airquality)

# Penanganan NA (Missing Values)
## 1. Hapus (tidak direkomendasikan)
## 2. Inputasi
##    2.1 Ambil data ulang
##    2.2 Pendekatan nilai

# Menghapus NA
air_bersih <- na.omit(airquality)

# Menggunakan DPLYR
library(dplyr)

#--------------------------
# Memilih Kolom (Variabel)
#--------------------------
airwind <- air_bersih$Wind
airwind_df <- data.frame(airwind)


# 2. Cara 2
air2 <- dplyr::select(air_bersih,Ozone,Temp,Wind)

# 3. Cara 3
air3 <- dplyr::select(air_bersih,1:5)


#--------------------------
# Memilih Baris
#--------------------------
# 1. Cara 1
air4 <- dplyr::slice(air_bersih,15:25) # Slice (memotong) data pada baris 15-25

# 2. Cara 2
air5 <- dplyr::filter(air_bersih,Temp < 80 & Ozone > 10)

# 3. Cara 3
set.seed(63)
air6 <- dplyr::sample_n(air_bersih,2)
air7 <- dplyr::sample_n(air_bersih,0.1)
air8 <- dplyr::sample_frac(air_bersih,0.1) 
### sample_frac adalah pecahan

#--------------------------
# Memilih Baris
#--------------------------
air9 <- dplyr::arrange(air_bersih,Ozone)
air10 <- dplyr::arrange(air_bersih,desc(Ozone))
air11 <- dplyr::arrange(air_bersih,desc(Solar.R))
### arrange untuk mengurutkan

#--------------------------
# 1. Memilih Kolom Temp dan Ozone
# 2. Filter ambil Ozone > 30
# 3. Mengurutkan berdasarkan Temp secara descending
#--------------------------
coba <- dplyr::select(air_bersih,Ozone,Temp)
coba2 <- dplyr::filter(coba,Ozone > 30)
coba3 <- dplyr::arrange(coba,desc(Temp))

# Pipes
## Untuk menuliskan skrip yg berurutan dengan data yang sama
library(dplyr)
coba4 <- air_bersih %>%
  dplyr::select(Ozone,Temp) %>% 
  dplyr::filter(Ozone > 30) %>%
  dplyr::arrange(desc(Temp))


