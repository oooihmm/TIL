# Dart

https://www.dartpad.dev/ : 별도의 설치 없이 코드 작성 후 실행 가능 

## 1. Dart 변수

### 타입 지정 변수 선언
```dart
void main() {
  int v1 = 1;
  double v2 = 11.11;
  bool v3 = true;
  String v4 = "안녕하세용";

  print("정수 : ${v1.runtimeType}");
  print("실수 : ${v2.runtimeType}");
  print("부울 : ${v3.runtimeType}");
  print("문자열 : ${v4.runtimeType}");
}
```

### 2. 타입 추론 변수 선언
```dart
void main() {
  var v5 = 20; // 변수에 한 번 타입 지정시 다른 타입으로 선언 불가
  dynamic v6 = 3.5; // 변수에 타입을 지정해도 다른 타입으로 바꿀 수 있음
  
  print("${v5.runtimeType}"); // int
  print("${v6.runtimeType}"); // double
}
```
---
## 2. 연산자

### 산술연산자
- 더하기, 빼기, 곱하기, 나누기
- 나머지 : %
- 몫 나머지 : ~/

### 비교연산자
- 같다 : ==
- 다르다 : !=
- 크다, 작다, 크거나같다, 작거나같다

### 논리연산자
- not : !
- and : &&
- or : ||

## 3. 조건문

### if문
```dart
if () {
  
} else if () {

} else {

}
```

### 3항 연산자
```dart
조건 ? "참일 때의 값"  : "거짓일 때의 값"
```

### null 대체 연산자
```dart
변수 ?? "변수가 null이 아닐 때 대체될 값"
```
---
## 4. 함수
```dart
리턴타입 함수이름(매개변수) {
  return 반환값
}

void main() {
  변수타입 변수명 = 함수이름(매개변수) // 함수 호출
}
```

### 익명함수
함수에 이름이 없는 함수
```
(매개변수) {
  동작코드
}
```

### 람다식
``` dart
(매개변수) => 동작코드
```
익명함수나 람다식을 매개변수로 전달받거나 변수에 대입 할 때는 `Function` 키워드 사용

---
##  5. 클래스
```dart
class Dog {
  String name = "Toto";
  int age = 3;
  int thirsty = 100;

  void drintWater() {
    thirsty = thirsty - 20;
  }
}

void main() {
  Dog d1 = Dog();
  d1.drintWater();
}
```

### 생성자
```dart
class Dog {
  String name;
  int age;
  int thirsty; 

  Dog(this.name, this.age, this.thirsty) {}
}

void main() {
  Dog d1 = Dog("Toto", 3, 100);
}
```

### 선택적 매개변수
```dart
class Dog {
  String name;
  int age;
  int thirsty; 
  
  Dog({this.name="PoPo", this.age=3, this.thirsty=100});
}

void main() {
  Dog d1 = Dog(age:3, thirsty:100);
  print(d1.name);
}
```

### cascade 연산자
```dart
class Dog {
  String name;
  Dog(this.name);
  void hello() {
    print("멍멍 안녕하세요");
  }
}

void main() {
  Dog d1 = Dog("PoPo")..hello();
  print("-${d1.name}");
}
```
---
## 6. 상속
