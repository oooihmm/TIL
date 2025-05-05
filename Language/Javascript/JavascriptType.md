# Javascript Type

## 원시값

### 원시값의 메서드

1. 원시값은 항상 원시값 그대로 단일 값 형태를 유지한다.
2. 원시값이 메서드나 프로퍼티에 접근하려 하면 `원시 래퍼 객체(object wrapper)`를 생성한다.
    - 각 래퍼 객제는 원시 타입에 따라 생성된다.
    - 래퍼 객체마다 제공하는 메서드가 다르다.
3. 메소드가 값은 반환하고 나면 래퍼 객체는 파괴되고 원시값만 남는다.
    - 따라서 원시값은 추가 프로퍼티를 저장할 수 없다.

---

## 숫자형

1. 일반적인 숫자형은 64비트 형식의 IEEE-754에 저장된다.
2. `e`를 사용하면 큰 숫자를 간단하게 표현할수 있다. e의 왼쪽 숫자에 e의 오른쪽 수만큼의 10의 거듭제곱을 곱한 값과 같다.
    ```js
    1e3 === 1 * (10 ^ 3)
    1e--6 === 1 * (10 ^ -6)
    ```
3. 64비트 형식의 한계로 때떄로 Infinity로 처리되거나 정밀도 손실이 일어난다.
    - Infinity : 숫자가 너무 커지면 64비트 공간을 초과하며 Infinity로 처리된다.
    - loss of precision : 분수를 2진법으로 표현하면 무한 소수가 되면서 정밀도 손실이 일어난다.

### 숫자형과 진수

1. 자바스크립트에서는 16진수, 2진수, 8진수를 이용한 수의 표현을 지원한다.
    - 16진수 : `0x`
    - 2진수 : `0b`
    - 8진수 : `0o`
2. `num.toString(base)` 를 이용하면 base 진법으로 num을 표현하여 문자형으로 반환한다.
    ```js
    num.toString(16);
    (123456).toString(36); // 숫자에 직접 메소드를 호출할 때는 점을 두개 붙인다.
    ```

### 어림수

1. `Math.floor` : 소수점 첫째 자리에서 버린다.
2. `Math.ceil` : 소수점 첫째 자리에서 올린다.
3. `Math.round` : 소수점 첫째 자리에서 반올림을 한다.
4. `Math.trunc` : 소수부를 무시한다.
5. `num.toFixed(n)` : 소수점 n번째 자리까지 계산하여 문자열로 반환한다.

### 숫자의 구분

1. `isNaN`과 `isFinity`를 이용하여 일반 숫자와 특수 값을 구분할 수 있다.
    - isNaN은 NaN이 아닌 숫자형을 인수로 받았을 떄 true를 반환한다.
    - isFinity는 NaN과 Infinity/-Infinity가 아닌 숫자형을 인수로 받았을 떄 true를 반환한다.
2. `parseInt`와 `parseFloat`를 이용하면 문자열에서 수집된 숫자를 반환한다.
    - parseInt는 정수를 반환한다.
    - parseFloat는 부동 소수점 숫자를 반환한다.
    - 문자열을 읽던 도중 숫자가 아닌 값이 존재하면 읽기를 멈춘다.

### 기타 수학 함수

1. `Math.random` : 0과 1 사이의 난수를 생성한다.
2. `Math.max` / `Math.min` : 인수 중 최댓값/최솟값을 반환한다.
3. `Math.pow(n, power)` : n을 power번 거듭제곱한 값을 반환한다.

---

## 문자열

### 문자열 개요

