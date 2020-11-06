# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요

install.packages("stringi") #stringi 패키지 다운로드 

getwd()  # 외부 파일 연결 ?
install.packages("wordcloud2")   #wordcloud2라는 패키지 다운로드 
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271') #자바 파일로 열기 ?
library(KoNLP)    # 열기 
library(wordcloud2)    #열기

useSejongDic() 

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8")  #잠이 오질 않네요 txt 파일 검토 
텍스트파일내용 <- readLines(텍스트파일자체) #txt파일 한줄한줄 읽기
close(텍스트파일자체)   # 잘 모르겟음

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F) # 잘 모르겟음
명사만 <- unlist(명사만)# 잘 모르겟음

head(명사만, 30)# 잘 모르겟음

중복횟수 <- table(명사만) # 잘 모르겟음

head(sort(중복횟수, decreasing = T), 30)# 잘 모르겟음

wordcount2 <- head(sort(중복횟수, decreasing=T),30)# 잘 모르겟음
wordcloud2(wordcount2,gridSize=10,size=10,shape="circle")# 잘 모르겟음