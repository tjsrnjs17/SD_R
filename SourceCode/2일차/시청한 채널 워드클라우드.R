library('jsonlite')
library(wordcloud2) 

jsonList = fromJSON('시청 기록.json')
listSubtitles<-jsonList["subtitles"]

시청채널<-list()

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)
}

채널시청수<-table(unlist(시청채널))

wordcount2 <- head(sort(채널시청수, decreasing=T),40)
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle")
