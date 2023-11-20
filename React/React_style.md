# React Style

## 1. Styled Component

Javascript 파일 안에서 CSS를 처리할 수 있게 해주는 대표적인 라이브러리

```
npm install --save styled-components
```

### Styled Component의 특징

1. 컴포넌트를 정의할 때 html tag와 css를 지정해줄 수 있음

```js
const Component = styled.<tag>`
css code...
`
```

2. props를 받아 조건부 style 처리가 가능
3. 기존에 정의된 컴포넌트의 style을 override 가능

```js
const ChildComponent = styled(ParentCompoente)`
css code...
`;
```

## 2. Grid CSS

2차원의 레이아웃을 시스템을 제공하는 CSS 모듈

```css
display: grid;
```

### Grid CSS 속성

- gap-template-(columns/rows) : 각 요소들 사이의 간격
- grid-(column/row)-(start/end) : 특정 요소의 길이를 grid를 기준으로 결정
