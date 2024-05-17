# [Swift] 키보드 내리기

## 화면 터치

- 키보드 올라온 상태에서 화면 아무데나 터치하면 키보드 내리기

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  self.view.endEditing(true)
}
```

## 키보드 Return 

-  키보드 return 키(엔터) 누르면 키보드 내리기

```swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
  textField.resignFirstResponder()
  return true
}
```

- TextView 의 경우 키보드 입력값으로 확인
  - 근데 엔터가 걍 치고 싶을 수 있으니,,, 이건 보류

```swift
func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
  if text == "\n" {
    textView.resignFirstResponder()
    return false
  }
  return true
}
```

