

library(mongolite)

getwd()
setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/PostWork7")




match<-read.csv("data.csv")
my_collection = mongo(collection = "match", db = "match_games")

my_collection$insert(match)


my_collection$count()

my_collection$find('{"Date":"2015-12-20"}')

my_collection$drop()

##El data empieza en 2019,por lo que no hay datos de ese momento.