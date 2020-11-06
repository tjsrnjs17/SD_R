# jdk 받고   
#콘솔창에 
#install.packages("renites")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요

install.packages("stringi")

getwd()
install.packages("wordcloud2") #
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271')
library(KoNLP) #사전을 통해 문서에 포함된 품사를 분석해 주는 기능
library(wordcloud2) #wrodcloud를 만들어 주는 코드의 묶음

useSejongDic() 

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8")
텍스트파일내용 <- readLines(텍스트파일자체)
close(텍스트파일자체)

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F)
명사만 <- unlist(명사만) #명사만 불러옴

head(명사만, 30)

중복횟수 <- table(명사만) 

head(sort(중복횟수, decreasing = T), 30) #중복되는 명사수를 알려준다.

wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=10,size=1,shape="circle") #글씨의 크기,모양을 설정