# [Swift] UIAlertController 알림창 구현

- 알림창 Alert 모달 ... 띄우기
- 커스텀 당연히 가능. 아래는 진짜 기본 구현 내용

## Alert

- 화면 중앙에 띄우는 알림창
  - 보통 타이틀, 메시지, 버튼2개(예/아니오) 형태
  - 버튼 동작은 클로저 내부 구현
  - 클로저 미구현 시 그냥 알럿 닫힘
- UIAlertAction 의 style
  - default (기본)
  - destructive (삭제 등)
  - cancel (취소)

```swift
let alert = UIAlertController(title: "취소", message: "작성을 취소하시겠어요?", preferredStyle: .alert)
        
let cancel = UIAlertAction(title: "아니오", style: .cancel)
let confirm = UIAlertAction(title: "예", style: .default) { _ in
    self.dismiss(animated: true)
}

alert.addAction(cancel)
alert.addAction(confirm)

present(alert, animated: true)
```

## ActionSheet

- 화면 하단에 띄워지는 알림창
  - 보통 타이틀, 메시지, 버튼(다수, 취소버튼) 형태

```swift
let alert = UIAlertController(title: nil, message: "Forgot password or don't have an Apple ID?", preferredStyle: .actionSheet)

let forgot = UIAlertAction(title: "Forgot Password or Apple ID", style: .default)
let create = UIAlertAction(title: "Create Apple ID", style: .default)
let cancel = UIAlertAction(title: "Cancel", style: .cancel)

alert.addAction(forgot)
alert.addAction(create)
alert.addAction(cancel)

present(alert, animated: true)
```