1. 문자열은 항상 UTF-16 형태를 따른다.
2. 따라서 문자열을 비교할 때는 UTF-16 코드의 대소를 비교하여 결과를 반환한다.
3. 문자열 내에 따옴표를 사용하려면 따옴표 앞에 `\`를 붙여줘야 한다.
4. 문자열은 프로퍼티로 `length`를 가진다. length 프로퍼티는 문자열의 길이를 값으로 가진다.

### 문자열 인덱싱

1. 문자열의 특정 값을 인덱스를 이용하여 접근할 수 있다. 문자열에 `[index]`이나 `.charAt(index)`를 이용한다.
2. 문자열은 수정할 수 없다. 따라서 특정 인덱스 값을 바꾸려고 하면 오류가 난다.
3. 문자열에 `.slice(start [, end])` 또는 `.substring(start [, end])`메소드를 이용하면 문자열 인덱싱이 가능하다.
   </br> 두 메소드는 상당히 유사하지만 다음과 같은 차이점을 보인다.
    - slice 메소드는 인자로 음수를 받을 수 있다. (substring은 음수 인자를 받으면 0으로 처리한다.)
    - substring 메소드는 start가 end보다 커도 된다. (slice는 안 된다.)
4. 문자열에 `.substr(start [, length])` 메소드를 이용하면 시작점에서 length 길이 만큼의 문자열을 반환한다.

### 부분 문자열 확인

1. 문자열에 `.indexOf(substr, pos)` 메소드를 이용하면 substr이 pos번째로 등장하는 인덱스값을 반환한다.
2. 문자열에 `.includes(substr, pos)`메소드를 이용하면 pos번째 인덱스부터 substr이 존재하는지 여부를 boolean값으로 반환한다.
3. 문자열에 `.startsWith(substr)` 또는 `.endsWith(substr)` 메소드를 확인하면 문자열의 처음또는 끝에 substr이 존재하는지 여부를 boolean값으로 반환한다.

---

## 배열

1. 배열은 아래 두 가지 방법으로 선언한다.
    ```js
    let arr = new Array(length); // 길이를 지정할 수 있다.
    let arr = [];
    ```
2. 배열 안의 값은 인덱스를 이용하여 접근할 수 있다.
3. 배열은 어떤 자료형이라도 요소로 가질 수 있다. 배열을 요소로 가지는 배열은 `다차원 배열`이라 한다.
4. 배열의 본질은 객체이므로 참조 복사가 이루어진다.
5. 배열에 적용할 수 있는 대표적인 순회 문법으로는 `for..of`가 있다.
   </br> `for..in`은 키가 숫자가 아닌 프로퍼티도 대상으로 순환하기 때문에 필요 없는 프로퍼티가 문제를 일으킬 가능성이 생기므로 지양한다.
6. `toString()` 메서드를 사용하면 배열의 요소를 쉼표로 구분한 문자열이 반환된다.
7. `.isArray()` 메서드를 사용하면 인자가 배열인지 여부를 boolean값으로 반환한다.
8. 배열 메소드는 `thisArg`라는 매개변수를 가질 수 있는데, 이는 배열에 적용시키려는 메소드의 this를 가리킨다.

### length 프로퍼티

1. length 프로퍼티는 가장 큰 인덱스에 1을 더한 값이다.
2. length 값 수정을 통해 배열을 자르는 것은 가능하지만, 수동으로 증가시키는 것은 불가능하다.

### 배열과 자료 구조

1. 배열을 이용하여 자료구조 `큐(queue)`를 구현할 수 있다. → 선입선출 구현
    - `push()` 메소드를 이용하면 맨 끝에 요소를 추가할 수 있다.
    - `shift()` 메소드를 이용하면 제일 앞 요소를 꺼내 제거한 후, 남아있는 순서대로 인덱스를 다시 부여한다.
2. 배열을 이용하여 자료구조 `스택(stack)`을 구현할 수 있다. → 후입선출 구현
    - `push()` 메소드를 이용하면 맨 끝에 요소를 추가할 수 있다.
    - `pop()` 메소드를 이용하면 제일 마지막 요소를 꺼내 제거한 후, 남아있는 순서대로 인덱스를 다시 부여한다.
3. `unshift()` 메소드를 이용하면 제일 앞에 요소를 추가할 수 있다.
4. 제일 앞의 요소에 접근하는 메소드들은 맨 끝의 요소에 접근하는 메소드보다 해야할 연산이 많기 떄문에 속도가 느리다.
    - 맨 앞의 요소 제거 또는 추가
    - 인덱스 재설정
    - length 프로퍼티 갱신

### 배열의 분할

1. `.splice()` 메서드를 이용하면 배열의 요소 추가, 삭제, 교체가 모두 가능하다.
   </br>메소드가 실행되면 배열을 수정한 뒤, 삭제된 요소들로 구성된 배열을 반환한다.
    ```js
    arr.splice(index[, deleteCount, elem1, ..., elemN])
    ```
2. `.slcie()` 메서드를 이용하면 배열의 특정 구간을 복사한 새로운 배열을 반환한다.
    ```js
    arr.slice([start], [end]);
    ```
3. `.concat()` 메서드를 이용하면 배열들끼리 병합한 하나의 새로운 배열을 반환한다.
    ```js
    arr.concat(arg1, arg2...)
    ```
4. `.forEach()`는 인자로 받은 함수를 배열 요소 각각에 실행한다. 결과는 반환되지 않는다.
    ```js
    arr.forEach(function (item, index, array) {
    	// 요소에 무언가를 할 수 있습니다.
    });
    ```

### 배열의 탐색

1. `.indexOf(item, from)`나 `.lastIndexOf(item, from)`를 이용하면 인덱스를 통해 배열을 탐색할 수 있다.
    - indexOf는 인덱스 from부터 순차적으로 item을 찾아 item의 인덱스를 반환한다.
    - lastIndexOf는 끝에서부터 인덱스 from까지 역순으로 item을 찾아 item의 인덱스를 반환한다.
2. `.includes(item, from)`은 인덱스 from부터 시작해 item의 유무를 boolean값으로 반환한다.
3. `.find(func)`나 `.findIndex(func)`를 이용하면 객체로 이루어진 배열에서 특정 조건에 부합하는 객체를 찾을 수 있다.
   </br> 조건을 충족하는 요소가 여러개일 경우 `.filter(func)`를 이용한다.

### 배열의 변형

1. `map(func)`을 이용하면 모든 요소에 func을 호출하고, func이 적용된 새로운 배열을 반환한다.
2. `sort(func)` – 주어진 배열의 내부 요소를 func를 기준으로 정렬한다.
3. `reverse()` – 주어진 배열의 내부 요소를 역순으로 정렬한다.
4. `split/join` – 문자열을 배열로, 배열을 문자열로 반환다.
5. `reduce(func, initial)` – 요소를 차례로 돌면서 func을 호출한다. 이떄, 반환값을 다음 함수 호출에 전달하여 최종적으로 하나의 값이 도출된다.
    ```js
    let value = arr.reduce(
    	function (accumulator, item, index, array) {
    		// ...
    	},
    	[initial]
    );
    ```
    - accumulator : 이전 함수 호출의 결과
    - item : 현재 배열 요소
    - index : 요소의 위치
    - array : 배열
    - initial : 함수 최초 호출 시 사용되는 초깃값을 나타냄(옵션)

---

## iterable 객체

1. iterable 객체는 반복 가능한 객체를 뜻한다. 즉, `for..of` 반복문을 적용할 수 있는 객체이다.
2. 객체에 `[Symbol.interator]` 라는 프로퍼티를 추가해주면 객체를 이터러블로 만들 수 있다.
   </br> 이때, [Symbol.interator] 프로퍼티 값은 함수 형태로, 반복문에서 호출될 `next()` 메소드를 반환한다.

    ```js
    range[Symbol.iterator] = function () {
    	// Symbol.iterator는 이터레이터 객체를 반환한다.
    	// 2. 이후 for..of는 반환된 이터레이터 객체만을 대상으로 동작하는데, 이때 다음 값도 정해집니다.
    	return {
    		current: this.from,
    		last: this.to,

    		// 3. for..of 반복문에 의해 반복마다 next()가 호출됩니다.
    		next() {
    			// 4. next()는 값을 객체 {done:.., value :...}형태로 반환해야 한다.
    			if (this.current <= this.last) {
    				return { done: false, value: this.current++ };
    			} else {
    				return { done: true };
    			}
    		},
    	};
    };
    ```

### 이터러블과 유사 배열

1. 이터러블(iterable) 은 메서드 Symbol.iterator가 구현된 객체이다.
2. 유사 배열(array-like) 은 인덱스와 length 프로퍼티가 있어서 배열처럼 보이는 객체이다.
3. `Array.from()`은 인자를 받아 배열로 변환해준다. 이를 통해 이터러블이나 유사 배열에 배열 메소드를 적용할 수 있다.
4. 함수에 유사 배열 객체 `arguments`를 이용하면 인덱스를 사용하여 인수에 적용할 수 있다.

---

## 맵

1. `맵(Map)`은 키에 다양한 자료형을 허용한다.
2. 맵의 주요 메서드와 프로퍼티는 다음과 같다.
    - `new Map()` : 맵을 만든다.
    - `.set(key, value)` : key를 이용해 value를 저장하고 map 자신을 반환한다.
    - `.get(key)` : key에 해당하는 값을 반환한다. key가 존재하지 않으면 undefined를 반환한다.
    - `.has(key)` : key가 존재하면 true, 존재하지 않으면 false를 반환한다.
    - `.delete(key)` : key에 해당하는 값을 삭제한다.
    - `.clear()` : 맵 안의 모든 요소를 제거한다.
    - `.size` : 요소의 개수를 반환한다.
3. 각 요소가 키-값 쌍인 배열이나 이터러블 객체를 초기화 용도로 맵에 전달해 새로운 맵을 만들 수 있다.

### 맵과 객체

1. 평범한 객체를 가지고 맵을 만들고 싶다면 내장 메서드 `Object.entries(obj)`를 사용할 수 있다
   </br> 메서드 실행 시 키-값 쌍을 요소([key, value])로 가지는 배열을 반환한다.
2. 맵을 객체로 변환하려면 `Object.fromEntries(map.entries())`를 사용할 수 있다.
   </br> .entries()는 생략 가능하다.
3. Object.entries와 Object.fromEntries를 순차적으로 적용하면 객체에도 배열 전용 메서드 사용할 수 있다.

### 맵과 반복

1. `.keys()` 매소드를 이용하면 각 요소의 키를 모은 반복 가능한(iterable, 이터러블) 객체를 반환한다.
2. `.values()` 매소드를 이용하면 각 요소의 값을 모은 이터러블 객체를 반한다.
3. `.entries()` 매소드를 이용하면 요소의 [키, 값]을 한 쌍으로 하는 이터러블 객체를 반환한다. 이 이터러블 객체는 for..of반복문의 기초로 쓰인다.
4. 맵은 내장 메서드로 `.forEach()`를 지원한다.

### 위크맵

1. 위크맵은 키가 반드시 객체인 자료형이다.
2. 위크맵의 주요 메서드와 프로퍼티는 다음과 같다.
    - `new WeakMap()` : 위크맵을 만든다.
    - `.get(key)`
    - `.set(key, value)`
    - `.delete(key)`
    - `.has(key)`
3. 위크맵의 요소(키/값) 전체를 대상으로 무언가를 하는 메서드는 동작 자체가 불가능하다.
   </br> 객체는 모든 참조를 잃게 되면 자동으로 가비지 컬렉션의 대상이 되는데, 가비지 컬렉션의 동작 시점은 정확히 알 수 없기 때문이다.

### 위크맵의 사용 케이스

1. 위크맵은 하나의 작업을 수행하는 동안에만 필요한 데이터를 저장하는 데 유용하다.
2. 위크맵은 `캐싱(caching)`이 필요할 때 유용한다,  
   </br> 캐싱은 시간이 오래 걸리는 작업의 결과를 저장해서 연산 시간과 비용을 절약해주는 기법이다.

---

## 셋

1. `셋(Set)`은 중복을 허용하지 않는 컬렉션이다.
2. 셋은 키가 없는 값이 저장된다.
3. 셋의 주요 메서드와 프로퍼티는 다음과 같다.
    - `new Set(iterable)` : 셋을 만든다. 이터러블 객체를 전달받으면(대개 배열을 전달받음) 그 안의 값을 복사해 셋에 넣어준다.
    - `.add(value)` : 값을 추가하고 셋 자신을 반환한다.
    - `.delete(value)` : 값을 제거한다. 호출 시점에 셋 내에 값이 있어서 제거에 성공하면 true, 아니면 false를 반환한다.
    - `.has(value)` : 셋 내에 값이 존재하면 true, 아니면 false를 반환한다.
    - `.clear()` : 셋을 비운다.
    - `.size` : 셋에 몇 개의 값이 있는지 세준다.

### 셋과 반복 작업

1. for..of나 forEach를 사용하면 셋의 값을 대상으로 반복 작업을 수행할 수 있다.
2. `.keys()` : 셋 내의 모든 값을 포함하는 이터러블 객체를 반환한다.
3. `.values()` : `.keys와 동일한 작업을 한다. 맵과의 호환성을 위해 만들어진 메서드이다.
4. `.entries()` : 셋 내의 각 값을 이용해 만든 [value, value] 배열을 포함하는 이터러블 객체를 반환한다. 맵과의 호환성을 위해 만들어다.

