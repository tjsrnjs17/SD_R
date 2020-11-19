#어느 연도와 주에 가장 많이 움직였을지 막대그래프로

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


#그래프 생성
df %>% 
  group_by(week,year) %>%
  summarise(n = n()) %>%
  ggplot( aes(x=week, y = n)) +
  geom_bar(stat= "identity",fill="#9ecae1") +
  facet_grid(facets = year ~ .) +
  theme_ipsum_rc(grid="XY", axis_text_size=12, axis_title_size = 12)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  scale_x_continuous(breaks = c(1:52)) +
  labs(x = "week of year", y = "number of times tracked", title="Number of times tracked per week by Google Location")


#######################################################################################################################
#위치기록 json 파일 요약
n_count <- nrow(df) #전체 몇개의 위치가 기록
n_count

n_days <- df$date %>%
  n_distinct() 
n_days#몇일의 기록

n_avg_day <- round(n_count/n_days,2) #하루평균 몇개의 위치기록
n_avg_day

round(n_avg_day / 24,2) #시간당 몇개의 위치 기록
