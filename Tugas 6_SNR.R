# TUGAS 1
# Membuat data frame menggunakan 3 atau 4 vektor & tipe datanya bebas.
# Kemudian ambil 2 kolom (bebas) & tampilkan 1 kolom saja.


# ----- Kolom -----
nama = c("Daud", "Riyan", "Zadin", "Reus")
umur = c(21, 19, 25, 17)
tinggi_badan = c(172, 169, 176, 167)
hasil_tes = c(TRUE, TRUE, FALSE, TRUE)

# ----- Data Frame -----
data = data_frame(nama, umur, tinggi_badan, hasil_tes)
view(data)

names(data) = c("Nama", "Umur", "Tinggi Badan", "Hasil Tes")

# ----- Mengambil Data ----- 
data[c("Nama", "Hasil Tes")] # Mengambil 2 kolom
data$Nama # Mengambil 1 kolom
data[1:2, 1] # Mengambil 2 nilai dalam 1 kolom
