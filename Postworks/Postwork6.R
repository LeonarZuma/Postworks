getwd()
setwd("C:/Users/leona/Documents/Bedu/Tarea/Postworks/PostWork6")

library(ggplot2)
library(dplyr)
library(lubridate)

match.data <- read.csv("match.data.csv", header = TRUE)
str(match.data)

match.time <- match.data %>%
  mutate(date = as.Date(date))

match.time$date <- as.Date(match.time$date, format="%Y-%m-%d")

#match.time$Year.Month <- format(match.data$date, '%Y-%m')

#Summaryze by month, we used this code below
match.month<-month(match.time$date)
#I created a column with the month value to group

match.time <- match.time %>%
  mutate(month = month(date))
match.time <- match.time %>%
  mutate(year = year(date))
#I created a column for sum goals
match.time$sumagoles<-match.time$home.score+match.time$away.score

#Mean per month
mon.mean <- match.time %>%
group_by(month,year) %>%
  summarise(promedio = mean(sumagoles))
mon.mean<-as.data.frame(mon.mean)
#Filter years without 2020
mon.mean<-filter(mon.mean, mon.mean$year<2020)
#Setting the TimeSeries
Match.ts <- ts(mon.mean[, 3],  freq = 12)


plot(Match.ts, 
     main = "Match Goals TS", 
     xlab = "Tiempo",
     sub = "Enero de 1985 - Diciembre de 2019")

