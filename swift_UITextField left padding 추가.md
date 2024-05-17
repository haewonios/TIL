# [Swift] UITextField left padding 추가

```swift
extension UITextField {
    // 타이틀 라벨과의 패딩 추가
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
```

- UITextField 내부 타이틀(label)과의 간격을 두기 위해 UITextField 좌측에 패딩 추가
- UITextField 에 기본으로 존재하는 `leftView` 활용
  - `leftView` : magnifying glass 돋보기 아이콘 등
  - `rightView` : bookmarks button 북마크 버튼 등
- `leftViewMode` : 기본값은 `never`
  - never
  - whileEditing
  - unlessEditing
  - always

