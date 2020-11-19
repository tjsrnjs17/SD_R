#특정 연도 이동 수단 

#install.packages('jsonlite') 
# 'ggplot2' 'tidyverse' 'anytime'  'hrbrthemes' 도 설치

library('jsonlite')
library(ggplot2)
library(tidyverse)
library(lubridate)
library(anytime)
library(hrbrthemes)


jsonList = fromJSON('위치 기록.json')
df <- as.data.frame(jsonList$location)


as.POSIXct(as.numeric(df$timestampMs)/1000, tz='GMT', origin='1970-01-01') -> df$time
as.Date(df$time) -> df$date
isoweek(df$date) -> df$week
isoyear(df$date) -> df$year


df$lat <- df$latitudeE7 / 1e7
df$lon <- df$longitudeE7 / 1e7

몇년도<-'2020'  #2019로 바꾸면 2019년에 이동한 수단 나옴 
loc3 <- with(df, subset(df, df$time > as.POSIXct(paste0(몇년도,'-01-01 0:00:01'))))
loc3 <- with(df, subset(loc3, df$time < as.POSIXct(paste0(몇년도,'-12-31 23:59:59'))))
activities <- loc3$activity

list.condition <- sapply(activities, function(x) !is.null(x[[1]]))
activities  <- activities[list.condition]

df3 <- do.call("bind_rows", activities)
main_activity <- sapply(df3$activity, function(x) x[[1]][1][[1]][1])
activities_2 <- data.frame(main_activity = main_activity, 
                           time = as.POSIXct(as.numeric(df3$timestampMs)/1000, origin = "1970-01-01"))

#그래프 생성
ggplot(activities_2, aes(x = main_activity, group = main_activity)) + 
  geom_bar(fill="#9ecae1")  + 
  guides(fill = FALSE) +
  scale_y_continuous(breaks= scales::pretty_breaks(n=6),expand=c(0,0), limits=c(0, 40000)) +
  theme_ipsum_rc(grid="Y", axis_text_size=10, axis_title_size = 12)+
  labs(
    x = "Activity",
    y = "Count",
    title = paste0("Main activities ",몇년도)
  )
#still 은 정지 상태
#Tilting 은 갑자기 기울기가 변했을때: 의자에서 일어나거나 폰을 들어 올렸을때

