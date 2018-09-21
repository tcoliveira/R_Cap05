#Importando outros softwares estatisticos

install.packages('haven')
library(haven)

#Sas
vendas<- read_sas('http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/vendas.sas7bdat')
?read_sas
class(vendas)
vendas
str(vendas)

#Stata
df_stata<- read_dta('http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/mov.dta')
class(df_stata)
str(df_stata)
#Convert values in Date column to dates
df_stata$Date<- as.Date(as_factor(df_stata$Date))
plot(df_stata)

#SPSS
pessoas<- read_sav('http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/pessoas.sav')
class(df_stata)
str(df_stata)

install.packages('foreign')
library(foreign)
# Stata
florida <- read.dta("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/florida.dta")
tail(florida)
class(florida)
?heaven

# SPSS
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp

dados <- read.spss("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/international.sav")
class(dados)
head(dados)
df <- data.frame(dados)
df
head(df)


# Criando um boxplot
boxplot(df$gdp)
