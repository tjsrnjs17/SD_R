# jdk 받고   
#콘솔창에 
#install.packages("remotes")
#설치되면
#remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
#문서폴더에 잠이 오질 않네요.txt 파일 받아서 넣으세요



getwd()
install.packages("wordcloud2") 
install.packages("stringi") 
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_271')
library(KoNLP) #package안에 포함된 사전을 통해 문서에 포함된 품사를 분석해주는 기능
library(wordcloud2)#워드클라우드를 만들어주는 하나의 묶음!

useSejongDic() 

텍스트파일자체<-file("잠이 오질 않네요.txt", encoding = "UTF-8")
텍스트파일내용 <- readLines(텍스트파일자체)
close(텍스트파일자체) #파일불러와서 한줄씩 나타내기

명사만<-sapply(텍스트파일내용, extractNoun, USE.NAMES = F)
명사만 <- unlist(명사만) #명사만 불러옴

head(명사만, 30)

중복횟수 <- table(명사만) 

head(sort(중복횟수, decreasing = T), 30) #중복되는 명사수알려줌

wordcount2 <- head(sort(중복횟수, decreasing=T),30)
wordcloud2(wordcount2,gridSize=50,size=5,shape="circle")#옆에 뜬 글씨!!
