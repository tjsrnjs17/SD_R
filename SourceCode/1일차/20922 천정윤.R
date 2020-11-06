# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요

install.packages("stringi")

getwd() #현재 저장된 작업경로
install.packages("wordcloud2") #패키지 설치
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271') #':\\program files\\java\\jdk1.8.0_191')
library(KoNLP) #라이브러리 불러오기
library(wordcloud2)#라이브러리 불러오기

useSejongDic() #한국어 사전 불러오기

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8") #노래.txt 파일 utf-8 형식으로 불러오기
텍스트파일내용 <- readLines(텍스트파일자체) # 줄 별로 읽기
close(텍스트파일자체)#파일 종료

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F) #명사만 고르기
명사만 <- unlist(명사만)#데이터 백터화

head(명사만, 30)#30개만 출력

중복횟수 <- table(명사만) #위의 '명사만'이라는 변수(데이터)를 같은단어를
#기준으로 합쳐서 몇번 중복됬는지 계산

head(sort(중복횟수, decreasing = T), 30) #빈도수가 많은 순으로 30개 출력
#워드클라우드 생성
wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=10,size=1,shape="circle")