install.packages('jsonlite')   #jsonlite 패키지 설치
install.packages('wordcloud2') #wordcloud2 패키지 설치
library('jsonlite') #jsonlite 불러오기
library(wordcloud2) #worldcloud2 불러오기

jsonList = fromJSON('시청 기록.json') #json 파일로 바꾼 시청 기록 불러오기
listSubtitles<-jsonList["subtitles"] #listSubtitles 변수에 subtitles 저장 

시청채널<-list() #list를 시청채널에 저장

for (i in 1:dim(listSubtitles)[1]) { #1열로 listSubtitles 메트릭스 생성
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)  
}  #1씩 추가하며 시청채널에 추가

채널시청수<-table(unlist(시청채널)) #시청채널의 list를 해제 후 를 채널시청수에 빈도수 별 저장

wordcount2 <- head(sort(채널시청수, decreasing=T),40) # 시청수가 가장 많은 40개 뽑기
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle") # 워드클라우드 그래픽 설정 
