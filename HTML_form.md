# HTML form 태그

## 1. 개요

`form` : 사용자가 입력한 것들을 서버로 전송할 때 사용

`<form action=“주소”></form>` : action에서 받은 주소로 전송
|관련 속성|설명|
|---|---|
|method=“ ”|정보의 전달 방식을 지정|
|autocomplete=“on”|자동완성기능 on|
|enctype = “multipart/form-data”|파일을 업로드 받을 시 설정|

### method 속성

`method=“”` : 정보의 전달 방식을 지정
|메소드 방식|설명|
|---|---|
|get|url로 전달 -> 비밀번호 등이 노출될 우려 있음 (기본 설정)|
|post|url이 아닌 방식으로 숨겨서 전달 -> form 사용시 주로 사용|

---

## 2. input

`<input>` : 사용자가 입력하는 내용을 받음 (한 줄)

| 관련 속성            | 설명                                                             |
| -------------------- | ---------------------------------------------------------------- |
| type=“ ”             | input창의 type을 결정                                            |
| id=“ ”               | input창의 id를 지정하여 label과 연결시킴                         |
| name=“ ”             | input창의 이름을 정해줌                                          |
| placeholder=“ ”      | input창에 도움말을 작성                                          |
| autocomplete=“off”   | 자동완성기능 off                                                 |
| autofocus            | 사용자의 focus가 해당 input창에 가도록 함                        |
| checked              | (ratio, checkbox에서) 기본 선택 값을 지정                        |
| value=“ ”            | (text/password에서) 기본 입력값을 지정 / 서버에 전달할 내용 작성 |
| required             | 필수적으로 입력해야만 제출이 되도록 설정                         |
| pattern=”정규표현식“ | 정규표현식이 나타내는 조건을 만족해야 제출이 되도록 설정         |

### type 속성

`type=“ ”` : input창의 type을 결정

| 타입 종류 | 설명                                                         |
| --------- | ------------------------------------------------------------ |
| text      | text를 입력받음                                              |
| password  | 비밀번호 등을 보이지 않게 입력받음                           |
| summit    | 서버에 전송                                                  |
| ratio     | 동그라미 선택창(단일선택만 가능)                             |
| checkbox  | 체크박스(중복선택 가능)                                      |
| button    | 버튼(단독 사용 X, 자바스크립트를 이용하여 기능 얻음)         |
| reset     | 재설정                                                       |
| hide      | 모종의 이유로 UI 없이 어떤 값을 서버에 전송하고 싶을 때 사용 |
| file      | 파일 업로드                                                  |
| date      | 날짜 입력받음                                                |
| month     | 연도‧월 입력받음                                             |
| week      | 연도‧주 입력받음                                             |
| time      | 연도‧시간 입력받음                                           |
| email     | 이메일 입력받음                                              |
| tel       | 전화번호 입력받음                                            |
| url       | url 입력받음                                                 |
| search    | 검색창                                                       |
| number    | 숫자만 입력받음(min, max 지정 가능)                          |
| range     | 연속적인 값을 나타내어 입력받음(min, max 지정 가능)          |

---

## 3. 그 외 문법

### textarea

`<textarea>(기본입력값)</textarea>` : 사용자가 입력하는 내용을 받음 (여러줄)

| 관련 속성 | 설명             |
| --------- | ---------------- |
| cols=" "  | 세로의 크기 설정 |
| rows=" "  | 가로의 크기 설정 |

### select

`<select name=“”>` : 선택창 (옵션을 스크롤해서 원하는 항목 선택)

```
<select name=“name”>
<option value=“서버에 전송할 내용”>사용자가 볼 내용</option>
...
<option value=“서버에 전송할 내용”>사용자가 볼 내용</option>
</select>
```

### label

`<label for=“”>레이블명</lebel>` : for에 입력된 것과 동일한 id를 갖는 input버튼을 가리킴

`<label><input></label>` 로 중첩하여 label과 input을 연결할 수도 있음
