#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite') #jsonlite 패키지 설치 및 불러오기
library(wordcloud2) #wordcloud2 패키지  설치 및 불러오기

jsonList = fromJSON('시청 기록.json') #JSON형 데이터를 R언어에서 사용 가능하게 함
listSubtitles<-jsonList["subtitles"] #jsonList의 subtitles를 변수에 저장

시청채널<-list() #'시청채널'이라는 리스트 만들기

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name) #시청채널을 변수에 정리하기
}

채널시청수<-table(unlist(시청채널)) #'시청채널' 리스트를 해체하고 중복되는 수 구하기

wordcount2 <- head(sort(채널시청수, decreasing=T),40) #빈도 수 상위 40개 출력하기
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle") #워드 클라우드 글씨 크기, 모양 설정