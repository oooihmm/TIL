# Swift

## 변수와 상수

1. 변수 `variable` : 값을 수정할 수 있음

```
var name = "Jinseon"
```

2. 상수 `constant` : 값을 수정할 수 없음

```
let year = 2025
```

## Swift와 타입

Swift는 `정적 타이핑 언어`로, 각 변수나 상수에 대한 자료형의 명시가 필요

1. 타입 추론 `Type Inference`

```
let year = 2025
```

초기값을 지정하면 컴파일러가 자동으로 타입을 추론하여 부여함

1. 원하는 타입으로 추론되지 않을 수 있음 (ex : Float → Double)
2. 초기 값이 없을 경우 컴파일 에러 발생

3. 타입 어노테이션 `Type Annotation`

```
let name: String = "Jinseon"
```

변수명 (혹은 상수명) 옆에 타입을 지정

3. 타입 변경

서로 다른 자료형의 경우, 연산이 불가능
자료형이 일치하도록 변경해주어야 함

```
let year: Int = 2002
var height: Float = 155.0

year + height // error
Float(year) + height // 2157.0
```

문자열로 변경

```
let name: String = "진선이"
var height: Int = 155

"\(name)의 키는 \(height)cm 입니다." // 진선이의 키는 155cm 입니다.
```

## 배열의 타입 어노테이션

배열의 선언

```
var languages = ["Swift", "Objective-C", "Python"]
```

배열에 접근할 때는 `index`를 사용

```
languages[0] // Swift
```

배열의 타입 어노테이션

var 변수명: [타입] = [배열 ...]

```
var languages: [String] = ["Swift", "Objective-C", "Python"]
```

빈 배열 선언

```
var languages: [String] = []
var languages = [String]() // 생성자 호출
```

## 딕셔너리의 타입 어노테이션

딕셔너리는 key와 value로 구성됨

딕셔너리의 선언

```
var capitals = [
  "한국": "서울",
  "일본": "도쿄",
  "중국": "베이징",
]
```

딕셔너리에 접근할 때는 `key`를 사용

```
capitals[한국] // 서울
```

딕셔너리의 타입 어노테이션

var 변수명: [key 타입: value 타입] = [딕셔너리 ...]

```
var capitals: [String: String] = [
  "한국": "서울",
  "일본": "도쿄",
  "중국": "베이징",
]
```

빈 딕셔너리 선언

```
var capitals: [String: String] = [:]
var capitals = [String: String]() // 생성자 호출
```

## 옵셔널 `Optional`

### `nil`

값이 없는 상태

- `""` : 빈 값
- `[]` : 빈 배열
- `[:]` : 빈 딕셔너리
- `nil` : 값이 없음 (선언되지 않음)

### `Optional`

값이 있을 수도 있고 없을 수도 있는 것

이러한 변수를 선언할 때는 타입 어노테이션에 `?` 를 붙여줘야 함

```
var email: String?
print(email) // nil

email = "devxoul@gmail.com"
print(email) // Optional("devxoul@gmail.com")
```

옵셔널로 정의된 변수에 값을 선언하였더라도, 자료형이 확실히 선언된 값과는 다른 타입으로 취급함

```
let optionalEmail: String? = "devxoul@gmail.com"
let requiredEmail: String = optionalEmail // 컴파일 에러!
```

## 조건문

### 조건 연산자

1. `==`

값이 같은지를 비교, 타입까지 모두 동일해야 같은 값으로 취급

2. 삼항조건연산자 `?:`

```
조건 ? 참일 때 값 : 거짓일 때 값
```

### 조건식

Swift에서는 `!` 연산자 사용을 오직 `Boolean` 타입에만 사용할 수 있음

1. 논리 조건식을 사용

```
if (!(x > 0)) {
    // x가 0 이하일 때 실행
}

```

2. Bool 타입으로 명시적 변환

```
let x: Int = 5;

if (x == 0) {
    // x가 0일 때 실행
}

```

3. Bool 타입을 반환하는 프로퍼티 사용

```
let arr: [Int] = []

if (arr.isEmpty) {
    // arr의 길이가 0일 때 실행
}
```

### if문

`if문`의 조건절에는 값이 정확하게 참 혹은 거짓으로 나오는 `Bool` 타입을 사용

```
var age = 19
var student = ""

if age >= 8 && age < 14 {
  student = "초등학생"
} else if age < 17 {
  student = "중학생"
} else if age < 20 {
  student = "고등학생"
} else {
  student = "기타"
}

student // 고등학생
```

### switch문

다중 분기 처리에 사용

```
let direction = "left"

switch direction {
case "left":
    print("왼쪽으로 갑니다")
case "right":
    print("오른쪽으로 갑니다")
default:
    print("직진합니다")
}
```

swift에서는 `switch문`을 통한 패턴 매칭이 가능

1. 범위 매칭

