#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite')
library(wordcloud2) ##library(wordcloud2)불러오기

jsonList = fromJSON('시청 기록.json') ##포맷의 데이터로 변환
listSubtitles<-jsonList["subtitles"] 

시청채널<-list() 리스트로 채널이름

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name) #listSubtitles[i]로 저장된 파일값 측정후 시청채널로 추가
}
##append 1이라 칠 떄(1,2,3)
채널시청수<-table(unlist(시청채널)) ##데이터 빈도수 측정

wordcount2 <- head(sort(채널시청수, decreasing=T),40) ##빈도수 높은것부터 위로
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle") ##워드클라우드 생성 모양 =원