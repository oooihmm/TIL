# React Next.js

Next.js는 React의 SSR(server side rendering)을 쉽게 구현할 수 있게 도와주는 프레임워크이다. Pre-Rendering을 통해 페이지를 미리 렌더링하여 완성된 HTML을 가져오기 때문에 검색엔진 최적화에 좋을 뿐더러, 지연 시간 발생을 줄임으로써 더 나은 UX를 제공할 수 있다.

```bash
npx create-next-app@latest --typescript
```

## 1. Pre-rendering

Next.js는 모든 페이지를 pre-rendering한다. 즉, index.html을 Client 사이드에서 자바스크립트로 처리하기 전, 사전에 생성하여 제공한다.

1. Initial Load
   Pre-rendering된 HTML이 디스플레이된다.
2. Hydration
   JS가 로드되면서 리엑트 컴포넌트가 실행되고 애플리케이션과 상호작용 가능해진다.

=> React 만을 사용하면 JS가 로드되지 않은 Initial Load 단계에서는 어떤 화면도 볼 수 없다!
