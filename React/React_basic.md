# React basic

React : 사용자 인터페이스를 위한 라이브러리

- 재사용성 보장 : 컴포넌트의 활용
- 성능 개선 : 가상돔 사용, SPA
- 일관성 유지 : 자식 -> 부모 단방향 데이터 흐름

## 1. React Randering

### Critical Render Path

렌더 엔진이 HTML 문서를 읽는 것부터 시작해서 실제 화면에 그리는 것까지 일련의 과정

1. 렌더 엔진이 HTML 문서를 읽음 -> DOM TREE 생성
2. DOM TREE와 CSSOM을 결합하여 RENDER TREE 생성
3. 브라우저가 Layout을 생성
4. 실제 화면에 Paint

그런데 DOM의 특정 부분에 변화가 생기면 -> RENDER TREE를 처음부터 모두 다시 그려야 함!!

불필요하게 DOM을 조작하는 비용이 너무 크게 발생

### Virtual DOM

DOM을 조작하는데 드는 불필요한 비용을 줄이기 위해 실제 DOM을 메모리에 복사하여 사용하는 것

1. DOM에 변화가 생긴다
2. 가상 DOM에서 다시 렌더링한다
3. 변화가 생긴 부분만 찾아서(Diffing) 실제 DOM에 적용시킨다(reconciliationn)

### React의 rerendering

React는 다음과 같은 상황에서 리렌더링됨

- state 변경이 있을 때
- 부모 컴포넌트가 렌더링될 때
- 새로운 props가 들어올 때

### lifecycle

1. 생성 Mounting -> componentDidMount
2. 업데이트 Updating -> componentDidUpdate
3. 제거 Unmounting -> componentWillUnmount

## 2. Create React App

-> Create-React-App을 사용해서 리엑트를 설치하면 Babel이나 Weppack 설정이 기본으로 되어 있어 편리하게 리엑트 앱을 시작할 수 있다.

### Babel

최신 자바스크립트 문법을 구형 브라우저에서도 돌 수 있게 변환시켜주는 라이브러리

### Webpack

여러개로 나누어져 있는 파일들을 하나의 자바스크립트 코드로 압축하여 최적화하는 라이브러리

1. 로딩에 대한 네트워크 비용을 절감할 수 있다.
2. 모듈 단위의 개발을 가능케 하여 가독성 및 유지보수에 좋다.

### 터미널 실행 방법

`npx create-react-app ./`

1. npx : 노드 패키지 실행을 도와주는 도구
2. create-react-app : 리엑트앱 시작에 필요한 패키지들을 가져옴
3. ./ : 패키지 실행 폴더 설정

### React Basic Structure

리액트 프로젝트 시작시 다음의 내용을 포함하는 폴더가 생성됨

- index.html: 방문자가 사이트를 요청할 때 기본으로 띄워주는 페이지의 가장 일반적인 이름

- index.js : 자바스크립트의 시작점

- public : 일반적으로 정적 파일을 저장하는 폴더 </br> public 내부의 파일만 public/index.html에서 사용할 수 있다.

- src : 대부분의 리엑트 소스 코드를 저장하는 폴더 </br> webpack은 src 폴더 안에 있는 코드들만 압축함

- package.json : 해당 프로젝트에 대한 정보 및 필요한 라이브러리의 정보를 저장함. 앱을 구동시킬 수 있는 스크립트 또한 정의할 수 있음.

## 4. Start React

### Single Page Application

React는 웹 사이트의 전체 페이지를 하나의 페이지에 담아 동적으로 화면을 바꿔가며 표현하는 SPA 방식을 사용함.

1. 실제로 화면에 그려지는 파일은 `index.html`임.
   ```html
   <div id="root"></div>
   ```
2. `index.js`에서 root id를 가진 div 엘리먼트를 잡아줌
   ```js
   const root = ReactDOM.createRoot(document.getElementById("root"));
   root.render(
   	<React.StrictMode>
   		<App />
   	</React.StrictMode>
   );
   ```
3. `app.js`의 App 컴포넌트가 실제 화면에 그려짐

-> 이러한 방식은 HTML 5의 History API 덕분에 가능해짐. </br> History API는 현재 페이지 내에서 화면 이동이 일어난 것 처럼 작동하게끔 만들어줌.

### JSX

Javascript Syntax Extention </br> 화면에서 UI가 보이는 모습을 나타내주는 자바스크립트의 확장 문법

- 원래 리엑트에서 화면을 그리는 방식 : React.createElement API를 사용해서 엘리먼트 생성 후, In-Memory에 저장하면 ReactDOM.render 함수가 사용될 때 엘리먼트를 실제 웹 브라우저에 그림
- JSX를 사용하면 : JSX를 사용한 후 Babel이 createElement로 바꿔주기 때문에 모든 UI를 만들 때마다 엘리먼트를 만들 필요가 없어서 편리

