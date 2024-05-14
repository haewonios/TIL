# [iOS] CocoaPods

- 설치

```bash
$ sudo gem install cocoapods
```

- 프로젝트 경로로 이동 후 Podfile 생성

```bash
$ pod init
```

- Podfile 수정

```swift
...
pod 'Then' // 라이브러리 추가
...
```

- 수정 적용

```bash
$ pod install
```

- `.xcworkspace` 실행