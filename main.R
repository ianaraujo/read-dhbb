# Trabalho - Tópico 3 em Ciência Política
# Prof. Jaqueline Zulini

# install.packages("tidyverse")
# install.packages("here")

library(tidyverse)
library(here)

# Importação dos arquivos .text para serem trabalhados no R

lista_dados_brutos <- purrr::map(list.files(here("dhbb", "text"), full.names = T), ~ read.delim(file = .x, header = FALSE))

verbetes <- purrr::map(lista_dados_brutos, ~ str_c(.x$V1, collapse = " ")) %>%
  do.call(rbind.data.frame, .)

colnames(verbetes) <- "text"

verbetes <- cbind(id_text = 1:7709, verbetes)

# Construção da base de dados, usando text mining para criar variáveis

base_verbetes <- verbetes %>%
  mutate(info = str_extract(text, "---\\s*(.*?)\\s*---")) %>%
  mutate(nome = str_extract(text, "«\\s*(.*?)\\s*»")) %>%
  mutate(sexo = str_extract(text, "sexo:\\s*(.*?)\\s*cargos")) %>%
  mutate(cargos = str_extract(text, "cargos:\\s*(.*?)\\s*(autor|---)")) %>%
  mutate(text = str_remove(text, "---\\s*(.*?)\\s*---")) %>%
  select(id_text, nome, sexo, cargos, text)

# Limpeza da base de dados criada

base_verbetes <- base_verbetes %>%
  mutate(nome = str_remove(nome, "«")) %>%
  mutate(nome = str_remove(nome, "»")) %>%
  mutate(text = str_remove(text, "«")) %>%
  mutate(text = str_remove(text, "»")) %>%
  mutate(cargos = str_remove(cargos, "cargos:")) %>%
  mutate(cargos = str_remove(cargos, "autor")) %>%
  mutate(cargos = str_remove(cargos, "---")) %>%
  mutate(sexo = str_remove(sexo, "sexo:")) %>%
  mutate(sexo = str_remove(sexo, "cargos")) %>%
  mutate(sexo = toupper(sexo))

base_verbetes$nome <- str_trim(base_verbetes$nome, side = "both")
base_verbetes$text <- str_trim(base_verbetes$text, side = "both")
base_verbetes$sexo <- str_trim(base_verbetes$sexo, side = "both")
base_verbetes$cargos <- str_trim(base_verbetes$cargos, side = "both")

# Removendo entradas que possuem 'sexo' == NA
# Removendo instituições, associações, jornais, partidos políticos
# Presença somente de verbetes de pessoas

# base_verbetes <- base_verbetes %>% filter(!is.na(sexo))

# Cria um arquivo. csv para ser usado no R ou outro software estatístico

write_csv(base_verbetes, file = "verbetes_dataset.csv")