### 위크셋

1. 위크셋은 객체만 저장할 수 있는 셋과 같은 자료 구조이다.
2. 셋 안의 객체는 도달 가능할 때만 메모리에서 유지된다.
3. 위크셋은 `add`, `has`, `delete` 등의 단순한 메서드만 지원된다.

---

## 구조 분해 할당

1. `구조 분해 할당`은 객체나 배열을 변수로 분해할 수 있게 해주는 문법이다.
2. 객체나 배열이 다른 객체나 배열을 포함할 경우 `중첩 구조 분해`가 이루어진다.
3. 구조 분해 할당은 매개변수가 많은 함수에 매개변수를 전달할 때 유용하게 쓰인다.

    ```js
    // 함수에 전달할 객체
    let options = {
    title: "My menu",
    items: ["Item1", "Item2"]
    };

    // 똑똑한 함수는 전달받은 객체를 분해해 변수에 즉시 할당함
    function showMenu({title = "Untitled", width = 200, height = 100, items = []}) {
    // title, items – 객체 options에서 가져옴
    // width, height – 기본값
    ...
    }

    showMenu(options)
    ```

### 배열의 구조 분해 할당

1. 배열은 `let [first, second, ...] = arr` 형태로 분해할 수 있다. arr의 요소들이 순차적으로 변수에 할당된다.
2. 쉼표를 사용하면 필요하지 않은 배열 요소를 버릴 수 있다.
    ```js
    let [first, , third] = arr; // arr의 두번째 요소의 할당은 생략한다.
    ```
