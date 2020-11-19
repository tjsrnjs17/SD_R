#방문한곳 지도에 표시

#install.packages('jsonlite') 
#'ggplot2'   'ggmap' 도 설치

library('jsonlite')
library(ggplot2)
library(ggmap)

jsonList = fromJSON('위치 기록.json')
df <- as.data.frame(jsonList)

register_google(key = 'OIzaSyCX9NQN4IdgcODUNgmyllCGcKKeUTMIteg')#구글지도를 이용하기위한 API키

지도중심 <- c(lon=128.25, lat=35.95)#zoom=7
불당동 <- c(lon=127.111519, lat=36.805677)#zoom=14
쌍용동 <- c(lon=127.13, lat=36.79)
두정동<- c(lon=127.142610, lat=36.833045)#zoom=13  #zoom=14

ggmap(get_googlemap(center = 쌍용동, zoom = 14, source='google', maptype='roadmap'))+# center 지도중심 /  zoom 지도 확대 배율
  geom_point(data=df, aes(x=locations.longitudeE7/ 1e7, y=locations.latitudeE7/ 1e7), size=0.5, alpha=0.2,color = "red")#size 점크기 /  alpha 점의 투명도
