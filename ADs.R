# pacotes
library(tibble)
library(ggplot2)
library(lattice)
library(dplyr)
library(stringr)
library(chron)
library(tidyverse)

# Carregando os dados
F_Vendas = read.csv(file = "G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/export (2).csv", header = TRUE , sep = ";", encoding = "UTF-8" )
D_Vendas = read.csv(file = "G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/export (3).csv", header = TRUE , sep = ";", encoding = "UTF-8" )
P_Vendas = read.csv(file = "G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/export (4).csv", header = TRUE , sep = ";", encoding = "UTF-8" )
G_Com = read.csv("G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/generated_commission_20191101121518_531413B214748309838321265765.csv", header = TRUE , sep = ";", encoding = "UTF-8" )
P_Affi = read.csv("G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/performance_affiliation_list_20191101121724_3519E3057684540589091977693.csv", header = TRUE , sep = ";", encoding = "UTF-8" )
R_Affi = read.csv("G:/Github/Projetos Prontos/20191101 ADs/1 - Dados originais/revenue_affiliates_20191101122342_89EBF945794143826636776297.csv", header = TRUE , sep = ";", encoding = "UTF-8" )

# Transformando em tibble
Form_Vendas <- as_tibble(F_Vendas)
Dias_Vendas <- as_tibble(D_Vendas)
Pais_Vendas <- as_tibble(P_Vendas)
Gen_Com <- as_tibble(G_Com)
Per_Affi <- as_tibble(P_Affi)
Rev_Affi <- as_tibble(R_Affi)

# Primeira olhada
Form_Vendas
Dias_Vendas
Pais_Vendas
Per_Affi
Rev_Affi
Gen_Com
Com_Afiliados
Com_Sem.afi

# Arrumando as tabelas
# Form_Vendas
# Renomeando as colunas
colnames(Form_Vendas)
Form_Vendas <- Form_Vendas %>% 
  rename(
    Vendas_Por = Vendas..em...,
    Receitas_Por = Receitas..em...,
    Formas_de_Pag = X.U.FEFF.Formas.de.Pagamento
  )
# Tirando simbolos para transformar as colunas corretamente
# Vendas_Por
Form_Vendas$Vendas_Por <- gsub("[A-z$%.[:space:]]", "", Form_Vendas$Vendas_Por)
Form_Vendas$Vendas_Por <- gsub("[,]", ".", Form_Vendas$Vendas_Por)
Form_Vendas$Vendas_Por <- as.numeric(Form_Vendas$Vendas_Por)
# Receitas
Form_Vendas$Receitas <- gsub("[A-z$%.[:space:]]", "", Form_Vendas$Receitas)
Form_Vendas$Receitas <- gsub(",", ".", Form_Vendas$Receitas)
Form_Vendas$Receitas <- as.numeric(Form_Vendas$Receitas)
# Receitas_Por
Form_Vendas$Receitas_Por <- gsub("[A-z$%.[:space:]]", "", Form_Vendas$Receitas_Por)
Form_Vendas$Receitas_Por <- gsub("[,]", ".", Form_Vendas$Receitas_Por)
Form_Vendas$Receitas_Por <- as.numeric(Form_Vendas$Receitas_Por)

# Olhando depois de arrumado
Form_Vendas

# Dias_Vendas
# Renomeando as colunas
colnames(Dias_Vendas)
Dias_Vendas <- Dias_Vendas %>% 
  rename(
    Receitas_Por = Receitas..em...,
    Data_da_Venda = X.U.FEFF.Data.da.Venda
  )

# Tirando simbolos para transformar as colunas corretamente
# Receitas

