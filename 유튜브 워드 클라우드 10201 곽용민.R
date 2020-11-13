#install.packages('jsonlite')
#install.packages('wordcloud2')

library('jsonlite')
library(wordcloud2) 

jsonList = fromJSON('시청 기록.json') #함수는 JSON 형 데이터를 R에서 헨들링 할 수 있도록 한다.
listSubtitles<-jsonList["subtitles"] #jsonList에 있는 정보들을 listSubtitles에 넣는다.

시청채널<-list() #list()를 시청채널에 넣는다

for (i in 1:dim(listSubtitles)[1]) { #i가 1부터 dim(listSubtitles)[1]일때 까지 반복함.
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name) #i의 증가함에 따라 그에 맞는 name의 데이터를 가져온다.
}
채널시청수<-table(unlist(시청채널)) #table(unlist(시청채널))을 채널시청수에 넣는다.

wordcount2 <- head(sort(채널시청수, decreasing=T),10) #Viewer에 출력시킬 채널이름의 수를 wordcount2에 넣는다.
wordcloud2(wordcount2,gridSize=200,size=1,shape="circle")#shape는 모양, size는 Viewer의 글씨 크기, gridsize는 viewer에 출력되는 공간의 크기 
