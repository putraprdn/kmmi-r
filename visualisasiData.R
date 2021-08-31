## Materi Visualisasi Data

# Paket yang Digunakan
library(tidyverse) # mengambil dataset dari package tidyverse
library(dplyr) # untuk preprocessing data
library(ggplot2) # untuk visualisasi data

# Import Data
data = mtcars
## Metadata merupakan data terpenting dalam DS

# Memberikan nama kolom terlebih dahulu
data_transportasi = data %>%
  tibble::rownames_to_column("car_model")

## Sebaran Data dan Komparasi
# Melihat sebaran dari mobil yang mempunyai kecepatan < 19 s/mile
data_sebaran = data_transportasi %>%
  select(car_model, qsec, mpg) %>%
  filter(qsec < 19)

# Menggunakan geom_point untuk visualisasi 
ggplot(data = data_sebaran, mapping = aes(x = mpg, y = qsec, color = car_model)) +
  geom_point(shape = 3) +
  theme_gray()

# Visualisasi mobil manual dgn konsumsi bahan bakar tertinggi-terendah
mobil_manual = data_transportasi %>%
  select(car_model, am, mpg) %>%
  filter(am == 1) %>%
  arrange(desc(mpg)) %>%
  select(car_model, mpg)

# Visualisasi mobil manual 
ggplot(data = mobil_manual, mapping = aes(x = car_model, y = mpg)) +
  geom_col(fill = "#c7ea46") +
  coord_flip() +
  theme_bw() +
  labs(x = "Tipe Mobil", y = "Konsumsi Bahan Bakar")

# Plot distribusi menggunakan line chart
economics = economics
economics_long = economics_long

## Visualisasikan tingkat individu dalam rentang waktu yang ada (line chart)
ggplot(data = economics, mapping = aes(x = date, y = pce, color = "pce")) +
  geom_line() +
  theme_bw() +
  labs(x = "Tingkat Konsumsi Masyarakat Indonesia", y = "Tahun", 
       title = "Tingkat Konsumsi Masyarakat Indonesia 1970-2010", 
       subtitle = "Data dari BPS")

?economics
