# CSS

## 1. CSS 스타일 시트

```
selector {
  property : value;
}
```

### 스타일 시트 만들기

- `<style></style>` 태그에 스타일 시트 작성
- `style` 속성에 스타일 시트 작성
- 스타일 시트를 별도의 파일로 작성하고, <link> 태그나 @import로 불러 사용

## 2. 셀렉터

### 태그 이름 셀렉터

: 태그 이름이 셀렉터로 사용되는 유형  
셀렉터와 같은 이름의 모든 태그에 스타일 시트를 적용

### class 셀렉터

: 셀렉터 이름 앞에 점(.)을 붙인 경우, 이 셀렉터는 HTML 태그의 class 속성으로만 지정할 수 있다

```CSS
.example{ property : value; }
```

```HTML
<div class="example"></div>
```

### id 셀렉터

: 셀렉터 이름 앞에 '#'을 붙인 경우, 이 셀렉터는 HTML 태그의 id 속성으로만 지정할 수 있다.

```CSS
#example{ property : value; }
```

```HTML
<ul id="example"></ul>
```
