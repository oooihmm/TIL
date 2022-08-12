# Node.js

## 1. 데이터 처리

### 사용자에게 데이터 입력받기

```html
<form action="url" method="post">
  <input name="">
  ...
  <input type="submit">
</form>
```

```js
function (requset, response) {
  var body = '';
  requset.on('data', function (data) {
    body += data;
  });

  requset.on('end', function() {
    var post = qs.parse(body);
    var name = post.name;
    ...
    fs.writeFile(`폴더명/${파일명으로 받을 변수}`, 내용으로 받을 변수, 'utf8',
    function(err){
      response.writeHead(302, {Location: `/?id=${파일명으로 받을 변수}`});
    })
  });
}

```

### 저장받은 데이터 가져오기

```html
<input value="$(변수명)" name="id" hidden> <!-- id값은 변하지 않도록 설정-->
<input value="$(변수명)" name="...">
```

파일명 수정
```js
fs.rename(`data/${id})`, data/${title}, function(error){}) 
```

파일 삭제
```html
<form action="경로" method="post">
  <input type="hidden" name="id" value="$(변수명)">
  <input type="submit" value="delete">
</form>
```

```js
fs.unlink(`data/${변수명})`, callback)
```

___

## 2. 객체와 데이터, 모듈

```js
var 객체명 = {
  key : value,
  ...
}

객체명.key = value
객체명['key'] = value
```

javascript에서 함수는 값으로 사용할 수 있다.

```js
var 객체명 = {
  key : function (){ ... }
}
```

