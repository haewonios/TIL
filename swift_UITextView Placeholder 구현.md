# [Swift] UITextView Placeholder 구현

> UITextField 는 placeholder 가 있는데 UITextView는 없어..
> 어떡하지?🥺

- `UITextView` 의 `delegate` 설정

```swift
var textView = UITextView()
textView.delegate = self
```

- `UITextViewDelegate` 의 메소드 구현
  - `textViewDidEndEditing(_:)` - textView edit 끝났을 때 text에 내용이 없으면 placeholder 내용 및 색상 적용
  - `textViewDidBeginEditing(_:)` - textView edit 시작할 때 설정한 placeholder 초기화

```swift
extension ViewController: UITextViewDelegate {
	func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "내용을 입력해주세요"
      textView.textColor = .lightGray
    }
  }
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == .lightGray {
      textView.text = nil
      textView.textColor = .black
    }
  }
}
```

- 이렇게만 하면 처음 화면 들어왔을 때 placeholder 가 안보임
  - 처음 textView 만들어질 때 초기화 필요

```swift
var textView = UITextView()
textView.text = "내용을 입력해주세요"
textView.textColor = .lightGray
```

- 만족 😎