# SwiftUI

"SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before."

> SwiftUI는 모든 Apple 플랫폼에 대한 사용자 인터페이스를 선언하는 현대적인 방법입니다.

- SwiftUI는 선언적 구문을 사용
- 디자인 캔버스를 통해 편집기의 코드와 동기화 가능 → 미리보기 및 실시간 업데이트 제공
- UIKit 및 AppKit과 호환

## SwiftUI 프로젝트 실행

1. Xcode 실행 → `Create a new Xcode project`

2. 템플릿 선택

   `App` 선택 → Next

3. 프로젝트 정보 설정

   - Product Name: `PascalCase` 사용 권장

   - Bundle Identifier : 앱을 고유하게 식별하는 문자열, 일반적으로 `com.회사이름.앱이름`

   - Interface: SwiftUI

   - Life Cycle: SwiftUI App

   - Language: Swift

4. 저장 위치 선택 후 Create

## 폴더 구조

```
├── [APP NAME]                   ← 실제 프로젝트 폴더
│   ├── ContentView.swift      ← 💡 여기에 주 UI 코드 작성
│   ├── [APP NAME].swift      ← 앱 진입점 (entry point)
│   ├── Assets.xcassets        ← 색상, 아이콘 리소스
│   └── Preview Content/       ← SwiftUI 프리뷰 전용 리소스
└── [APP NAME].xcodeproj         ← Xcode 프로젝트 설정 파일들
```

## ContentView.swift

기본 UI와 로직을 작성하는 파일

```
import SwiftUI

struct ContentView: View {
    // 변수 또는 상수 선언

    var body: some View {
        VStack {
            // 컴포넌트 선언
        }
    }

    func myFunction() {
        // 기능 처리
    }
}

```

## SwiftUI 미리보기가 안 뜰 때 해결 방법

1. Canvas 켜기

- 단축키: `Option + Command + Enter`
- 또는 상단 메뉴: `Editor > Canvas` 선택

2. Preview 코드 추가

```
#Preview {
    ContentView()
}
```

3. [APP NAME].swift 확인

```
@main
struct [APP NAME]: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
