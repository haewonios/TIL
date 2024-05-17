# [Swift] UIButton configuration으로 버튼 내부 패딩 설정(contentEdgeInsets deprecated)

- 버튼 `inset` 을 설정할 수 있었던 `contentEdgeInsets` 가 deprecated 되었다.

``` swift
'contentEdgeInsets' was deprecated in iOS 15.0: This property is ignored when using UIButtonConfiguration
```

- 대신 `configuration` 을 이용하자
  - `plain` (기본 버튼) 외에도 `tinted` , `gray` , `filled` 등 존재
  - `contentsInsets` 외에도 기타 버튼 속성 설정 가능

```swift
var myButton = UIButton()
var configuration = UIButton.Configuration.plain()
configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
myButton.configuration = configuration
```