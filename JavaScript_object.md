# JavsScript object

## 1. 객체

정리정돈의 수단  
-> 서로 연관된 함수 또는 변수를 그룹핑하여 정돈

### 객체의 기본 문법

```javascript
var <object name> = {
 key : value
}
```

### 객체의 추가

`<object name>.key = "value"`
`<object name>[key] = "value"`

### 객체와 반복문

```javascript
for(var key in <object name>){실행문}
```

### 객체와 메소드

```javascript
<object name>.<method name> = function(매개변수){실행문}
```

---

## 2. 파일로 정리

1. 모든 파일에 공통으로 들어가는 코드를 복사하여 .js 파일 생성  
   (단, `<script></script>`코드가 들어가지 않도록 함.)
2. 모든 파일에서 공통된 코드를 지움
3. `<script src="파일명.js"></script>` 작성