Dias_Vendas$Receitas <- gsub("[A-z$%.[:space:]]", "", Dias_Vendas$Receitas)
Dias_Vendas$Receitas <- gsub("[,]", ".", Dias_Vendas$Receitas)
Dias_Vendas$Receitas <- as.numeric(Dias_Vendas$Receitas)
# Receitas_Por
Dias_Vendas$Receitas_Por <- gsub("[A-z$%.[:space:]]", "", Dias_Vendas$Receitas_Por)
Dias_Vendas$Receitas_Por <- gsub("[,]", ".", Dias_Vendas$Receitas_Por)
Dias_Vendas$Receitas_Por <- as.numeric(Dias_Vendas$Receitas_Por)
# Data_da_Venda
Dias_Vendas$Data_da_Venda <- as.Date(Dias_Vendas$Data_da_Venda, format = "%d/%m/%y")
Dias_Vendas$Data_da_Venda <- gsub("2020", "2019", Dias_Vendas$Data_da_Venda)
# Olhando depois de arrumado
Dias_Vendas

# Pais_Vendas
# Renomeando as colunas
colnames(Pais_Vendas)
Pais_Vendas <- Pais_Vendas %>% 
  rename(
    Vendas_Por = Vendas..em...,
    Receitas_Por = Receitas..em...,
    País = X.U.FEFF.País
  )
# Tirando simbolos para transformar as colunas corretamente
# Vendas_Por
Pais_Vendas$Vendas_Por <- gsub("[A-z$%.[:space:]]", "", Pais_Vendas$Vendas_Por)
Pais_Vendas$Vendas_Por <- gsub(",", ".", Pais_Vendas$Vendas_Por)
Pais_Vendas$Vendas_Por <- as.numeric(Pais_Vendas$Vendas_Por)
# Receitas
Pais_Vendas$Receitas <- gsub("[A-z$%.[:space:]]", "", Pais_Vendas$Receitas)
Pais_Vendas$Receitas <- gsub(",", ".", Pais_Vendas$Receitas)
Pais_Vendas$Receitas <- as.numeric(Pais_Vendas$Receitas)
# Receitas_Por
Pais_Vendas$Receitas_Por <- gsub("[A-z$%.[:space:]]", "", Pais_Vendas$Receitas_Por)
Pais_Vendas$Receitas_Por <- gsub(",", ".", Pais_Vendas$Receitas_Por)
Pais_Vendas$Receitas_Por <- as.numeric(Pais_Vendas$Receitas_Por)

# Olhando depois de arrumado
Pais_Vendas

# Gen_Com
# Renomeando as colunas
colnames(Gen_Com)
Gen_Com <- Gen_Com %>% 
  rename(
    Transacao = X.U.FEFF.Transação
  )
# Tirando simbolos para transformar as colunas corretamente

# Gen_Com$Data.de.Integralização
# arrumando para data
Gen_Com$Data.de.Integralização <- as.Date(Gen_Com$Data.de.Integralização, format = "%d/%m/%y")
Gen_Com$Data.de.Integralização <- gsub("2020", "2019", Gen_Com$Data.de.Integralização)

# Data.de.Compra
# separando em dias e horas
Gen_Com$Hora.da.Compra <- str_sub(Gen_Com$Data.de.Compra, start = 11 , end = 50)
Gen_Com$Data.de.Compra <- str_sub(Gen_Com$Data.de.Compra, start = 1 , end = 10)
# arrumando para data
Gen_Com$Data.de.Compra <- as.Date(Gen_Com$Data.de.Compra, format = "%d/%m/%y")
Gen_Com$Data.de.Compra <- gsub("2020", "2019", Gen_Com$Data.de.Compra)
# arrumando as horas
Gen_Com$Hora.da.Compra <- chron(times = Gen_Com$Hora.da.Compra)

# Data.de.Confirmação
# separando em dias e horas
Gen_Com$Hora.de.Confirmação.de.Compra <- str_sub(Gen_Com$Data.de.Confirmação.de.Compra, start = 11 , end = 50)
Gen_Com$Data.de.Confirmação.de.Compra <- str_sub(Gen_Com$Data.de.Confirmação.de.Compra, start = 1 , end = 10)
# arrumando para data
Gen_Com$Data.de.Confirmação.de.Compra <- as.Date(Gen_Com$Data.de.Confirmação.de.Compra, format = "%d/%m/%y")
Gen_Com$Data.de.Confirmação.de.Compra <- gsub("2020", "2019", Gen_Com$Data.de.Confirmação.de.Compra)
# arrumando as horas
Gen_Com$Hora.de.Confirmação.de.Compra <- chron(times = Gen_Com$Hora.de.Confirmação.de.Compra)