```
switch age {
case 8..<14:
  student = "초등학생"
case 14..<17:
  student = "중학생"
case 17..<20:
  student = "고등학생"
default:
  student = "기타"
}
```

`8..<14`와 같이 범위 `range` 내에 값이 포함되어 있는지 여부를 확인 가능

2. 튜플 매칭

```
let point = (0, 0)

switch point {
case (0, 0):
    print("원점입니다")
case (_, 0):
    print("x축 위에 있습니다")
case (0, _):
    print("y축 위에 있습니다")
default:
    print("기타")
}
```

좌표 등 여러 값 한꺼번에 비교

(\_, 0) 같이 부분적으로만 값을 확인할 수 있음

3. 조건부 매칭

```
let point = (1, -1)

switch point {
case let (x, y) where x == y:
    print("x와 y가 같습니다.")
case let (x, y) where x == -y:
    print("x는 y의 음수입니다.")
default:
    print("다른 점입니다.")
}
```

`where`는 case 구문에 조건을 부여하여 보다 정교한 분기를 가능하게 함

4. enum 매칭

```
enum Result {
    case success(data: String)
    case failure(errorCode: Int)
}

let result = Result.failure(errorCode: 404)

switch result {
case .success(let data):
    print("성공: \(data)")
case .failure(let code) where code == 404:
    print("404 오류")
default:
    print("기타 오류")
}
```

enum(열거형)은 관련된 값들을 그룹으로 묶어 이름을 붙이는 사용자 정의 타입

`switch문`을 사용하면 열거형과 연관값을 분해하여 조건으로 매칭할 수 있음

## 반복문

### for문

1. 배열과 딕셔너리를 순회

```
for language in languages {
  print("저는 \(language) 언어를 다룰 수 있습니다.")
}

for (country, capital) in capitals {
  print("\(country)의 수도는 \(capital)입니다.")
}
```

2. 특정 범위만큼 순회

```
for i in 0..<100 {
  i
}

for _ in 0..<100 {
  print("Hello")
}
```

3. 루프 내에 조건 추가

```
let numbers = [1, 2, 3, 4, 5, 6]

for number in numbers where number % 2 == 0 {
    print("\(number)는 짝수입니다.")
}
```

`where`는 반복 중 조건을 만족하는 항목만 처리하도록 지정해줌

### while 문

조건문이 false가 되기 전까지 계속 반복

```
var i = 0

while i < 100 {
  i += 1
}
```

## 옵셔널 바인딩 `Opitional Binding`

옵셔널의 값이 존재하는지를 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입하는 방법

1. 단일 옵셔널 바인딩

```
if let email = optionalEmail {
  print(email) // optionalEmail의 값이 존재한다면 해당 값을 출력
}
// optionalEmail의 값이 존재하지 않는다면 if문을 그냥 지나침
```

`if let` 또는 `if var`를 사용하고, 값이 nil이 아닐 때만 대입

2. 여러 옵셔널을 바인딩

```
if let name = optionalName,
  let email = optionalEmail {
  // name과 email 값이 존재
}
```

모든 옵셔널의 값이 존재해야 실행됨

3. 옵셔널과 조건문

```
var optionalAge: Int? = 22

if let age = optionalAge, age >= 20 {
  // age의 값이 존재하고, 20 이상입니다.
}
```

콤마 이후의 조건문은 옵셔널 바인딩이 적용된 값을 기준으로 실행

## 옵셔널 체이닝 `Opitional Chaining`

옵셔널의 속성에 접근할 때, 옵셔널 바인딩 과정을 `?` 키워드로 줄임

```
let isEmptyArray = array?.isEmpty // Bool?
```

1. array가 nil인 경우

```
array? // nil 반환
```

2. array가 빈 배열인 경우

```
array?.isEmpty // true 반환
```

3. array가 빈 배열이 아닌 경우

```
array?.isEmpty // false 반환
```

## 옵셔널 벗기기 `Unwrapped Optional`

### `!` 키워드

옵셔널에 값이 있다고 가정하고 값에 바로 접근할 수 있도록 하는 키워드

```
let optionalEmail: String? = sttaurt@gmail.com

print(optionalEmail) // Optional("sttaurt@gmail.com")
print(optionalEmail!) // sttaurt@gmail.com
```

옵셔널의 값이 nil인 경우에는 런타임 에러 발생

### Implicitly Unwrapped Optional

암묵적으로 벗겨진 옵셔널
옵셔널을 정의할 떄 `?` 대신 `!`를 사용하여 정의한 것

```
let email: String! = sttaurt@gmail.com

print(email) // sttaurt@gmail.com
```

이 변수는 nil을 포함할 수 있지만, 접근 과정에서 옵셔널 바인딩이나 옵셔널을 벗기지 않고도 바로 값에 접근할 수 있음

옵셔널의 값이 nil인 경우에는 런타임 에러 발생
