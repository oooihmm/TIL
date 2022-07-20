# Python crawling basic - beautifulSoup

## 1. 읽기 및 분석

```python
pip install beautifulsoup4

import urllib.request
from urllib.parse import quote_pluse # 한글 입력 받기
from bs4 import BeautifulSoup
```

### html 전체 읽기

```python
url = <url>
html = urllib.request.urlopen(url).read()
soup = BeautifulSoup(html, 'html.parser')
```

### 원하는 class만 추려서 가져오기

```
findClass = soup.find_all(class_<class>)
```

### 원하는 속성만 추려서 가져오기

```python
for i in findClass:
  print(i.attrs[<속성>])
```

### base url과 plus url

- base url  
  : url에서 뼈대가 되는 부분  
  (ex) 'https://github.com/'

- plus url
  : base url에 어떤 내용을 더해 특정한 주소를 가리킴  
  (ex) 'https://github.com/**oooihmm**',  
  'https://github.com/**blissray**'

### URL 입력받기

```python
baseURl = 'https://github.com/'
plusURL = input('아이디를 입력하세요')
url = baseURL + plusURL
```

### 한글을 아스키코드로 바꾸기

`quote_plus(변수명)`

---

## 2. url에서 이미지 다운로드

```python
import usllib.parse #한글 입력 받기
from urllib.request import urlopen
from urllib.request omport quote_plus
from bs4 import BeautifulSoup
```

```python
baseURl = <url>
plusURL = input('입력하세요')
url = baseURL + quote_plus(plusURL)

html = urlopen(url).read()
soup = BeautifulSoup(html, 'html.parser')
<class> = soup.find_all(class_='클래스명')

n = 1
for i in <class>:
  imgURL = i[<이미지 url이 저장된 속성>]
  with urlopen(imgURL) as f:
    with open('폴더 경로' + plusURL + str(n) + '확장자', 'wb') as h:
    # 저장시 이름 지정
      img = f.read()
      h.write(img)
  n += 1

print(다운로드 완료)
```
