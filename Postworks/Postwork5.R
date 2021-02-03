library(dplyr)
library(ggplot2)
library(fbRanks)
getwd()
setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/Postwork2")

Fut.com <- lapply(dir(), read.csv)

lapply(Fut.com, str)

View(Fut.com[[1]])


Fut.red<-lapply(Fut.com, select,Date, HomeTeam,HS,AwayTeam,AS)
SmallData = rbind(Fut.red[[1]],Fut.red[[2]],Fut.red[[3]])
colnames(SmallData) <- c("date", "home.team","home.score","away.team","away.score")



View(Fut.red[[1]])

setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/PostWork5")
write.csv(SmallData,'soccer.csv',row.names = FALSE)

listasoccer<-create.fbRanks.dataframes(scores.file="soccer.csv")

scores<-rank.teams(listasoccer=score)

