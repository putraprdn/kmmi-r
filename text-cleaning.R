library(tidyverse)
setwd("C:/Users/USER/Desktop")
#doc<-read.csv('tes.csv', stringsAsFactors = FALSE)
#glimpse(doc)

library(tidytext)
library(dplyr)
library(textclean)

# TEXT RAW
text_raw = "Presiden itu kepala negara boss,jgn dijadikan meme"

#b = scan(text = text_raw, sep = "", what = ",")
#print(b)

#1 TOKENIZE
library(tokenizers)
text_1 <- tokenize_words(text_raw)
text_1


#2 REMOVE STOPWORD, DELETE ALL SYMBOLS & REPLACE SLANG WORD

# Slang Word
spell.lex = read.csv("colloquial-indonesian-lexicon.csv")
text_2 <- replace_internet_slang(text_1, slang = paste0("\\b",
                                                        spell.lex$slang, "\\b"),
                                 replacement = spell.lex$formal, ignore.case = TRUE)

# Delete Stopword
#install.packages("stopwords")
library(stopwords)

myStopwords <- readLines("stoplist.txt")

text_3 <- as.character(text_2)
text_4 <- tokenize_words(text_3, stopwords = myStopwords)


# Delete symbol
text_5 <- strip(text_4)
text_5


#4 STEMMING
library(katadasaR)
text_6 <- as.character(text_5)

stemming <- function(x){
  paste(lapply(x,katadasar),collapse = " ")}

text_7 <- lapply(tokenize_words(text_6[]), stemming)


# text_raw
print(head(text_7, 50))

