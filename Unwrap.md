## 옵셔널이란?
### nil의 가능성을 명시적으로 표현하는, swift 언어의 특징 중 하나인 안정성을 문법으로 담보하는 기능이다. 
쉽게말해 값이 있을 수도, 없을 수도 있는 것을 나타낸다. 
 
변수에 값이 있는지 없는지 확실하게 알 수 없을 때 값이 nil일 수도 있음을 의미한다. 

```swift 
var optionalInt: Int?
print(optionalInt)
//결과값: nil
print(optionalInt)
//결과값: Optional(3)
```

### 언래핑이란?
말 그대로 래핑되어 있는 것을 벗기는 것, 즉 optional로 감싸져 있는 것을 벗겨내는 것을 말한다. 

### 언래핑을 하는 방법은 4가지가 있다. 

### 1. Forced unwrapping, 강제 언래핑

``` swift
var optionalVar : Int? = 3
print(optionalVar)
//결과값 Optional(3)
// !을 이용한다.
print(optionalVar!)
//결과값: 3
```

### 2. Optional binding(if let)
``` swift
if let optionalBinding = optionalVar {
    // 값이 있는 경우
    print(optionalBinding)
} else {
    //값이 없는 경우
}
//결과값: 3
```

### 3. Optional binding(guard)
``` swift 
func optionalBindingFunc(_ parameter: Int?) {
    // 값이 없다면 return, 지나가버림
    guard let unwrappedParams = parameter else { return }
    print(unwrappedParams)
}
optionalBindingFunc(optionalVar)
//결과값: 3
```

### 4. Nil coalescing nil 병합 연산이라고도 함
이 방법은 값이 있을 경우 언래핑을 하고 값이 없는 경우 값을 지정해 주는 것

```swift 
print(optionalVar ?? 0 )
//결과값: 3
```
