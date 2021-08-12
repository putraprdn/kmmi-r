# -------- R sebagai kalkulator --------
2 + 3
2 * 3
log10(100)

# -------- Tanda <- --------
data1 <- 20
data2 = 10
15 -> data3

# -------- Fungsi paste --------
teks1 <- "aku adalah anak gembala"
teks2 <- "selalu riang serta gembira"
paste0(teks1,teks2)



# -------- Memanggil library --------
library(tidyverse)
library(ggplot2)
library(devtools)



mtcars %>%
  select(cyl,disp) %>%
  ggplot(aes(x=cyl, y=disp)) + geom_point()

?devtools
install.packages("keData")  

# -------- Fungsi if & else --------
tim_a = 20
tim_b = 20

if(tim_a > tim_b){
  print("Tim A menang!")
} else{
  print("Tim B menang")
}

if(tim_a > tim_b){
  print("Tim A menang!")
}else if(tim_a < tim_b){
  print("Tim B menang!")
}else{
  print("Tim A dan Tim B seri!")
}

# -------- Fungsi For-loop --------
x = rnorm(30)

usq = 0

for(i in 1:10){
  usq[i] = x[i] * x[i]
}
print(usq[i])


# -------- Fungsi apply family --------
x = matrix(rnorm(30), nrow=5, ncol=6)
apply(x, 2, sum)

# -------- Vectors --------
a = c(1, 2, 3, 4, 5, -2, 4) # numeric vector
b = c("one", "two", "three") # character vector
c = c(TRUE, FALSE, TRUE, TRUE, FALSE) # logical vector


print(b[1])
print(b[c(1)])

# -------- Lists --------
x = list(name="Fred", age=25, height=160)
y = list("Saya", 5, 4, FALSE, -2)

print(x["age"])

# -------- Data Frame --------
id = c(1, 2, 3, 4) # vector kolom id
name = c("tom", "jerry", "dora", "emon") # vector kolom name
score = c(80.3, 78.4, 88.9, 90) # vector kolom score

# -------- Membuat Data Frame dari kolom Vector
my_data = data_frame(id, name, score)
view(my_data)

# -------- Menambahkan Nama Kolom --------
names(my_data) = c("ID", "Nama", "Nilai")
print(my_data)

my_data[1:3] # Mengambil data dari 1-3
my_data[2:3]
my_data[3]
my_data[c("Nama", "Nilai")] # Mengambil kolom dengan nama "Nama" dan "Nilai"
my_data$Nama
