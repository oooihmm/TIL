# Vue.js DB 연결

```
vue create <file name>
cd <file name>
npm run serve
```

___

```
mkdir backend   
npm init  
npm install express 
index.js  
node .\index.js
```

```
npm install axios
```

vue.config.js에 proxy 설정

```
inport axios from "axios";

setup() {
  axios.get("http://localhost:3000/...").then(res) => {
    console.log(res);
  });
}
```

___

