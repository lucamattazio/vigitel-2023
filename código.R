#limpa o global enviroment
rm(list=ls())

# leitura de bibliotecas ----
library(data.table) #biblioteca para o fread
library(dplyr) #biblioteca para os pipes %>%
library(tidyr) #biblioteca para o pivot_wider
library(bit64)

# diretório de trabalho ----
setwd("C:/Users/Luca Nakamura/Documents/Vigitel")

##adiciona base----
VIGITEL_23_microdados <- fread("Vigitel-2023-peso-rake.csv",
                             encoding = "Latin-1",
                             dec = ",")

## seleciona apenas as variáveis de interesse
VIGITEL_23_microdados_filtrados <- VIGITEL_23_microdados %>%
  select(chave,
         q7,
         q79a,
         q80,
         q88
  )

# Filtra os dados para mulheres sem plano de saúde que fizeram Papanicolau há menos de 3 anos
mulheres_semplano_comexame_menosde3anos <- VIGITEL_23_microdados_filtrados %>%
  filter(q7 == 2, # Filtra mulheres
         q79a == 1, # Já realizaram Papanicolau
         q80 %in% c(1, 2, 3), # fizeram o exame há menos de 3 anos
         q88 == 3) # Sem plano de saúde

# Filtra os dados para mulheres sem plano de saúde que não fizeram Papanicolau
mulheres_semplano_semmexame <- VIGITEL_23_microdados_filtrados %>%
  filter(q7 == 2, # Filtra mulheres
         q79a == 2, # Já realizaram Papanicolau
         q88 == 3) # Sem plano de saúde


# Calcula o percentual de mulheres que se enquadram no critério
percentual_sem_preventivo <- ((nrow(mulheres_semplano_comexame_menosde3anos)+nrow(mulheres_semplano_semmexame)) / 
                                nrow(VIGITEL_23_microdados_filtrados %>% filter(q7 == 2, q88 == 3))) * 100

# Exibe o percentual
percentual_sem_preventivo
