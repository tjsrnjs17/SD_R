# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요

getwd() # 저장된 경로 불러오기
install.packages("wordcloud2") #wordcloud2 패키지 설치
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271')
library(KoNLP) # KoNLP 라이브러리 불러오기  
library(wordcloud2) # wordcloud2 라이브러리 불러오기

useSejongDic() # 한글 사전 불러오기

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8") #텍스트 파일 불러오기
텍스트파일내용 <- readLines(텍스트파일자체) # 줄읽기
close(텍스트파일자체) 

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F) # 명사만 읽기
명사만 <- unlist(명사만) # 변수저장

head(명사만, 30) # 30개 출력(명사만변수)

중복횟수 <- table(명사만)  #중복횟수 계산(명사만변수)

head(sort(중복횟수, decreasing = T), 30) #많은 것 순으로 30개 출력

wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=10,size=1,shape="diamond") # 워드클라우드



