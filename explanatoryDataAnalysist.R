#### Explanatory Data Analysist ####
library(tidyverse)

?economics

colnames(economics)
plot(economics)


# Rangkuman Data
glimpse(economics) # Glimpse untuk mengetahui masing-masing tipe variabel
summary(economics) # Summary untuk mengetahui central tendency data

?mtcars
mtcars %>%
  rownames_to_column()

df0 <- mtcars %>%
  rownames_to_column("jenis_mobil")
glimpse(df0)
summary(df0)

hasil_skim <- skimr::skim(df0)

# Memvisualisasikan distribusi
df1 <- df0 %>%
  separate(jenis_mobil, into = c("jenis", "mobil_1", "mobil_2", sep = " "))

df1$mobil_2[is.na(df1$mobil_2)] = " "
df1$mobil_1[is.na(df1$mobil_1)] = " "

df1$mobil_1 = paste(df1$mobil_1, df1$mobil_2)


# Menghilangkan variabel yang tidak diinginkan
df1 = df1 %>%
  select(-mobil_2)

df1 %>%
  count(jenis) %>%
  ggplot(aes(x = jenis, n)) + geom_col()

# Latihan 1
## Berapa distribusi jumlah yang dikumpulkan per tanggal
glimpse(economics)

economics %>%
  ggplot(aes(x = date, y = pce, color = uempmed)) + 
  geom_point()

# Value Khusus
diamonds2 <- diamonds %>%
  filter(between(y, 3, 20))
skimr::skim(diamonds2)

diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

skimr::skim(diamonds2)

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point()

## Data untuk mengisi NA
isi_na = mean(diamonds2$y)
isi_na = min(diamonds2$y)

diamonds2 %>%
  filter(is.na(y))


# Menggunakan library missforest
## Untuk memprediksi nilai yang hilang
library(missForest)
## Nonparametric missing value using "prodNA" function
data(iris)
summary(iris)
skimr::skim(iris)
## The data contains 4 continues and 1 categorical variable 

## Artificially produce missing values using "prodNA" function
set.seed(81)
iris.missing = prodNA(iris, noNA = 0.2)
summary(iris.missing)
skimr::skim(iris.missing)

# Eksplorasi dengan Visualisasi
## Variable Kategorik
glimpse(diamonds)

diamonds %>%
  count(cut, price) %>%
  ggplot(aes(x = price, y = n, color = cut)) +
  geom_line()

ggplot(diamonds) +
  geom_bar(mapping = aes(x=cut))

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

colnames(diamonds)

mtcars
mtcars %>%
  ggplot(aes(y = mpg, x = disp)) +
  geom_point()
            