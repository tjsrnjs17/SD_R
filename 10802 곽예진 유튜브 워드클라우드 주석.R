#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite')
library(wordcloud2) 

jsonList = fromJSON('시청 기록.json') # JSON형 데이터를 R에에서 핸들링할 수 있도록 함.
listSubtitles<-jsonList["subtitles"] # ["제목"] 데이터를 list 형식으로 변환하는 함수.

시청채널<-list()

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)
} # 시청채널과 주소를 삽입함

채널시청수<-table(unlist(시청채널)) # '시청채널'의 중복되는 원소를 하나씩만 남기고, 데이터의 빈도를 보여줌.

wordcount2 <- head(sort(채널시청수, decreasing=T),40) # 상위 40개의 채널(종류) 값을 출력함.
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle") # 글자의 간격, 크기, 모양을 설정함.