# Digunakan untuk mengecek apakah paket yang dibutuhkan sudah
# terinstall atau belum. Jika belum install.package()
install_paket <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
# usage
paket <- c("tidyverse", "tidytext", "reshape2", "RColorBrewer", "scales",
           "haven","topicmodels", "plotly", "DT", "knitr", "readxl", "missForest")
install_paket(paket)

# R	Sebagai	Kalkulator
2 + 3 # the space around '+' is optional
2 * 3 #=> 6
sqrt(36) #=> 6, square root
log10(100) #=> 2, log base 10
10 / 3 #=> 3.3, 10 by 3
10 %/% 3 #=> 3, quotient of 10 by 3
10 %% 3 #=> 1, remainder of 10 by 3 

#Tanda <-
sebuah_data <- 10 # assign 10 to 'a'
sebuah_data = 10 # same as above
10 -> sebuah_data # assign 10 to 'a’
10 = sebuah_data # Wrong!. This will try to assign `a` to 10.
sebuah_data

# Workspace
setwd("/path/to/my/CoolProject") # mengatur folder sumber (tidak disarankan)
ggsave(plots/diamonds.pdf) # menyimpan objek ggplot2 dalam folder plot
write.csv(contoh, "cleanData/contoh.csv") # menyimpan csv di folder cleanData
write.csv(contoh, "cleanData\contoh.csv") # di SO Windows

# Fungsi Paste
teks1 <- "aku adalah anak gembala"
teks2 <- "selalu riang serta gembira"
teks12 <- paste(teks1, teks2, sep = " ")
teks12
teks0 <- paste0(teks1, teks2)
teks0
teks <- paste0(teks1, " ", teks2)
teks

# Fungsiif dan else
Tim_A = 10
Tim_B = 6
if (Tim_A > Tim_B) {
  print("Tim A Menang")
}

Tim_A = 7
Tim_B = 9
if (Tim_A > Tim_B) {
  print("Tim A Menang")
} else {
  print("Tim B Menang")
}

Tim_A = 8
Tim_B = 8
if (Tim_A > Tim_B) {
  print("Tim A Menang")
} else if(Tim_A == Tim_B) {
  print("Seri")
}
  
# Fungsi for-Loop
# # Create a vector filled with random normal values
u1 <- rnorm(30)
print("This loop calculates the square of the first 10 elements of vector u1")

# Initialize `usq`
usq <- 0

for(i in 1:10) {
# i-th element of `u1` squared into `i`-th position of `usq`
usq[i] <- u1[i] * u1[i]
print(usq[i])
}

print(i)
print("Tim B Menang")

# Fungsi Apply Family
X <- matrix(rnorm(30), nrow=5, ncol=6) # Construct a 5x6 matrix
apply(X, 2, sum) # Sum the values of each column with `apply()`

A <- c(1:5)
B <- c(6:20)
C <- c(7:15)
# Create a list of matrices
MyList <- list(A,B,C)
# Extract the 2nd column from `MyList` with the selection operator `[` with
`lapply()`
lapply(X = MyList, FUN = "[", 2)

# Extract the 1st row from `MyList`
lapply(MyList,"[", 1)
lapply(airquality, class) # return classes of each column in 'airquality' in a
list
sapply(airquality, class) # return classes of each column in 'airquality'

# Vectors
a <- c(1,2,5.3,6,-2,4) # numeric vector
b <- c("one","two","three") # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

# mengakses elemen nomer 2 dari vector a
print (a[c(3)])

# Lists
w <- list(name="Fred", age=25, height=159.7)
x <- list("saya",5.4,1,FALSE)
print(x[1]) # mengakses melalui urutan indeks
print(w['name']) # mengakses melalui key

# Data Frame
id <- c(1,2,3,4) #vector kolom id
name <- c("tom", "jerry", "dora", "emon") #vector kolom name
score <- c(85.4,78.3,88.9,90) #vector kolom score

# membuat data frame dari kolom vector
mydata <- data.frame(id,name,score)

# menambahkan nama kolom
names(mydata) <- c("ID","Nama","Nilai")
print(mydata)

# mengambil kolom 1 sampai 3
mydata[1:3]

# mengambil kolom dengan nama "ID" dan "Nilai"
mydata[c("ID","Nilai")]

# mengambil satu kolom dengan nama "Nilai”
mydata$Nilai