3. 할당 연산자 `=` 좌측엔 할당 가능한 무엇이든 올 수 있고, 우측엔 모든 이터러블이 올 수 있다.
4. 점 세개 `...`을 붙인 매개변수를 추가하면 나머지 요소들을 새로운 배열로 가져올 수 있다.
    ```js
    let [first, second, ...rest] = arr; // arr의 첫번째, 두번째 요소가 할당되고, 남은 요소들은 rest에 배열로 할당된다.
    ```
5. 할당 연산자 좌측의 변수에는 기본값을 설정할 수 있다.
    ```js
    let[first = "first value", second = "second value", ...] = arr;
    ```

### 객체의 구조 분해 할당

1. 객체는 `let {first, second, ...} = obj` 형태로 분해할 수 있다.
   </br> 이 때, 할당 연산자 좌측엔 객체의 key가 와야하고, 각 key에 해당하는 value값이 할당된다.
2. `:`을 이용하여 객체 프로퍼티 key와 목표 변수를 연결해줄 수 있다.

    ```js
    let obj = {
    	first: "first value",
    	second: "second value",
    	third: "third value",
    };

    let { first: st, second: nd, third } = obj;

    console.log(st); // "first value"
    console.log(nd); // "second value"
    console.log(third); // "third value"
    ```

