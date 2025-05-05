# Javascript Dom

1. 자바스크립트는 HTML에 접근하고 읽을 수 있게 설정되어 있다.
2. `document`는 우리가 접근할 수 있는 HTML 코드를 반환하는 객체이다.
3. `console.dir(document 객체)`를 이용하면 객체의 프로퍼티를 더 자세히 볼 수 있다.

## JS와 CSS, HTML과의 관계

1. JS에서 style 객체에 직접 접근해서 변경하는 것은 지양한다.
2. CSS 코드 내에서 id나 class 등을 사용하여 조건에 맞는 style을 지정한 후, JS에서는 HTML 개체에 id나 class 부여를 통해 바꾸는 방법을 권장한다.

---

## HTML로의 접근

### getElement

1. `document.getElementByID("")`를 이용하면 해당 ID를 가진 HTML 개체를 반환한다.
2. `document.getElementsByClassName("")`을 이용하면 해당 Class를 가진 HTML 개체들을 배열로 반환한다.
3. `document.getElementsByTagNam("")`을 이용하면 해당 Tag를 사용하는 HTML 개체들을 배열로 반환한다.

### querySelector

1. `document.querySelector("")`는 HTML 개체를 CSS 방식으로 검색할 수 있게 해준다.
2. 클래스명은 `.className`, 아이디명은 `#idName`, 태그명은 `tagName`의 형태로 작성한다.
3. querySelector는 조건에 부합하는 HTML 개체들 중 가장 먼저 나오는 하나의 개체만을 반환한다.
4. `querySelectorAll("")`를 이용하면 조건에 부합하는 모든 HTML 개체들을 반환한다.

### 개체 추가

1. `document.createElement("element")`를 이용하면 개체를 생성할 수 있다.
2. `document.<parentElement>.appendChild(<childElement>)`를 이용하면 부모 개체에 자식을 만들 수 있다.
3. `document.<parentElement>.insertBefore(<childElement> [, 기준 element])`을 이용하면 기준 자식 개체 상위에 자식을 만들 수 있다.

### 개체 삭제

1. `<childElement>.parentElement`를 이용하면 부모 객체를 알아낼 수 있다.
2. `<parentElement>.remoceChild(<childElement>)`를 이용하면 부모 개체로부터 자식을 삭제할 수 있다.

```

---

## Event Handling

1. `event`는 일반적으로 document 객체 내에서 `on-`으로 시작하는 프로퍼티들이다.
2. `element.onEventName = function"을 이용해도 해당 개체에 특정 event 발생시 특정 함수를 실행시킬 수 있다.
3. `element.addEventListener("event", function)` 메소드를 이용하면 해당 개체에 특정 event 발생시 특정 함수를 실행시킬 수 있다.
4. `element.removeEventListener()`를 이용하여 eventListner를 제거할 수 있다.

### eventListener와 함수

1. 실행시킬 함수를 매개변수로 전달할 때, `function()`의 형태로 사용하지 않는다. 왜나면 `()`의 역할은 함수를 바로 실행시키는 데에 있기 떄문이다.
2. 전닲된 함수의 첫번째 인자는 항상 발생된 event에 대한 정보이다. 별도의 매개변수를 전달하지 않더라도 JS에서 항상 제공한다.
3. 함수 내에 `event.preventDefault();`를 작성하면 이벤트가 발생할 때 JS에서 기본적으로 실행하는 것들을 실행되지 않게 해준다. (event 객체의 preventDefault 프로퍼티 값을 true로 설정한다.)

### window

1. window 객체는 일반적으로 두 가지의 의미를 가진다.
    - 브라우저 안의 모든 요소들이 소속된 최상위의 `전역 객체`
    - 브라우저 창
2. window 객체에도 evenListner를 추가하여 제어할 수 있다.

### classList

1. `className`은 개체가 가지고 있는 class 중 하나만을 반환한다.
2. `claaaList`를 이용하면 개체가 가지는 class 모두에 접근할 수 있다.
3. classList는 `DOMTokenList`가 사용할 수 있는 메서드에 접근할 수 있다.
4. classList를 사용하면 개체의 모든 class를 변경하는 것이 아니라 메서드를 통해 특정 class만 제어 가능하다는 점에서 용이하다.
    - `.contains(token)` : list 내에 특정 token이 존재하는지 여부를 boolean 형태로 반환한다.
    - `.remove(token)` : list 내에서 특정 token을 삭제한다.
    - `.add(token)` : list 내에 특정 token을 추가한다.
    - `.toggle(token)` : list 내에 특정 token이 존재 여부를 확인하고, true이면 token을 삭제하고 false이면 token을 추가한다.

---

## localStorage

1. `localStorage`는 브라우저에 특정 값을 저장할 수 있게 해주는 객체이다.
2. localStorage에 저장된 항복은 개발자 도구의 `Application`에서 확인할 수 있다.
3. localStorage가 제공하는 메서드를 이용하여 데이터를 저장하거나 가져올 수 있다.
    - `localStorage.setItem("key", "value")` : localStorage에 data들을 저장한다.
    - `localStorage.getItem("key")` : localStorage에 저장된 프로퍼티 value값을 key값을 이용해서 꺼낸다. -`localStorage.removeItem("key")` : localStorage에 저장된 프로퍼티를 삭제한다.

---

## 문자열 포멧팅

1. `.padStart(length, "string")`을 사용하면 길이가 length 미만일 경우 문자열 앞에 인자로 받은 string을 추가한다.
1. `.padEnd(length, "string")`을 사용하면 길이가 length 미만일 경우 문자열 뒤에 인자로 받은 string을 추가한다.
```
