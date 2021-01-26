getwd()
setwd("C:/Users/leona/Documents/Bedu/Data/")
futbol.1920 <- read.csv("SP1.csv")

suppressMessages(suppressWarnings(library(dplyr)))
ft.red<-subset(futbol.1920,select=c(FTHG,FTAG))

?table

#Ejercicio1
freq.FTHG<-table(ft.red$FTHG)
total<-length(ft.red$FTHG)
prob.FTHG<-0
for (i in 1:length(freq.FTHG)){
prob.FTHG[i]<-(freq.FTHG[i]/length(ft.red$FTHG))*100
}
prob.FTHG

#Ejercicio2
freq.FTAG<-table(ft.red$FTAG)
total<-length(ft.red$FTAG)
prob.FTAG<-0
for (i in 1:length(freq.FTAG)){
  prob.FTAG[i]<-round((freq.FTAG[i]/length(ft.red$FTAG))*100,4)
}
prob.FTAG

#Ejercicio 3
freq.FTHG
aux<-0
for(i in 0:6){
  aux<-(table(filter(ft.red,ft.red$FTHG==i)))
  for(j in 1:length(aux)){
    aux[j]<-round(aux[j]*100/total,4)
  }
  print(aux)
  data<-data.frame()
}
aux



