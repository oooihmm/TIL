# Flutter Stateful

## Stateful Widget
변경 가능한 상태를 가지고 있는 위젯.
변수의 값에 따라 위젯을 그릴 수 있고, 사용자의 엑션에 따라 위젯을 다시 그릴 수 있음.

Stateful Widget은 final 변수가 아닌 변경할 수 있는 일반적인 변수를 가질 수 있음.

## setState 함수
변수의 값을 직접적으로 변경하게 되면 앱이 다시 build되지 않음.

setState 함수를 통해 상태 변수를 변경하게 되면 build 함수가 다시 실행되면서 변경된 상태에 따라 위젯이 다시 build됨.

## StatefulWidget의 build 흐름
앱이 처음 실행될 때 build 함수가 호출되며 부모에서 자식으로 위젯이 build됨

단, 상태를 변경할 때마다 부모 자식부터 다시 그려지는 일이 발생함.
따라서 전체 위젯을 StatefulWidget으로 지정하는 게 아니라 상태가 있는 위젯만 StatefulWidge으로 따로 작성하여 BuildContext를 분리하는 것이 효과적임.

---

## lifecycle method
build 메소드는 상태가 변할 때마다 실행되는 함수이기 때문에 계산이나 네트워크 요청 등의 앱의 성능에 지장을 주는 로직을 build 함수에 작성해서는 안 됨.

flutter에서는 build 함수 외에 특정 타이밍에 호출되는 메소드를 제공함. 이러한 함수들을 생명주기 함수라고 함.

- initState() : 위젯이 생성될 때 호출
- dispose() : 위젯이 완전히 종료될 때 (pop될 때) 호출
