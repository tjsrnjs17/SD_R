# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요
install.packages("stringi")

getwd() #불러옴
install.packages("wordcloud2") #다운
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271') #파일 
library(KoNLP) 
library(wordcloud2)

useSejongDic() 

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8") #텍스트파일자체로 받는다
텍스트파일내용 <- readLines(텍스트파일자체) #텍스트파일 내용으로 받는다
close(텍스트파일자체)

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F) #명사만 으로받는다
명사만 <- unlist(명사만) # 명사만으로 받는다

head(명사만, 30)

중복횟수 <- table(명사만) # 중복횟수로 받는다

head(sort(중복횟수, decreasing = T), 30)

wordcount2 <- head(sort(중복횟수, decreasing=T),30) #워드카운터로 받는다
wordcloud2(wordcount2,gridSize=10,size=1,shape="circle") #워드카운터2로 받는다 