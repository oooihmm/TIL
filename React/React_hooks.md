# React Hooks

## 1. Class Components와 Functional Components

### Class Components

1. 다양한 기능 제공
2. 구현 시 코드 길이가 길고 복잡
3. 성능이 더딤

### Functional Components

1. 클래스형 컴포넌트에 비해 적은 기능 제공 -> React 생명주기 사용 불가!!
2. 구현 시 코드 길이가 짧고 간결
3. 성능이 빠름

### React 생명 주기

1. Mounting -> componentDidMount
2. Updating -> componentDidUpdate
3. Unmounting -> componentWillUnmount

=> React 생명 주기 사용을 위해 기존에는 클래스 컴포넌트 사용 </br>
but 16.8 업데이트 이후 함수형 컴포넌트에서도 생명 주기를 사용할 수 있게 됨!

## 2. React Hooks

### React Hooks의 장점

1. 간결한 사용
   </br> (ex) 기존 Class Component에서는 componentDidMount와 componentDidUpdate, componentWillUnmount를 다 각각 처리해줘야 해서 코드 길이가 길어지는 반면, react hooks를 사용하면 useEffect 안에서 한번에 처리해줄 수 있어 간결하다.
2. HOC 컴포넌트를 Custom React Hooks로 대체하여 Wrapper 컴포넌트가 늘어나는 것을 방지할 수 있다.

※ HOC(Higher Order Components)
</br> 화면에서 재사용 가능한 로직만을 분리해서 component로 만들고, 재사용 불가능한 UI와 같은 다른 부분들은 Parameter로 받아서 처리하는 방법

## 3. Functional Components

```js
import React from "react";

const Square () =>  {
  return(
    <div>Square Components</div>;
  )
}
```

rafce 단축키를 이용하여 쉽게 만들 수 있다.

### 함수형 컴포넌트의 상태 관리

1. 상태 관리 선언

   ```js
   import { useState } from 'react'

   const [<getter>, <setter>] = useState[<초기값>];
   ```

2. 상태값 변경시 setter 함수를 사용해서 변경 가능

- setter 함수의 매개변수

  - setter(getter + 1) : getter를 직접적으로 사용하면 setter 함수의 중복 처리가 안 됨

    ```js
    const [value, setValue] = useState[0];

    setValue(value + 1);
    setValue(value + 1);
    console.log(value); // 출력값은 1
    ```

  - setter(prev => prev + 1) : `privious`라는 프로퍼티를 사용하면 setter 함수의 중복 처리가 가능

    ```js
    const [value, setValue] = useState[0];

    setValue((prev) => prev + 1);
    setValue((prev) => prev + 1);
    console.log(value); // 출력값은 2
    ```

### 함수형 컴포넌트의 props

1. 매개변수에 props 변수 및 메소드 작성
2. 작성한 매개변수 사용

- `props.<value>` 또는 `props.<method>`로 사용
  ```js
  const Square = ({ onClick, value }) => {
    return (
      <button className="square" onClick={props.onClick()}>
        {props.value}
      </button>
    );
  };
  ```
- 그냥 `<value>` 또는 `<method>`로 사용도 가능

  ```js
  const Square = ({ onClick, value }) => {
    return (
      <button className="square" onClick={onClick()}>
        {value}
      </button>
    );
  };
  ```

  ## 4. Github를 이용한 배포

  ### gh-pages 모듈 설치

  `npm install gh-pages --save-dev`

  ### package.json 수정

  1. homepage 추가

  ```
  "homepage" = "<github 주소>"
  ```

  2. deploy script 추가

  ```
  "deploy" = "gh-pages -d build"
  ```

  ### script 실행

  npm run deploy
