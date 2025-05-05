# React API

## 1. fetch()

원격 API에 요청을 보내기 위해 사용하는 메소드
</br> 전역 fetch() 메소드는 네트워크에서 리소스를 가져오는 프로세스를 시작하여 Response 응답을 사용할 수 있게 되면 이행된 Promise를 Return

</br> fetch() 메소드를 이용하면 받은 응답을 별도의 함수를 이용하여 JSON 형태로 변환해주어야 함

## 2. Axios

```js
axios.get("url");
axios.post("url");
```

브라우저, Node.js를 위한 Promise API를 활용하는 HTTP 비동기 통신 라이브러리

### Axios 인스턴스

axios로 인스턴스화 시키면 중복된 부분을 반복해서 입력하지 않아도 되어 효율적!

1. 폴더 생성
2. axios.js 생성

```js
import axios from "axios"

const instance = axios.create({
  baseURL: "<url>", 
  params: {
    api_key: "<key>",
    ...
  }
});

export default instance;
```

3. request.js 생성

```js
const requests = {
  ...: "<detail url>",
  ...: "<detail url>",
  ...
};

export default requests;
```
## 3. 동기와 비동기

- 동기(Synchronous) : 한 요청이 처리 완료된 다음에 다음 요청을 진행
- 비동기(Asynchronous) : 한 요청이 처리가 완료되지 않더라도 다음 요청을 병렬적으로 진행

### 비동기 처리 방법
1. Async Request -> .then()
2. Async -> Await

최근에는 후자를 더 많이 사용하는 경향