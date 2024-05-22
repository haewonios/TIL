# [Swift] PHPickerViewControllerDelegate 취소 동작

- `UIImagePickerControllerDelegate` 의 경우 사용자의 취소 선택시 호출되는 메소드 `imagePickerControllerDidCancel(_:)` 가 존재한다.
- 근데 `PHPickerViewControllerDelegate` 는 따로 메소드가 없다?
  - `picker(_:didFinishPicking:)` 메소드에서 같이 처리해준다!
  - `results` 가 비어있다면 그것이 바로 취소 버튼을 눌렀을 때..! 🥹

```swift
func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
  if results.isEmpty {
  	picker.dismiss(animated: true)
  	return
	}
  ...
}
```

