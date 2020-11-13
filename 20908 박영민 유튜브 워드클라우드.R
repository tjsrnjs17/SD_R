#install.packages('jsonlite') #jsonlite 설치
#install.packages('wordcloud2') #wordcloud2 설치
library('jsonlite') #jsonlite 불러오기
library(wordcloud2) #워드클라우드 불러오기 

jsonList = fromJSON('시청 기록.json') #json 포맷의 데이터를 R  dateframe으로 변환후 jsonlist에 저장
listSubtitles<-jsonList["subtitles"] #jsonList의 subtitles 를 listSubtitles에 저장

시청채널<-list() #시청채널 리스트생성

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)
}  #i가 listsubtitles[1]의 길이만큼 더해지고 시청채널 리스트안에 listsubtitles[[1][i]] 가 더해짐

채널시청수<-table(unlist(시청채널)) # 시청채널 리스트를 해체하고 그중에서 중복되는 단어 세기 

wordcount2 <- head(sort(채널시청수, decreasing=T),40 #빈도수가 높은 시청기록 40개 생성
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle") #워드클라우드 생성, 모양=원모양
install.packages('jsonlite') #jsonlite 설치
install.packages('wordcloud2') #wordcloud2 설치
