#!C:\Program Files (x86)\Programming\VS_folder\VS SDK\Python37_64\python.exe
# -*- coding: UTF-8 -*-

import cgi;
import cgitb;
cgitb.enable();
import sys
import codecs
sys.path.append('C:\\Users\\You_Sun_Kwon\\AppData\\Roaming\\Python\\Python37\\site-packages')
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())

print("Content-type: text/html;charset=utf-8\r\n")
print("<html>")
print("<head>")
print("\t<title>시청기록</title>")
print("</head>")
print()
print("<body>")
print("\t<h1>시청기록</h1>")


import os
import site
import pymysql
import re
import operator

from urllib.parse import unquote
cookie_string = os.environ.get('HTTP_COOKIE').split(';')[0]
id =unquote(cookie_string.split('=')[1])

def numEX(result):#숫자만 추출해서 리스트로 리턴
    resultS = str(result)
    resultD = re.findall("\d+",resultS)
    return resultD


con = pymysql.connect(user="exroot",password="",host="localhost",db='wbflix', charset='utf8')#서버 연결 정보
cursor = con.cursor()#서버 연결


#사용자가 본 영화 목록 불러오기
resultTuple=()
sql = "SELECT viewed FROM user WHERE id='"+ id+"'";
cursor.execute(sql)
result = cursor.fetchall()
#print(numEX(result))
for i in numEX(result):
    sql = "SELECT * FROM movie_data WHERE idx ="+i;
    cursor.execute(sql)
    result = cursor.fetchall()
    resultTuple+=result#하나의 튜플로
    resultStr=str(resultTuple)#count 함수 쓰기위해
for i in resultTuple:
    print("<br>")
    print(str(i))
    print("</br>")

con.commit() 
con.close()#서버 연결 종료

print("</body>")
print("</html>")

