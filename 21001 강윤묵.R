#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite') #파일 경로 따라가기 !
library(wordcloud2) #파일 경로 따라가기 !

jsonList = fromJSON('시청 기록.json') #파일 내용을 변수로 대입 // 찾아본 결과: 함수는 JSON 형 데이터를 R에서 헨들링 할 수 있도록 한다.
listSubtitles<-jsonList["subtitles"] # 변수 대입

시청채널<-list() # 대이터 집합체 대입

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)
} #

채널시청수<-table(unlist(시청채널)) #값들의 빈도수 

wordcount2 <- head(sort(채널시청수, decreasing=T),2000) #상위 6개 관측치 미리보기를 변수에 대입
wordcloud2(wordcount2,gridSize=30,size=1,shape="circle") # 워드클라우드 생김새정하기..?