# Per_Affi
# Renomeando as colunas
colnames(Per_Affi)
Per_Affi <- Per_Affi %>% 
  rename(
    Afiliado = X.U.FEFF.Afiliado
  )
# Tirando simbolos para transformar as colunas corretamente
# Vendas_Por
Per_Affi$Receita <- gsub("[A-z$%.[:space:]]", "", Per_Affi$Receita)
Per_Affi$Receita <- gsub(",", ".", Per_Affi$Receita)
Per_Affi$Receita <- as.numeric(Per_Affi$Receita)
# verificando
Per_Affi
# Rev_Affi
# Renomeando as colunas
colnames(Rev_Affi)
Rev_Affi <- Rev_Affi %>% 
  rename(
    Afiliado = X.U.FEFF.Afiliado
  )
# Tirando simbolos para transformar as colunas corretamente
# Vendas_Por
Rev_Affi$Valor.Pago <- gsub("[A-z$%.[:space:]]", "", Rev_Affi$Valor.Pago)
Rev_Affi$Valor.Pago <- gsub(",", ".", Rev_Affi$Valor.Pago)
Rev_Affi$Valor.Pago <- as.numeric(Rev_Affi$Valor.Pago)
#Rev_Affi
Rev_Affi
# Criando duas tabelas com os Afiliados e sem os afiliados
Gen_Com$Comissão.do.Afiliado
count(Gen_Com$Comissão.do.Afiliado)
Com_Afiliados <- Gen_Com %>% filter(Comissão.do.Afiliado != "NA")
Com_Afiliados
Com_Sem.afi <- Gen_Com %>% anti_join(Com_Afiliados, by = "Transacao")

dim(Com_Sem.afi)
dim(Com_Afiliados)
dim(Gen_Com)

mean(Com_Afiliados$Comissão.do.Afiliado)
# Olhando depois de arrumado
Gen_Com
mean(table(Gen_Com$Data.de.Compra))
Data_compra <- as.data.frame(table(Gen_Com$Data.de.Compra))
Data_compra2 <- as.data.frame(table(Com_Afiliados$Data.de.Compra))
Data_compra3 <- as.data.frame(table(Com_Sem.afi$Data.de.Compra))
Data_compra <- Data_compra %>% left_join(Data_compra2, by = "Var1")
Data_compra <- Data_compra %>% left_join(Data_compra3, by = "Var1")
Data_compra <- Data_compra %>% 
  rename(
    Freq.C = Freq.x,
    Freq.S = Freq.y,
)
Data_compra
mean(Data_compra$Freq.C, na.rm = TRUE)
mean(Data_compra$Freq.S, na.rm = TRUE)
# criando os csv arrumados
str(Data_compra)
# Grafico para basear oque será feito no Dashboard no Power BI
graf1 <- ggplot(Gen_Com, aes(x=Data.de.Compra, fill = Data.de.Compra) ) + geom_histogram(binwidth= 1, stat = "count", color = "black" ) + scale_fill_grey(name = "Dias")+ labs(title="Vendas no Periodo de 08 de Agosto à 16 de Setembro" ,x= "Dias" , y = "Quantidade de Vendas")
graf1 + geom_hline(yintercept= 39.78571 , color= "red", show.legend = "Média",linetype="dashed") + theme_classic()+ scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80,90,100,110,120,130,140), limits = c(0,140))

Per_Affi <- Per_Affi[,c(1,2,3,4,7)]
Per_Affi[,6] <- Per_Affi[,5] / Per_Affi[,2]
Per_Affi <- Per_Affi %>% 
  rename(
    ReceitaxClique = Receita.1,
)
sum(Per_Affi$Cliques)

