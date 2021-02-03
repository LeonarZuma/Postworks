getwd()
library(dplyr)
setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/Postwork2")
dir()
#Parte 1
Fut.com <- lapply(dir(), read.csv)

#Parte 2
lapply(Fut.com, str)
View(Fut.com[[1]])
View(Fut.com[[2]])
View(Fut.com[[3]])
lapply(Fut.com, summary)
lapply(Fut.com, head)

#Parte 3
Fut.red<-lapply(Fut.com, select,Date, HomeTeam,AwayTeam,FTHG,FTAG,FTR)
lapply(Fut.red, str)

#Parte 4
Fut.red[[1]]<-mutate(Fut.red[[1]],Date = as.Date(Date))
Fut.red[[2]]<-mutate(Fut.red[[2]],Date = as.Date(Date))
Fut.red[[3]]<-mutate(Fut.red[[3]],Date = as.Date(Date))

class((Fut.red[[1]]$Date))
Fut.fin<-rbind(Fut.red[[1]],Fut.red[[2]],Fut.red[[3]])
str(Fut.red[[1]])
    
#Ayuda del Postwork 3
setwd("C:/Users/leona/Documents/Bedu/Data/Postworks/Postwork3/")
write.csv(Fut.fin,'Fut1720.csv')
 