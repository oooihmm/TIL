# JavaScript programming

`프로그래밍 언어`  
: 반복문, 조건문, 함수 등 사용가능

## 1. 조건문

### if문

```javascript
if (조건문) {
  실행문;
} else if (조건문) {
  실행문;
} else {
  실행문;
}
```

### switch문

```js
switch(식){
  case 값1;
    실행문;
    break;
  case 값2;
    실행문;
    break;
    ...
  default: //어느 값과도 같지 않을 때
    실행문;
}
```

case문의 값은 const로 선언된 상수나 리터럴만 가능
switch문 실행 도중 break문을 만나지 못하면 만날 때까지 그 아래 다른 case의 실행 문장을 계속 실행

### 조건문의 활용

`document.querySelector('id').value`
-> 해당 id를 가진 요소의 value값 가져옴

`this`.value
-> 자기 자신의 value값 가져옴

this, 변수 활용해서 중복 제거!

---

## 2. 반복문

### for문

```js
for(초기문; 조건식; 반복 후 작업){
  작업문
}
```

### while문

```javascript
while(조건문){실행문}
else{실행문}
```

### do-while문

```js
do {
  작업문;
} while (조건식);
```

처음 한 번 작업문을 실행한 후, 조건식이 참이면 반복

### break와 continue

- break : 현재 반복문 하나만 벗어남
- continue : 다음 반복문으로 넘어감

---

## 3. 배열

```js
let <arrayName> = [a, b, c, d, ... , z];
```

index의 변경  
`<arrayName>.push(value)`

원소의 추가  
`<arrayName>[number] = value`

배열의 길이 (요소의 개수)  
`<arrayName>.length`

---

## 4. 함수

```js
function <functionName>(매개변수){
  실행 코드
  return // 결과 반환
   }
```

함수 호출

```js
<functionName>(인자); //함수 호출 후 리턴값 받지 않음
변수명 = <functionName>(인자) // 함수 호출 후 리턴값 받음
```