# outras informações que pode ser uteis para explicações
# vendas por dia
S_Dias = 0

D20190808 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-08")
S_Dias[1] = sum(D20190808$Minha.Comissão)

D20190809 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-09")
S_Dias[2] = sum(D20190809$Minha.Comissão)

D20190810 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-10")
S_Dias[3] = sum(D20190810$Minha.Comissão)

D20190811 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-11")
S_Dias[4] = sum(D20190811$Minha.Comissão)

D20190812 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-12")
S_Dias[5] = sum(D20190812$Minha.Comissão)

D20190813 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-13")
S_Dias[6] = sum(D20190813$Minha.Comissão)

D20190814 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-14")
S_Dias[7] = sum(D20190814$Minha.Comissão)

D20190815 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-15")
S_Dias[8] = sum(D20190815$Minha.Comissão)

D20190816 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-16")
S_Dias[9] = sum(D20190816$Minha.Comissão)

D20190817 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-17")
S_Dias[10] = sum(D20190817$Minha.Comissão)

D20190818 <- Com_Afiliados %>% filter(Data.de.Compra == "2019-08-18")
S_Dias[11] = sum(D20190818$Minha.Comissão)


DF_SD = as.data.frame( cbind(Dias_Vendas$Data_da_Venda, S_Dias))
colnames(Gen_Com)
DF_SD <- DF_SD %>% 
  rename(
    Datas = V1
  )

DF_SD


# Feito isso podemos fazer um grafico da soma dos valores no periodo feito
G_Data = 0
# Comissão por dia
# não tem logica fazer, falta terminar a ideia
G20190808 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-08")
G_Data[1] = sum(G20190808$Minha.Comissão)

G20190809 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-09")
G_Data[2] = sum(G20190809$Minha.Comissão)

G20190810 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-10")
G_Data[3] = sum(G20190810$Minha.Comissão)

G20190811 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-11")
G_Data[4] = sum(G20190811$Minha.Comissão)

G20190812 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-12")
G_Data[5] = sum(G20190812$Minha.Comissão)

G20190813 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-13")
G_Data[6] = sum(G20190813$Minha.Comissão)

G20190814 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-14")
G_Data[7] = sum(G20190814$Minha.Comissão)

G20190815 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-15")
G_Data[8] = sum(G20190815$Minha.Comissão)

G20190816 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-16")
G_Data[9] = sum(G20190816$Minha.Comissão)

#G20190817 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-17")
#G_Data[10] = sum(G20190817$Minha.Comissão)

G20190818 <- Gen_Com %>% filter(Data.de.Compra == "2019-08-18")
G_Data[10] = sum(G20190818$Minha.Comissão)

G_Data
Gen_Data = as.data.frame(table(Gen_Com$Data.de.Compra)[1:10])

DF_GD = as.data.frame( cbind(Gen_Data$Var1, G_Data))
colnames(DF_GD)
DF_GD <- DF_GD %>% 
  rename(
    Datas = V1
  )

DF_GD

# criando as tabelas.
write.csv(Dias_Vendas,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Dias_Vendas.csv", row.names = FALSE)

write.csv(Form_Vendas,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Form_Vendas.csv", row.names = FALSE)

write.csv(Pais_Vendas,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Pais_Vendas.csv", row.names = FALSE)

write.csv(Per_Affi,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Per_Affi.csv", row.names = FALSE)

write.csv(Rev_Affi,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Rev_Affi.csv", row.names = FALSE)

write.csv(Gen_Com,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Gen_Com.csv", row.names = FALSE)

write.csv(Com_Afiliados,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Com_Afiliados.csv", row.names = FALSE)

write.csv(Com_Sem.afi,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/Com_Sem.afi.csv", row.names = FALSE)

write.csv(DF_GD,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/DF_GD.csv", row.names = FALSE)

write.csv(DF_SD,"G:/Github/Projetos Prontos/20191101 ADs/2 - Dados Preparados/DF_SD.afi.csv", row.names = FALSE)

#  utilizado as tabelas criadas para o dashboard no Power BI.