```jsx
function example() {
	return <div> ... </div>;
}
```

## 5. Components

컴포넌트 : 리액트 앱을 이루는 최소한의 단위

### Class Components

```js
import React from "react";

export class Square extends React.Component {
	render() {
		return <div>Square Components</div>;
	}
}
```

`rcc` 키워드를 통해 자동완성 가능

- extends : 클래스를 다른 클래스의 자식으로 만들기 위해 사용
- export default : 해당 모듈엔 개체가 하나만 있다는 사실을 명확히 함

### 클래스형 컴포넌트의 Props

부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달하는 방법

- 변수의 전달

  ```js
  <자식컴포넌트 자식변수명={this.부모변수명} />

  ###

  <div>{this.props.value}</div>
  ```

- 메소드의 전달

  ```js
  <자식컴포넌트 자식메소드명={this.부모메소드명} />

      ###

      <button
        이벤트핸들러={() => { this.props.자식메소드명();}}
      >
        {this.props.value}
      </button>
  ```

Props는 읽기 전용으로 자녀 컴포넌트 입장에서는 변하지 않음

### 클래스형 컴포넌트의 상태 관리

리액트에서 데이터가 변할 때 화면을 다시 렌더링 해주기 위해서는 React State를 사용해야 함 </br> -> 컴포넌트가 State를 관리하고, State가 변경되면 컴포넌트는 Re-rendering됨

1. State 추가 </br>React 컴포넌트는 생성자에 this.state를 설정하는 것으로 state를 가질 수 있음

   ```js
   constructor(props) {
     super(props);
     this.state = {
       value = null
     }
   }
   ```

- constructor(생성자) : 인스턴스화된 객체에서 다른 메서드를 호출하기 전에 수행해야 하는 사용자 지정 초기화를 제공
- super : super 키워드는 자식 클래스 내에서 부모 클래스의 생성자나 메소드를 호출하기 위해 사용
- super와 this : this 키워드는 반드시 부모 클래스의 생성자를 호출한 다음에 사용
- super(props) : React.Component 객체가 생성될 때 props 속성을 초기화하기 위해 부모 컴포넌트에게 props를 전달, 또한 생성자 내부에서도 this.props를 사용할 수 있도록 보장하기 위함

2. State 변경 </br> this.setState 메소드를 이용해서 State값에 접근 가능
   ```
   this.setState({변수명: ... })
   ```
3. State 사용 </br> `this.state.변수명`을 이용하면 State에 저장된 원하는 변수값을 가져올 수 있음

### Functional Components

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

### 클래스형 컴포넌트와 함수형 컴포넌트

- Class Components

1. 다양한 기능 제공
2. 구현 시 코드 길이가 길고 복잡
3. 성능이 더딤

- Functional Components

1. 클래스형 컴포넌트에 비해 적은 기능 제공 -> React 생명주기 사용 불가!!
2. 구현 시 코드 길이가 짧고 간결
3. 성능이 빠름

but 16.8 업데이트 이후 React Hooks를 이용해 함수형 컴포넌트에서도 생명 주기를 사용할 수 있게 됨!

## 6. React Hooks

상태값 관리(useState), 컴포넌트 생명주기 함수(useEffect)

1. 최상위 컴포넌트에서만 호출
2. 리액트 함수 컴포넌트 내에서만 호출

### React Hooks의 종류

- useState: 상태 관리 hook
- useEffect: side effect(= componentDidMount, componentDidUpdate, componentWillUnmount 기능) 수행 hook
- useMemo : 메모이제이션(기존에 수행한 연산의 값을 저장)된 값을 반환하는 hook
- useContext : context(전역 상태)값을 가져오는 hook
- useRef : 특정 DOM을 선택할 때 사용하는 hook

### React Hooks의 장점

1. 간결한 사용
   </br> (ex) 기존 Class Component에서는 componentDidMount와 componentDidUpdate, componentWillUnmount를 다 각각 처리해줘야 해서 코드 길이가 길어지는 반면, react hooks를 사용하면 useEffect 안에서 한번에 처리해줄 수 있어 간결하다.
2. HOC 컴포넌트를 Custom React Hooks로 대체하여 Wrapper 컴포넌트가 늘어나는 것을 방지할 수 있다.

※ HOC(Higher Order Components)
</br> 화면에서 재사용 가능한 로직만을 분리해서 component로 만들고, 재사용 불가능한 UI와 같은 다른 부분들은 Parameter로 받아서 처리하는 방법
