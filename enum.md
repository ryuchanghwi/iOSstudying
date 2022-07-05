## Enum

### enum은 열거라는 'Enumeration'에서 따온 용어이다. 보통 열거형으로 많이 부르게 된다. 

가장 기본적인 사용방법은 다음과 같다. 

``` swfit 
enum Color: String {
    case caseRed = "red"
    case caseBlue = "blue"
    case caseGreen = "green"
}

```

``` swift
let caseColor = Color.caseBlue
print("선택한 컬러는", caseColor)
//결과: 선택한 컬러는 caseBlue

```
rawValue를 사용하게 되면 선언된 값을 가져올 수 있다. 

``` swift

let selectedColor = Color.caseBlue.rawValue
print("선택한 컬러는", selectedColor)
//결과: 선택한 컬러는 blue

```
