# HTML 기초

## 1. 개요

`HyperText Markup Language`
-> 하이퍼텍스트(=링크)를 가장 중요한 특징으로 하는 마크업이라는 형식을 가진 컴퓨터 프로그래밍 언어

웹브라우저에 표시되는 웹페이지를 만들어달라고 컴퓨터에게 요청하는 언어

> 사람 <- (약속 == HTML) -> 웹브라우저

`<name>.html` -> 확장자

웹브라우저를 통해서 파일에 담겨있는 내용이 웹페이지로 만들어져 화면에 표시됨

> html : editer / 웹브라우저 : viewer

---

## 2. 문서의 작성

### 태그와 속성

`태그` : <시작 태그>원하는 구간</닫히는 태그>

`속성` : 시작 태그 뒤에 작성, 속성의 이름에 따라 그 기능이 정해져있음.

태그는 중첩하여 사용할 수 있음

### 리스트

`리스트 : <li>내용</li>`

```
ol : ordered list
ul : unordered list
```

리스트 밖에 `<ol></ol>` 또는 `<ul></ul>`을 사용하여 특성을 나타냄

---

## 3. 문서의 구조

### head와 body

`<head>내용</head>`: 웹브라우저 외부에서 문서의 정보를 알려주는 부분

-> 안에 `<title></title>`, `<meta>` (속성 : charset, name, content) 등을 중첩하여 사용

`<body>내용</body>` : 웹브라우저 내부에 나오는 본문

head와 body는 `<html></html>` 태그로 감싸야 함

### DOCTYPE (Document type declaration)

문서의 맨 위에 `<!DOCTYPE html>` 입력 -> 문서 선언

브라우저에게 이 문서가 어떤 표준을 따르고 있는지를 선언함

---

## 4. 기본 문법

`<h1>내용</h1>` : 제목, 1~6 크기 존재

`<strong>내용</strong>` : 진하게

`<p>내용</p>` : 단락

`내용<br>` : 줄바꿈 -> 한 줄 띄움

`<a href=“링크”>내용</a>` : 하이퍼링크 사용

| 관련 속성        | 설명                      |
| ---------------- | ------------------------- |
| target=“\_self”  | 원래 창에서 URL로 이동    |
| target=“\_blank” | 새 창을 띄워서 URL로 이동 |
| title="도움말"   | 도움말 작성               |

`<img src=“이미지 파일명”>` : 이미지 삽입

| 관련 속성         | 설명                                     |
| ----------------- | ---------------------------------------- |
| width=“pixel”     | 이미지의 너비 지정                       |
| height=“pixel”    | 이미지의 높이 지정                       |
| alt=“이미지 이름” | 이미지 파일이 깨질 경우 나타날 대체 설명 |
| title=“도움말”    | 도움말 작성                              |

---

## 5. 표

### table

`<table>테이블 행</table>` : table 지정

| 관련 속성     | 설명        |
| ------------- | ----------- |
| border=“두께” | 테두리 설정 |

`<td>항목</td>` : table data

`<tr>같은 행에 속하는 데이터</tr>` : table row

| 관련 속성      | 설명                             |
| -------------- | -------------------------------- |
| rowspan=“숫자” | 숫자만큼 행을 병합 (세로로 병합) |
| colspan=“숫자” | 숫자만큼 열을 병합 (가로로 병합) |

### table의 구조

```
<table>
<thead></thead> : table의 가장 윗부분에 위치하는 내용
<tbody></tbody> : table의 중간에 위치하는 내용
<tfoot></tfoot> : table의 가장 아랫부분에 위치하는 내용
</table>
```

> table > head / body / foor > `<tr></tr>` > `<td></td>`