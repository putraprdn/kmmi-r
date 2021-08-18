library(tidyverse)

# ---------- Import dan Eksport Data ----------
df_raw = readr::read_csv("https://raw.githubusercontent.com/eppofahmi/twitpres/master/Data%20Raw/u-eppo%20q-from%20prabowo%20from%202018-09-21%20to%202019-10-20.csv")
glimpse(df_raw)


# Pilih Kolom
# user_screen_name
# full_text

df_01 = df_raw %>%
  dplyr::select(user_screen_name, full_text)
# Selamat kepada Tim Nasional U-22 yang telah menang piala AFF 2019. Terima kasih atas perjuangan kalian untuk bangsa dan negara.

# ---------- Membagi Kolom ----------
df_02 = df_01 %>%
  tidyr::separate(col = full_text, into = c("full_text1", "full_text2", "full_text3"), sep =" ")
glimpse(df_02)

# ---------- Tokenisasi ----------
# Selamat kepada Tim Nasional U-22 yang telah menang piala AFF 2019.

library(tidytext)

df_03 = df_01 %>%
  unnest_tokens(output = "kata", input = full_text, token = "words", drop = FALSE)

# ---------- 2 Token ----------
glimpse(df_01)

df_04 = df_01 %>%
  unnest_tokens(output = "bigrams", input = full_text, token = "ngrams" , drop = FALSE)

# ---------- Memastikan Format ASCII ----------
library(textclean)
df_01$full_text = replace_non_ascii(x = df_01$full_text)

df_01 %>%
  head(10) %>%
  unnest_tokens(bigram, full_text, token = "ngrams", n = 2) 

df_05 = df_01 %>%
  mutate(jumlah_karakter = str_count(full_text, '\\S+'))

df_05 = df_05 %>%
  filter(jumlah_karakter > 15)

# ---------- Bigrams dengan Data yg < 2 ----------
df_06 = df_05 %>%
  head(10) %>%
  unnest_tokens(bigram, full_text, token = "ngrams", n = 2)

# ---------- Pisahkan Data di Kolom Bigram menjadi 2 Kolom ----------
df_07 = df_06 %>%
  select(bigram) %>%
  separate(col = bigram, into = c("source", "target", sep = " "))

# ---------- Membuat Data Adjacency ----------
library(tidytext)
library(stringr)

# Tambah Kolom Total Word per Row
df_07$total = str_count(df_07$source, '\\S+')

# ---------- Membuat Tokenisasi Kolom Mentioned ----------
adj_objek = df_07
class(adj_objek)

# ---------- Menyiapkan Data untuk Gephi ----------
# Create igrap
library(igraph) # Membuat objek network dan kalkulasi network
library(rgexf) # Untuk membuat file network

d_net = simplify(graph_from_data_frame(d = adj_objek, directed = FALSE),
         remove.loops = TRUE,
         remove.multiple = FALSE)

class(d_net)
plot(d_net)

# Save langsung
?write_graph
write_graph(d_net, "d_net.graphml", format = "graphml")

# Creates a Data Frame Nodes : 1st Column - node ID, 2nd Column - node name
nodes_df = data.frame(ID = c(1:vcount(d_net)), NAME = V(d_net)$name)
vcount(d_net)
V(d_net)

# Creates a Data Frame Nodes : 1st Column - source node ID, 2nd Column - target node ID
edges_df = as.data.frame(get.edges(d_net, c(1:ecount(d_net))))

# Save dengan nama nodes
write.gexf(nodes = nodes_df, edges = edges_df, defaultedgetype = "directed",
           output = "sample_net.gexf")

