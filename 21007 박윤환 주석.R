#install.packages('jsonlite')#패키지 다운로드
#install.packages('wordcloud2')#패키지 다운로드
library('jsonlite') ##라이브러리 불러오기
library(wordcloud2) ##라이브러리 불러오기

jsonList = fromJSON('시청 기록.json') ##json을 List형태로 만든다
listSubtitles<-jsonList["subtitles"] 

시청채널<-list()

for (i in 1:dim(listSubtitles)[1]) { ## for문 으로 i 값 측정된 자료 로 1부터 i만큼 반복
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name) 
}

채널시청수<-table(unlist(시청채널))

wordcount2 <- head(sort(채널시청수, decreasing=T),1000)# 빈도수가 높은것 부터 1000개 나열해서 나타냄
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle")#워드클라우드 생성 모양 = 원
