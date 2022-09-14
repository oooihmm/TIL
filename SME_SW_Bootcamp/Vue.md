# Vue.js

[Vue.js](https://kr.vuejs.org/) -> 사용자 인터페이스를 만들기 위한 **프로그레시브 프레임워크**

## 시작 및 종료

시작 : npm run serve
종료 : ctrl + c

## router

```js
const routes = [
  {
    path: '<path>',
    name: '<name>',
    component:
  }
]
```

### component 연결 방법

1.

```js
import <component> from 'component path'

const routes = [
  {
    path:
    name:
    component: <component>
  }
]
```

-> 컴파일된 코드가 app.js안에 들어감  
처음 뜨는 main 화면에 주로 사용

2.

```js
const routes = [
  {
    path:
    name:
    component: () => import(/*webpackChunkName: "Name"*/ 'component path')
  }
]
```

-> 해당 페이지로 이동하는 시점에 서버가 코드를 받아옴

`/*webpackPrefetch:true*/` : 코드를 미리 받아와서 저장해둠  
-> 사용자가 들어갈 빈도가 높은 화면에 적용하는 것이 효율적!

## 기본 문법

views, components
views : 화면 전체를 사용하는 component -> `<name>View.vue`  
components : 재사용이 가능한 component

```js
<template>
html tag
</template>

<script>
export default {
  data() {
    return {
      데이터명: ""
    }
  }
}
</script>

<style scoped>
css tag
</style>
```

## 단방향 데이터 바인딩

문자열 데이터 바인딩 : `{{ 문자열 데이터 변수명 }}`  
html 데이터 바인딩 : `<div v-html="html 데이터 변수명"></div>`  
attribute 데이터 바인딩 : `(v-bind):속성="데이터 변수명"`  
attribute 조건문 : `:속성="데이터 변수명 == ''"`  
반복문

```js
html 태그 속성
:value="city.code" :key="city.code" v-for"city in cities"

//

데이터
citise: [
  { title: , code: },
  { title: , code: },
  { title: , code: }
]
```

## 양방향 데이터 바인딩

input 데이터 바인딩 : `<input type="" v-model="input 데이터 변수명" />`  
select 데이터 바인딩: `<select v-model="데이터명">`  
checkbox 데이터 바인딩: `<input type="checkbox" id="" value="" v-model="데이터 변수명" />`  
-> 이 때 데이터 변수명은 배열로 설정 (ex) 변수명 : []  
radio 데이터 바인딩 : `<input type="radio" id="" value="" v-model="데이터 변수명" />`  
-> 이 때 데이터 변수명은 문자로 설정 (ex) 변수명 : ' '  
클래스 데이터 바인딩 : `:class="{ 'class name': true, ...}"`  
스타일 데이터 바인딩 : `:style="데이터명"`  
-> 이 때 데이터 변수명은 오브젝트로 설정 (ex) 변수명 : { : , ...}

## 데이터 변환

input box : 데이터를 문자로 받음  
v-model.number -> 입력받은 문자열을 숫자로 변환

## 이벤트 처리

```js
<template>
  <button @event="함수명"></button>
</template>

<script>
  methods: {
    함수명() {
      실행 코드
    }
  }
</>
```
