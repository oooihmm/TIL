# React Optimization

## 1. React의 리렌더링(rerendering)

React는 다음과 같은 상황에서 리렌더링됨

- state 변경이 있을 때
- 부모 컴포넌트가 렌더링될 때
- 새로운 props가 들어올 때

## 2. React.memo를 이용한 성능 최적화

### 개별 컴포넌트화의 문제점

React는 먼저 컴포넌트를 렌더링 한 후, 이전에 렌더링 된 결과와 비교하여 DOM 업데이트를 결정. 이때, 렌더링 결과가 이전과 다르다면 React는 DOM을 업데이트함.

각 요소들을 개별 컴포넌트로 선언하여 관리하는 경우, 값이 변경된 특정 컴포넌트만 렌더링 되는 것이 아니라 상관이 없는 다른 부분까지 렌더링되는 경우가 발생

### React.memo

React.memo()가 적용된 컴포넌트에 대하여 React는 렌더링된 결과를 메모이징(Memoizing)함. 그리고 다음 렌더링이 일어날 때, 렌더링하는 컴포넌트의 props가 같다면 React는 메모이징된 내용을 재사용함.

    ```js
    const <component> = React.memo({value} => {
      return <html-tag>{value}</html-tag>
    })
    ```

    - 메모이제이션 (Memoization)</br>
    주어진 입력값에 대한 결과를 저장함으로써 같은 입력값에 대해 함수가 한 번만 실행되는 것을 보장

### React.memo의 비교 방식

React.memo는 얕은 비교(Shallow Equal, 참조 자료형에 대해서 참조되는 위치를 비교)를 이용하여 렌더링 이전과 렌더링 이후를 비교함.

1. React.memo()의 비교함수 수행
2. 비교함수가 false를 반환할 경우 React 자체에서 렌더링 이전과 이후를 다시 비교

   => props 변경이 잦은 컴포넌트의 경우 React.memo를 사용하는 것이 오히려 비효율적

- 비교 방식 수정</br>
  React.memo()의 두번째 매개변수로 비교함수를 넣어준다.

## 3. useCallback을 이용한 함수 최적화

### 기존 함수의 문제점

어떤 함수가 자식 컴포넌트에 props를 넘겨준다면, 함수를 포함하고 있는 컴포넌트가 리렌더링 될 때마다 자식 컴포넌트도 계속 리렌더링 되어야하므로 비효율적

### useCallback

```js
const function = useCallback(() => {콜백함수}, [의존성 배열])
```

함수 내에서 참조하는 변수를 의존성 배열에 추가하면, 배열 내의 요소가 변하지 않으면 함수를 새로 생성하지 않음.

## 4. useMemo를 이용한 함수 최적화

컴포넌트 내의 Compute 함수의 연산 최적화를 위해 사용
</br>compute 함수에 넘겨주는 a,b의 값이 이전과 동일하면 컴포넌트가 리렌더링 되더라도 재연산 없이 이전 값을 재활용함

```js
function component({ props }) {
  const result = useMemo(() => compute(a, b), [a, b]);
}
```
