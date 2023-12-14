# Typescript

## 1. Type

어떤 값이 가지고 있는 프로퍼티나 함수를 추론할 수 있는 방법

### Primitive types

- string
- number
- boolean
- null
- undifined
- symbol

### Object types

- function
- array
- class
- object

### Additional types

- tuple
- enum : 특정 값을 카테고리컬하게 분류하는 경우에 사용
  </br> 속성 값으로 문자와 숫자만 사용 가능, 선언 이후에 값 변경 불가

  ```js
  enum Media {
    A = 1,
    B = 2,
    C  // 2 + 1 = 3
  }


  let mediaType: number = Media.B // 2
  let type: string = Media[2] // B
  ```

- any : 잘 알지 못하는 타입이 컴파일 시간에 검사를 통과할 수 있도록 설정
- void : 데이터가 없는 경우 즉, 타입이 없는 상태
- never : 절대 발생하지 않는 값을 사용할 때 사용
- union : 둘 이상의 데이터 유형을 가질 때 사용
  ```js
  let code: string | number;
  ```

## 2. annotation, inference

### Type annotation

개발자가 타입을 타입스크립트에게 직접 말해주는 것

```js
const rate: number = 5;
```

### Type inference

타입스크립트가 타입을 알아서 추론하게끔 두는 것

```js
const rate = 5;
```

### annotation을 해줘야 하는 경우

1. 타입스크립트가 Any 타입을 리턴할 때
2. 변수 선언만 먼저 하고 나중에 초가화 하는 경우
3. 변수 대입 값이 일정하지 않은 경우

## 3. type assertion

타입 표명(type assertion)을 사용하면 값의 type를 설정하고 컴파일러에 이를 유추하지 않도록 지시할 수 있다.

```js
interface Foo{
  bar: number;
  bas: string;
}

var foo = {} as Foo;
foo.bar = 123,
foo.bas = 'hellp'
```
