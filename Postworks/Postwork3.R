library(dplyr)
library(ggplot2)
#Lectura de datos e inicialización de variables principales
getwd()

setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/Postwork3")
dir()
Fut.com <- read.csv("Fut1720.csv")
Fut.com<-Fut.com[,-1]
total<-length(Fut.com$FTHG)

#PARTE I
#TABLAS DE FRECUENCIA RELATIVA
#Probabilidad de la casa
prob.FTHG<-table(Fut.com$FTHG)
for(i in 1:length(prob.FTHG)){
  prob.FTHG[i]<-round(prob.FTHG[i]*100/total,4)
}
prob.FTHG.df<-as.data.frame(prob.FTHG)

#Probabilidad del visitante
prob.FTAG<-table(Fut.com$FTAG)
for(i in 1:length(prob.FTAG)){
  prob.FTAG[i]<-round(prob.FTAG[i]*100/total,4)
}
prob.FTAG.df<-as.data.frame(prob.FTAG)

#Probabilidad conjunta
aux<-0
prob.con<-0
aux.goles<-select(Fut.com,FTHG,FTAG)
for(i in 1:9){
  aux<-table(filter(aux.goles,aux.goles$FTHG==(i-1)))
  for (j in 1:length(aux)) {
    aux[j]<-round(aux[j]*100/total,4)
  }
  aux<-as.data.frame(aux)
  prob.con<-rbind(prob.con,aux)
}
prob.con<-prob.con[-1,]
prob.con$FTHG<-as.numeric(as.character(prob.con$FTHG))
prob.con$FTAG<-as.numeric(as.character(prob.con$FTAG))

#PARTE II
#GRÁFICAS DE PROBABILIDAD
ggplot(prob.FTHG.df)+geom_bar(aes(Var1,Freq),stat = 'identity')
ggplot(prob.FTAG.df)+geom_bar(aes(Var1,Freq),stat = 'identity')
heatmap(as.matrix(prob.con))
