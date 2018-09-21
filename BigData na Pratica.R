#01 - Big data Anaytics
setwd("C:/Users/BI/Documents/Data Science - Curso/RFundamentos_git/R_Cap05")

#pacote quantmod = para analise financeira

#Instalar pacotes

install.packages('quantmod')
install.packages('xts')
install.packages('moments')
library(quantmod)
library(xts)
library(moments)

#Seleção do perio de analise
startDate = as.Date('2016-01-21')
endDate = as.Date('2016-06-21')

#Download dos dados do periodo
?getSymbols ##coleta dados de varias fontes diferentes
getSymbols('PETR4.SA', src = 'yahoo', from = startDate, to = endDate)

#checando o tipo de dado retornado --- objeto xts = serie temporal
class(PETR4.SA)
is.xts(PETR4.SA)

head(PETR4.SA)

#Analisando os dados de fechamento

PETR4.SA.CLose<- PETR4.SA[,'PETR4.SA.Close']
is.xts(PETR4.SA.CLose)
?Cl

head(Cl(PETR4.SA), 5)

#Plotar gafico da petrobras
#candle chart

candleChart(PETR4.SA)

#Plot de fechamento

plot(PETR4.SA.CLose, main = ' Fechamento diario das ações',
     col='red', xlab = 'Data', ylab = 'Preço', major.ticks = 'month', minor.ticks = FALSE)

# Adicionado as bandas de bollinger ao gráfico, com média de 20 períodos e 2 desvios
# Bollinger Band
# Como o desvio padrão é uma medida de volatilidade, 
# Bollinger Bands ajustam-se às condições de mercado. Mercados mais voláteis, 
# possuem as bandas mais distantes da média, enquanto mercados menso voláteis possuem as
# bancas mais próximas da média
?addBBands
addBBands(n = 20, sd = 2)
addBBands(n = 10, sd = 2)

#Calculando os logs diarios
?log

PETR4.SA.ret<-diff(log(PETR4.SA.CLose), log = 1)

# Remove valores NA na prosição 1
PETR4.SA.ret <- PETR4.SA.ret[-1] 

# Plotar a taxa de retorno
plot(PETR4.SA.ret, main = "Fechamento Diário das Ações da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno", major.ticks = 'months',
     minor.ticks = FALSE)


statNames<-c('Mean', "std Deviation", 'Skewness', 'Kurtosis')
PETR4.SA.stats<-c(mean(PETR4.SA.ret), sd(PETR4.SA.ret),skewness(PETR4.SA.ret),kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats)<-statNames
PETR4.SA.stats

#salvando os dados em um arquivo .rds - arquivo binario
getSymbols('PETR4.SA', src = 'yahoo')
saveRDS(PETR4.SA, file = 'PETR4.SA.rds')#Salva os dados em formato rds
Ptr=readRDS('PETR4.SA.rds')
dir()
head(Ptr)
