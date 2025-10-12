# [Swift] some vs any
- **Any**
  - 아무 타입이나 가능. 일반적인 모든 타입
  - 하지만 배열 요소에 접근하려면 downcasting 필요 (옵셔널 X, Any로 뱉어냄)
 
- **any**
  - 프로토콜 내부에 연관타입이나 Self 같은 명확하지 않은 정보가 있을 때 어떻게 구현되었는지 알 수 없는 문제
  - 이를 해결하기 위해 any 키워드를 사용
  - 이러한 프로토콜을 `Exsitential Type` 으로 사용하기 위해 -> 더 알아보기
  - 타입은 런타임에 결정됨
 
- **some**
  - generic 으로 한가지의 "특정 타입"만 수용 -> 불투명 타입(opaque type, 역제네릭 타입)
  - 제네릭은 함수 외부에서 호출할 때 타입이 결정되는 반면, 불투명 타입은 함수 내부에서 타입을 결정
  - 타입은 컴파일 타임에 결정됨
  - preview가 느린 이유이기도 함
 
- some View
  - View 프로토콜은 내부에 `associatedtype Body: View` 타입의 body 변수를 가지고 있음
  - 이 명확하지 않은 연관타입이 정의되어 있어서 some 으로 body를 감싸서 명시
  - body 내부를 어떻게 작성하느냐에 따라 리턴 타입이 바뀌지만, 리턴 타입을 다르게 써줄 필요 없음
  - 컴파일러가 타입 판단해줌
  - some View는 사실 VStacl<TupleView<(Text,Button)>> 과 같은 body 내부 값의 실제 타입 형태임 (복잡..)
