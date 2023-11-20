# React Router Dom

## 1. React Router Dom

웹 앱에서 동적 라우팅을 구현하기 위해 사용
</br> 앱 및 플랫폼의 요구 사항에 따라 컴포넌트 기반 라우팅을 용이하게 함

```
npm install react-router-dom --save
```

### React와 React Router Dom

React는 index.html라는 하나의 템플릿을 가지는 Single Page Application(SPA)임. 따라서 자바스크립트를 이용하여 다른 컴포넌트를 index.html에 넣어주는 방식으로 페이지를 변경
</br> React Router Dom을 이용하면 새 컴포넌트로 라우팅/탐색을 하고 렌더링을 하기에 편리함

## 2. React Router Dom 사용

### BrowserRouter로 루트 컴포넌트 감싸기

/src/index.js

```js
import { BrowserRouter } from 'react-router-dom'

ReactDOM.render(
  <BrowserRouter>
  <App />
  </BrowserRouter>
  document.getElementById('root')
);
```

BrouserRouter는 HTML History API를 사용하여 UI를 URL과 동기화된 상태로 유지해줌

### Route 정의하기

/src/App.js

```js
function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="about" element={<About />} />
        <Route path="contact" element={<Contact />} />
      </Routes>
    </div>
  );
}
```

- Routes : 모든 개별 경로에 대한 상위 역할
- Route : 단일 경로를 만든느 데에 사용

### `<Link />`를 이용해 경로 이동하기

```js
<Link to="about"></Link>
```

Link 구성요소는 to 속성과 동일한 path의 구성 요소를 렌더링함

## 2. React Router Dom API

### 중첩 라우팅

```js
import { Routes, Route } from "react-router-dom";

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="about" element={<About />} />
        <Route path="contact" element={<Contact />} />
        <Route />
      </Routes>
    </div>
  );
}
```

중첩 라우팅을 이용하면 부모 라우트는 자식 라우트의 레이아웃처럼 동작함

### Outlet

```js
<Outlet />
```

vue.js의 `<router-view></router-view>`와 같은 역할
</br>자식 라우트의 중첩된 UI를 표시하기 위해 사용

### useNavigate

js로 route에 접근하기 위해 사용

```js
import { useNavigate } from "react-router-dom";

function FunctionName() {
  let navigate = useNavigate();
  navigate("path", { repalce = true });
}
```

### useParams

`:` 문법을 사용하여 패러미터를 전달

```js
import { useParams } from "react-router-dom";

function App() {
  return (
    <Routes>
      <Route path="/:paramsName" element={<Element />} />
    </Routes>
  );
}

function Element() {
  let params = useParams();
  return <tag>{params.paramsName}</tag>;
}
```

### useLocation

현재 위치 객체를 반환

```js
function Element() {
  let location = useLocation();
}
```
