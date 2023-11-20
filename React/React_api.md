# React API

### 1. fetch()

원격 API에 요청을 보내기 위해 사용하는 메소드
</br> 전역 fetch() 메소드는 네트워크에서 리소스를 가져오는 프로세스를 시작하여 Response 응답을 사용할 수 있게 되면 이행된 Promise를 Return

</br> fetch() 메소드를 이용하면 받은 응답을 별도의 함수를 이용하여 JSON 형태로 변환해주어야 함

### 2. Axios

```js
axios.get("url");
axios.post("url");
```

브라우저, Node.js를 위한 Promise API를 활용하는 HTTP 비동기 통신 라이브러리

### Axios 인스턴스

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
