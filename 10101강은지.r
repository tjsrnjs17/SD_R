#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite')#검색한 기록
library(wordcloud2) #단어텍스트

jsonList = fromJSON('시청 기록.json') #함수는 JSON 형 데이터를 R에서 헨들링 할 수 있도록 한다.
listSubtitles<-jsonList["subtitles"] #검색기록

시청채널<-list() 

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)#시청한 채널
} #반복

채널시청수<-table(unlist(시청채널))#함수를 통해 리스트 자료형을 깨주면 이러한 조작이 한결 편해진다.

wordcount2 <- head(sort(채널시청수, decreasing=T),40)
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle")