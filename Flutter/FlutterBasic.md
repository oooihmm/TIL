# Flutter Basic

`stless + tab` : class 생성 자동완성

```dart
import 'package:flutter/material.dart';

void main() { // main 함수 내부의 내용만 실행됨
  runApp(const MyApp());
}

// 앱의 메인 페이지
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 메인페이지 디자인 작성
    return ...
  }
}
```

Flutter의 앱 디자인 방법 : 위젯 추가를 통한 디자인 진행

    위젯 : 대문자로 시작 PascalCase, 끝에 소괄호()를 가짐 
    속성 : 소문자로 시작 camelCase
    속성값(일부) : 대문자로 시작 PascalCase, 보통 속성 이름을 파스칼 케이스로 쓰는 경우가 많음

### 위젯의 종류

1. Text 위젯 : `Text()`
2. Icon 위젯 : `Icon(Icons.이름)`
3. Image 위젯 : `Image.asset('경로')`
    
    이미지는 `assets` 폴더를 만들어서 관리
    
    pubspec.yaml 애서 이미지 등록
    ```yaml
    flutter:
      assets:
        - 이미지 경로 작성
    ```
4. Container 위젯 : `Container()` 또는 `Sizedbox()`

    기본 컨테이너는 아무것도 없는 형태이고, 특성 값을 지정해줘야 함.

### 위치 기준점 설정
부모를 기준으로 자식의 위치를 선정

```dart
MaterialApp(
  home: Center( // 자식 위젯의 기준점을 중앙으로 설정
    child: 위젯
  )
)
```
`MaterialApp()` : 위젯의 한 종류, 이 위젯을 사용하면 구글이 제공하는 Material Thema를 이용하여 디자인 할 수 있음, 그 외에도 다양한 세팅을 제공하기 때문에 커스터마이징 시에도 일반적으로 사용

`Cupertino...()` : 애플이 제공하는 Material Thema를 이용하여 디자인 할 수 있음

---

## Layout

`Scaffold()` : 위젯을 상중하로 나눠줌
```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(),
    body: Container(),
    bottomNavigationBar: BottomAppBar(),
  )
);
```

`Row()` : 위젯을 가로로 배치함

`Column()` : 위젯을 세로로 배치함

`ListView()` : 위젯을 세로로 배치하고, 스크롤바가 생김
</br>
</br>
`mainAxisAlignment: MainAxisAlignment.속성` : Row 또는 Column 요소의 축에 대해서 정렬하는 속성

`crossAxisAlignment: CrossAxisAlignment.속성` : Row 또는 Column 요소의 축의 역방향에 대해서 정렬하는 속성

-> Layout 관련 위젯 (Row, column, ...) 에는 높이나 크기 속성을 줄 수 없음! 
    
    ~ SizedBox()나 Container() 안에 배치해서 속성값을 물려받을 수 있음

```dart
MaterialApp(
  home: Scaffold(
    body: SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.속성
        children: [
          위젯, 위젯, ...
        ]
      )
    )
  )
);
```

---

## Container 

`Container()` : 기본 Box 위젯
Container에는 속성 값을 지정해 줌으로써 다양하게 디자인 할 수 있음

- width : 너비를 지정
- height : 높이를 지정
- color : 색상을 지정
- margin : Container 외부의 여백을 지정
- padding : Container 내부의 여백을 지정
- decoration: 기타 속성들을 한번에 지정

`double.infinity` : 화면을 꽉 채우도록 크기를 설정하는 속성 값

`Align()` : Container를 정렬할 때 사용하는 위젯

- alignment: 정렬 방법을 지정

```dart
Align (
  alignment: Alignment.center
  child: Container (
    width: 150, height: 50,
    decoration: BoxDecoration(
      color: Colors.blue
      border: Border.all(color: Colors.black)
    ),
  ),
)
```

`Flexible()` : 상대적인 크기를 지정할 수 있는 위젯
```dart
Column(
  children: [
    Flexible(child: Container(), flex: 3), // 전체 크기에서 3만큼
    Flexible(child: Container(), flex: 7), // 전체 크기에서 7만큼
  ],
)
```

`Expanded()` : 특정 Box가 나머지 화면을 다 채우게 하고 싶을 떄
```dart
Row(
  children: [
    Expanded(child: container()) // flex: 1인 것과 같은 효과 (100% - 150)
    Container(width: 150)
  ],
)
```

---

## Design

1. style
위젯에 `style: `속성을 이용하여 디자인
    - `style: TextStyle()` : 글자 디자인

2. color 
    - `color: Colors.색상명`
    - `color: Color(0xff......)`
    - `color: Color.fromRGBO()`

3. button
    - TextButton()
    - IconButton()
    - ElevatesButton()

---