#install.packages('jsonlite')
#install.packages('wordcloud2')
#library('jsonlite')
#library(wordcloud2) 

jsonList = fromJSON('시청 기록.json')#json파일 시청기록을 가져온다 이것이 jsonlist이다
listSubtitles<-jsonList["subtitles"]#subtitles에 시청기록을 가져오는것

시청채널<-list()

for (i in 1:dim(listSubtitles)[1]) {#dim(listSubtitles)[1])일떄 까지 반복
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)#listsuptitles의 이름은 시청채널에 추가
}

채널시청수<-table(unlist(시청채널))#시청채널 리스트에 빈도가 채널시청수이다 

wordcount2 <- head(sort(채널시청수, decreasing=T),100)
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle")






