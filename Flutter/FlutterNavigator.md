# Flutter Navigator

## Route
Flutter에서 Route는 화면 상에 보여지는 페이지 단위를 의미
- 일반적으로 Sacffold() 위젯을 리턴하는 위젯 하나가 하나의 Route라고 봐도 무방

Route는 반드시 MaterualApp 아래에 child로 생성되어야 함

## Route 관리
main.dart 에서 router를 관리
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      initialRoute: "/" // 첫 시작 화면을 지정
      routes: {
        "/" : (context) => FirstPage(),
        "/home" : (context) => HomePage(),
      },
    );
  }
}
```
---
## Navigator
Navigator는 stack 자료구조
- `push(context, route)` : 새로운 화면으로 이동
```dart
Navigator.pushNamed(context, "route 주소")
```
- `pop(context)` : 이전 화면으로 복귀
```dart
Navigator.popNamed(context, "route 주소")
```

## 데이터 전달
데이터를 전달할 class에 변수를 지정하여 데이터를 전달받을 수 있음
```dart
class Data {
  String value1;
  int value2;

  Data(this.value1, this.value2);
}
```
```dart
class FirstPage extends StatelessWidget {
  ...
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage(person: person))
  )
}
```
```dart
class SecondPage extends StatelessWidget {
  final Data data;
  SecondPage({@required this.data}) 
  // @required : 필수 입력 인자
}
```