3. 프로퍼티가 없는 경우를 대비하여 `=`를 사용해 기본값을 설정할 수 있다.
    ```js
    let { fist = "first value", second, third } = obj; // first 변수에 기본값 설정
    ```
4. 콜론과 할당 연산자를 동시에 사용할 수 있다.
5. 점 세개 `...`을 붙인 매개변수를 추가하면 할당되지 않은 프로퍼티들을 새로운 객체로 가져올 수 있다.
6. 기존에 선언한 변수를 대상으로 구조 분해 할당을 진행할 때는 할당문을 모두 괄호 `()`로 감싸 자바스크립트가 `{}`를 코드 블럭이 아닌 표현식으로 해석하게끔 해주어야 한다.

---

## Date 객체와 날짜

### Date 객체

1. `new Date()`로 새로운 Date 객체를 생성한다.
2. `new Date(milliseconds)`는 UTC 기준(UTC+0) 1970년 1월 1일 0시 0분 0초에서 milliseconds 밀리초(1/1000 초) 후의 시점이 저장된 객체를 반환한다.
   </br> 1970년의 첫날을 기준으로 흘러간 밀리초를 나타내는 정수는 타임스탬프(timestamp) 라고 부른다.
3. `new Date(datestring)`은 인수로 받은 문자열을 자동으로 구문 분석(parse)하여 객체를 반환한다.
4. `new Date(year, month, date, hours, minutes, seconds, ms)`는 주어진 인수를 조합해 만들 수 있는 날짜가 저장된 객체를 반환한다.
   </br> year과 month는 필수값이다.
    - year는 반드시 네 자리 숫자여야 한다.
    - month는 0(1월)부터 11(12월) 사이의 숫자여야 한다.
    - date는 일을 나타내는데, 값이 없는 경우엔 1일로 처리한다.
    - hours/minutes/seconds/ms에 값이 없는 경우엔 0으로 처리한다.
5. Date 객체엔 `자동 고침`이라는 기능이 있어서 범위를 벗어나는 값을 설정하려고 하면 자동으로 수정된다.
6. Date 객체를 숫자형으로 변경하면 타임스탬프 값이 된다.

