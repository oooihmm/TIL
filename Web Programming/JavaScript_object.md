# JavsScript object

## 1. 객체

정리정돈의 수단  
-> 서로 연관된 함수 또는 변수를 그룹핑하여 정돈

**프로퍼티** : 객체의 고유한 속성  
**메소드** : 객첵 가질수 있는 함수

### 객체의 유형

| 객체          | 예시                      | 설명                                           |
| ------------- | ------------------------- | ---------------------------------------------- |
| 코어 객체     | Array, Date, String, Math | 웹 페이지나 웹 서버 응용프로그램 어디서든 사용 |
| HTML DOM 객체 | HTML 태그들을 객체화      | HTML 페이지의 내용과 모양을 제어               |
| BOM           | window, histroy, screen   | 브라우저 관련 객체                             |

주요 객체  
`document`, `DOM` : 태그 삭제, 자식 태그 추가 등  
`window` : 웹브라우저 자체를 제어  
`ajax` : 웹페이지를 리로드하지 않고 정보를 변경  
`cookie` : 웹페이지가 리로드되어도 현재 상태 유지  
`offline web application` : 인터넷에 끊겨도 동작하는 웹페이지 제작  
`webRTC` : 화상통신 웹 앱  
`speech` : 사용자의 음성을 인식해 음성으로 정보 전달  
`webGL` : 3차원 그래픽  
`webVR` : 가상현실

### 객체의 기본 문법

```
let 변수명 = new 객체명();
```

### 객체 접근

객체명.프로퍼티 = 값; // 객체의 속석 값 변경
변수명 = 객체명.프로퍼티; //객체의 속성 값 알아내기
객체명.메소드(매개변수); //객체의 메소드 호출

### 사용자 객체 만들기

let 변수명 = new 객체명();  
변수명.속성 = 값;
변수명[속성] = 값;

### 사용자 객체에 메소드 만들기

```js
function 함수명(매개변수) {
  실행문;
}
변수명.메소드명 = 함수명; //메소드 이름을 함수 이름으로 초기화
```

`this` : 이 객체를 뜻함  
`this.속성` : 이 객체의 특정 속성(프로퍼티)  
-> 객체의 멤버 변수인 프로퍼티를 접근할 떄는 반드시 `this`를 사용

### 리터럴 표기법으로 객체 만들기

```js
let 객체명 = {
   프로퍼티 : 값, // 프로퍼티 생성 및 초기화
   프로퍼티 : 값, ...

   //메소드작성
   메소드명 : function(매개변수){실행 코드},
};
```

### 프로토타입으로 객체 만들기

```js
//생성자 함수 작성
function 함수명(매개변수) {
  this.프로퍼티 = 매개변수;

  //메소드 만들기
  this.메소드명 = function (매개변수) {
    실행코드;
  };
}

///객체 생성
let 변수명 = new 객체명(매개변수);
```

---

## 2. HTML DOM과 document

### DOM 객체

- DOM 객체 구분
  같은 HTML 태그가 여러개 있는 경우 **id 속성 값**으로 구분

  `document.getElementByID(idVal)`  
   -> DOM 트리에서 id 속성값이 idVal인 DOM 객체 값을 찾아 리턴.

  `let 변수명 = document.getElementByID(idVal)`  
   -> DOM 트리에서 id 속성값이 idVal인 DOM 객체를 찾아 변수가 가리키게 됨.

- DOM 객체의 innerHTML 프로퍼티  
   `innerHTML` : 시작 태그와 종료 태그 사이에 들어있는 HTML 콘텐츠를 나타내는 문자열 정보

- this  
   `this` : 객체 자기 자신을 가리키는 자바스크립트 키워드  
   -> 객체의 주소가 함수의 매개변수에 전달된다.

### document 객체

**document 객체** : HTML 문서의 전반적인 속성을 나타내고, 여러 메소드를 통해 전반적인 제어를 지원

- DOM 객체 찾기  
   `document.getElementsByTagName()` : 태그 이름으로 DOM 객체 찾기
  `document.getElementsByClassName()` : 클래스 이름으로 DOM 객체 찾기

- HTML 텍스트 추가  
   `document.write()` : 객체에 담긴 내용의 끝에 HTML 텍스트를 추가
  `document.wireln()` : 마지막에 한 칸 공백 포함

### HTML 문서의 동적 구성

- DOM 객체 동적 생성

```js
document.createElement("태그이름");
```

- DOM 트리에 삽입

```js
부모.appendChild(DOM객체); // DOM 객체를 부모의 마지막 자식으로 삽입
부모.insertBefore(DOM객체 [, 기준자식]);
//DOM 객체를 부모의 자식 객체 중 기준자식 앞에 삽입
```

- DOM 객체의 삭제

```js
떼어내고자하는자식객체.parentElement; // 부모 객체 알아내기
부모.remoceChild(떼어내고자하는자식객체); // 부모로부터 객체 떼어내기
```
