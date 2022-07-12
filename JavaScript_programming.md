# JavaScript programming

`프로그래밍 언어`  
: 반복문, 조건문, 함수 등 사용가능

## 1. 조건문

```javascript
if (조건문) {
  실행문;
} else {
  실행문;
}
```

### 비교 연산자

a **`===`** b : 동등 비교 연산자  
a **`&lt;`** b : 부등호 (<)

### 조건문의 활용

`document.querySelector('id').value`
-> 해당 id를 가진 요소의 value값 가져옴

`this`.value
-> 자기 자신의 value값 가져옴

this, 변수 활용해서 중복 제거!

---

## 2. 반복문

```javascript
while(조건문){실행문}
else{실행문}
```

### 배열

```javascript
var <array name> = [a, b, c, d, ... , z];
```

index의 변경  
`<array name>.push(value)`

index의 활용  
`<array name>[number] = value`

배열의 길이 (요소의 개수)  
`<array name>.length`

---

## 3. 함수

```
function <function name>(매개변수){실행 코드}

<function name>(인자);
```

`return` : 함수 결과값 출력
