# React State

리엑트에서 한 컴포넌트 안에서 데이터를 생성 및 업데이트 하고, 이를 다른 컴포넌트와 공유하는 데에는 여러 가지 방법이 존재한다.

## 1. state와 props를 사용한 컴포넌트 간의 전달

### props와 state

props : 구성 요소가 서로 통신하는 방법

- 상위 요소에서 하위 요소로 단방향 전달
- 해당 값을 변경하려면 반드시 부모 요소에서 변경해야 함

state: 컴포넌트 안에서 데이터를 전달하는 방법

두 값 모두 re-render에 영향을 미침

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

## 2. React Context

컴포넌트 트리의 깊이에 관계없이 props를 전달하지 않고도 컴포넌트에 데이터를 전달할 수 있도록 전역으로 데이터를 관리

### Context API

```js
const MyContext = React.createContext(<defaultValue>);
```

React가 이 Context 객체를 구독하는 구성 요소를 렌더링할 때, 트리에서 그 위에 가장 근접하게 일치하는 Provider에서 현재 컨텍스트 값을 읽음

```js
<MyContext.Provider value={/* some value */}>
  <Component1 />
  <Component2 />
  <Component3 />
</MyContext.Provider>
```

Provider가 감싸고 있는 모든 컴포넌트가 MyContext라는 Context 객체를 구독한다고 볼 수 있음 (Consumer Compoenent) => 따라서 각 컴포넌트들은 Context가 변경되면 다시 렌더링 됨

### Use Context Hook

```js
const value = useContext(MyContext);
```

해당 Context 객체의 가장 가까운 Provider의 props를 기반으로 현재 Context value를 반환
</br> 가장 가까운 Provider가 업데이트 되면 이 Hook은 리렌더링을 트리거함

## 3. redux

자바스크립트 애플리케이션을 위한 상태 관리 라이브러리 -> store 사용

```bash
npm install redux --save
```

### redux의 데이터 흐름

1. action : reducer를 호출

```js
{type: <수행하는 작업의 유형>} // 자바스크립트 객체의 형태
```

2. reducer : store의 값을 업데이트할 것을 결정하고, 업데이트된 내부 상태를 반환
   </br>인수로 조치를 취하고 state 내부의 상태를 업데이트

```js
{previousState, action} => nextState
```

3. redux store : 어플리케이션의 전체 상태 트리를 보유하는 객체
4. react component : 값의 변경에 따라 새로이 view를 업데이트, dispatch

### reducer 생성

src/reducers

```js
// index.js

import { combineReducers } from 'redux';
import <reducer> from './<reducer>';

const rootReducer = combineReducers({
  /* reducers ... */
})

export default rootReducer
```

```js
const reducer = (state: <초기 상태>, action: ({props}) => {/* 실행할 로직 작성 */})

export default reducer
```

### store 생성

하나의 어플리케이션에는 하나의 store만 생성

src/index.js

```js
import <reducer> from ./reducers
import { createStore } from 'redux'

const store = createStore(rootReducer)

ReactDom.render(
  <React.StrictMode>
    <App value={store.getState()} "<함수명>"={() => state.dispatch({type: "<type>"})}>
  </React.StrictMode>
  ...

  store.subscribe(render) // subscribe(): change lister를 추가하여 작업이 전달 될 때마다 호출
)
```

### provider

`<Provider>` 구성 요소는 Redux Store 저장소에 엑세스해야 하는 모든 중첩 구성 요소에서 Redux Store 저장소를 사용할 수 있도록 도움. 따라서 대부분의 응용 프로그램은 전체 앱의 구성 요소 트리 내부에 있는 최상위 수준에서 `<Provider>`를 렌더링

```js
import <reducer> from ./reducers
import { createStore } from 'redux'

const store = createStore(rootReducer)

ReactDom.render(
  <React.StrictMode>
    <Provider store={store}>
      <App "<함수명>"={() => state.dispatch({type: "<type>"})}>
    <Provider />
  </React.StrictMode>
  ...

  store.subscribe(render) // subscribe(): change lister를 추가하여 작업이 전달 될 때마다 호출
)
```

