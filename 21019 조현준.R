install.packages("stringi") #stringi가 설치되지 않아 따로 설치해주었다.
getwd() #파일 불러오기
install.packages("wordcloud2") #워드클라우드 설치
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271')
library(KoNLP)  #라이브러리 불러오기
library(wordcloud2)

useSejongDic() #사전을 불러옴

텍스트파일자체<-file("애국가.txt", encoding = "UTF-8") #파일형식에 맞게 불러오기 
텍스트파일내용 <- readLines(텍스트파일자체) #줄 별로 읽게함 
close(텍스트파일자체)

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F)
명사만 <- unlist(명사만) #명사만 골라내기

head(명사만, 30) #명사 30개 나타냄

중복횟수 <- table(명사만) #명사가 몇 번 중복되었는지까지 나타냄

head(sort(중복횟수, decreasing = T), 30) #많이 쓰인 순으로 나타냄

wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=10,size=1,shape="star")  #워드클라우드의 형태 조작