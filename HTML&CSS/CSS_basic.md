# CSS 기초

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

---

## 2. 셀렉터

### 태그 이름 셀렉터

: 태그 이름이 셀렉터로 사용되는 유형  
셀렉터와 같은 이름의 모든 태그에 스타일 시트를 적용한다.

```CSS
h3{ property : value; }
```

```HTML
<h3></h3>
```

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

### 그 외 셀렉터

| 셀렉터             | 내용                                            |
| ------------------ | ----------------------------------------------- |
| 전체 셀렉터        | 와일드카드 문자(\*)를 사용하여 문저 전체에 적용 |
| 속성 셀렉터        | HTML 태그의 특성 속성에 대해 적용               |
| 가상 클래스 셀렉터 | 어떤 상황이 발생하였을 때만 적용                |

---

## 3. 색과 텍스트 꾸미기

### 색상 지정

| 프로퍼티         | 내용          |
| ---------------- | ------------- |
| color            | 텍스트 글자색 |
| background-color | 배경 색       |
| border-color     | 테두리 색     |

### 텍스트 꾸미기

| 프로퍼티        | 값                                      | 내용          |
| --------------- | --------------------------------------- | ------------- |
| text-indent     | `<length>`, `<percentage>`              | 들여쓰기      |
| text-align      | left, right, center, justify            | 정렬          |
| text-decoration | none, underline, overline, line-through | 텍스트 꾸미기 |

### 폰트 지정

| 프로퍼티    | 값                                              | 내용                    |
| ----------- | ----------------------------------------------- | ----------------------- |
| font-family | <폰트명>                                        | 구체적인 폰트 이름 지정 |
| font-size   | <절대수치>, medium, small, large, ...           | 폰트 크기               |
| font-style  | normal, italic, oblique                         | 폰트 스타일             |
| font-weight | 100~900, normal, bold, bolder, lighter          | 폰트 굵기               |
| font        | font-style, font-weight, font-size, font-family | 단축 프로퍼티           |

---

## 4. 박스 모델

### 박스의 구성

HTML 태그 즉, 박스는 다음 4개의 영역으로 구성된다

- 콘텐츠 : HTML 태그의 텍스트나 이미지 부분
- 패딩 : 콘텐츠를 직접 둘러싸고 있는 내부 여백
- 테두리 : 패딩 이부의 외곽선으로 직선이나 점선 혹은 이미지를 입힐 수 있음
- 여백 : 박스의 맨 바깥 영역으로 아래위 인접한 태그와 만나는 공간

### 박스의 크기

| 프로퍼티 | 내용          |
| -------- | ------------- |
| width    | 콘텐츠의 너비 |
| height   | 콘텐츠의 높이 |
| padding  | 패딩의 크기   |
| margin   | 여백의 크기   |

### 테두리 꾸미기

| 프로퍼티                             | 내용                   |
| ------------------------------------ | ---------------------- |
| border-width                         | 테두리의 두께          |
| border-style                         | 테두리의 점선          |
| border-color                         | 테두리의 색상          |
| border-radius                        | 테두리의 모서리 둥글게 |
| border `<width>` `<style>` `<color>` | 단축 프로퍼티          |

### 배경

| 프로퍼티            | 값                                      | 내용                    |
| ------------------- | --------------------------------------- | ----------------------- |
| background-color    | `<color>`                               | 배경 색상               |
| background-image    | url( )                                  | 배경 이미지             |
| background-position | `left/center/right` `top/center/bottom` | 배경 이미지의 시작 위치 |
| background-size     | `<size>`                                | 출력되는 크기           |
| background-repeat   | no-repeat, repeat, repeat`x/y`          | 반복 출력 방식 지정     |