### store 접근

리덕스에서 store에 접근할 수 있도록 제공하는 Hooks론느 useSelector와 useDispatch가 있다. 단, provider 하위의 컴포넌트 내에서만 접근 가능하다.

useSelector : 스토어의 값을 가져옴

```js
cpmst result = useSelector((state) => state.counter)
```

useDispatch : 스토어의 dispatch 함수에 접근

```js
const dispatch = useDispatch()

dispatch({type: ..., ...})
```

### redux middleware

액션을 dispatch에 전달하고 리듀서에 도달하는 순간 사이에 사전에 지정된 작업을 실행할 수 있도록 해주는 중간자로, 로깅이나 충돌 보고, 비동기 API와 통신, 라우팅 등을 위해 사용

```js
const exampleMiddleware = (store) => (next) => (action) => {
	/* 사용할 로직 작성 */
};

const middleware = applyMiddleware(exampleMiddleware); // 미들웨어 등록
```

### redux Thunk

Thunk : 일부 지연된 작업을 수행하는 코드 조각
<br/>리덕스를 사용하는 앱에서 비동기 작업을 할 때 주로 사용

```bash
npm install redux-thunk --save
```

```js
const middleware = applyMiddleware(thunk, exampleMiddleware); // thunk 추가
```

redux Thunk를 사용하면 액션 생성자가 액션 객체를 생성할 뿐만 아니라 그 내부 안에서 여러 작업이 가능해짐

### redux toolkit

Redux 로직을 작성하기 위한 공식 접근 방식

```bash
npm install @reduxjs/toolkit
```

Redux 작업을 단순화 및 일반화하여 Redux 애플리케이션을 더 쉽게 작성할 수 있도록 함

```js
import { configureStore } from "@reduxjs/toolkit";

export const store = configureStore({
	reducer: {
		counter,
		counterReducer,
	},
});
```

## 4. Zustand

간소화된 Flux 원칙을 사용하는 작고 빠르고 확장 가능한 상태 관리 솔루션

```bash
npm install zustand --save
```

- 상용구 코드 감소
- 구성 요소를 다시 렌더링하지 않고도 상태 변경 가능
  </br> Zustand는 상태 값이 변경될 때만 구성 요소를 렌더링
- 중앙 집중식 상태 관리
- 단순하게 정의된 작업을 통한 업데이트 가능
- Hooks를 통해 상태 사용
- 컨텍스트 제공 필요 없음

### store 생성

create 메소드를 생성하여 store 선언

```js
import create from 'zustand'

expost const useCounterStore = create((set) => ({
  count: 1,
  increment: () => set((state) => ({count: state.count + 1}))
}))
```

Store는 Hooks로 이루어져있고, 객체, 함수 등 무엇이든 넣을 수 있음

### Persist Middleware

기존의 store는 새로고침시에 다시 초기화됨 -> 로컬 스토리지에 저장하여 값 유지

```js
import create from 'zustand'
import { persist } from 'zustand/middleware'

expost const useCounterStore = create(persist((set) => ({
  count: 1,
  increment: () => set((state) => ({count: state.count + 1}))
}), { name: <key>})) // 로컬스토리지에 저장되는 key의 이름 지정
```

```js
useCounterStore.persist.clearStorage();
```

### devtools 사용

```js
import create from 'zustand'
import { persist, devtools } from 'zustand/middleware'

let const counterStore = create(
      (set) => ({
        count: 1,
        increment: () => set((state) => ({count: state.count + 1})),
        })
)

counterStore = devtools(counterStore);
counterStore = persist(counterStore, {name: 'counter'})

export const useCounterStore = create(counterStore)
```

### 비동기 데이터 처리

```js
import create from 'zustand'

expost const useCounterStore = create((set) => ({
  count: 1,
  fetch: async (id) => {
    const path = <path>;
    const response = await fetch(path);
    set({count: await response.json });
  }
}))
```