### 날짜 구성요소 얻기

1. 후술될 메서드들은 모두 현지 시간 기준 날짜를 반환한다.
   </br>표준시 기준의 반환값을 얻으려면 메서드명의 get 다음에 `UTC`를 붙여주면 된다.
2. `getFullYear()`는 연도(네 자릿수)를 반환한다.
3. `getMonth()`는 월을 반환한다.(0 이상 11 이하).
4. `getDate()` 일을 반환한다.(1 이상 31 이하).
5. `getHours()`, `getMinutes()`, `getSeconds()`, `getMilliseconds()`는 각각 시, 분, 초, 밀리초를 반환한다.
6. `getDay()`는 일요일을 나타내는 0부터 토요일을 나타내는 6까지의 숫자 중 하나를 반환한다.
7. `getTime()`은 주어진 일시와 1970년 1월 1일 00시 00분 00초 사이의 간격(밀리초 단위)인 타임스탬프를 반환한다.
   </br> `Date.now()`를 이용하면 Date 객체를 만들지 않고도 타임스탬프 값을 얻을 수 있다. getTime()을 사용하는 것보다 성능 면에서 우월하다.
8. `getTimezoneOffset()`은 현지 시간과 표준 시간의 차이(분)를 반환한다.

### 날짜 구성요소 선택하기

1. 후술될 메서드들은 모두 현지 시간 기준 날짜 구성요소를 설정한다.
   </br>표준시 기준의 반환값을 얻으려면 메서드명의 set 다음에 `UTC`를 붙여주면 된다. (setTime()은 제외)
2. 날짜 구성요소 선택에 사용 가능한 메서드들은 다음과 같다.
    - setFullYear(year, [month], [date])
    - setMonth(month, [date])
    - setDate(date)
    - setHours(hour, [min], [sec], [ms])
    - setMinutes(min, [sec], [ms])
    - setSeconds(sec, [ms])
    - setMilliseconds(ms)
    - setTime(milliseconds) (1970년 1월 1일 00:00:00 UTC부터 밀리초 이후를 나타내는 날짜를 설정)

### Date.parse와 문자열

1. `Date.parse(str)` 메서드를 사용하면 문자열에서 날짜를 읽어올 수 있다.
2. 문자열의 형식은 `YYYY-MM-DDTHH:mm:ss.sssZ`처럼 생겨야 한다.
   </br> YYYY-MM-DD, YYYY-MM, YYYY같이 앞의 일부분만 사용하는 것도 가능하다.
    - YYYY-MM-DD : 날짜(연-월-일)
    - "T" : 구분 기호로 쓰임
    - HH:mm:ss.sss : 시:분:초.밀리초
    - 'Z'(옵션) : +-hh:mm 형식의 시간대를 나타냄. Z 한 글자인 경우엔 UTC+0을 나타냄

---

## JSON과 메서드

1. `JSON(JavaScript Object Notation)`은 값이나 객체를 나타내주는 범용 포맷이다.

### JSON.stringify

1. `JSON.stringify`를 이용하면 객체를 JSON으로 바꿀 수 있다. JSON으로 변환된 값의 type은 문자열이다.
2. JSON.stringfy는 배열과 원시형에도 적용할 수 있다.
3. 함수(메서드), 심볼, undefined에 JSON.stringify이 적용되면 아무 것도 반환하지 않는다.
4. 순환 참조가 있으면 객체를 문자열로 바꾸는 게 불가능하다.
5. JSON.stringfy에 인자로 `replacer`를 주면 원하는 프로퍼티만 직렬화할 수 있다.
    ```js
    let json = JSON.stringify(value[, replacer, space])
    ```
    - value : 인코딩 하려는 값
    - replacer : JSON으로 인코딩 하길 원하는 프로퍼티가 담긴 배열. 또는 매핑 함수 function(key, value)
    - space : 서식 변경 목적으로 사용할 공백 문자 수
6. 객체에 `toJSON` 메서드가 구현되어 있으면 객체를 JSON으로 바꿀 수 있다.

### JSON.parse

1. `JSON.parse`를 이용하면 JSON을 객체로 바꿀 수 있다.
    ```js
    let value = JSON.parse(str, [reviver]);
    ```
    - str : JSON 형식의 문자열
    - reviver : 모든 (key, value) 쌍을 대상으로 호출되는 function(key,value) 형태의 함수로 값을 변경시킬 수 있다.
