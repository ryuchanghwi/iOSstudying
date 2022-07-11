## 클로저 

함수처럼, 기능을 수행하는 코드블록의 특별한 타입이 클로저, but 함수와 다르게 이름이 없음

### 클로저는 크게 3가지 타입이 있음
- Global 함수
- Nested 함수
- Closure Expressions (흔히 말하는 클로저)

### 함수와 클로저의 공통점과 차이점

### 공통점
- 인자를 받을 수 있다. (인자란? 전달하는 값)
- 값을 리턴할 수 있다. 
- 변수로 할당할 수 있다. 
- First Class Type이다.(위의 3가지가 First Class Type의 특징)

### 차이점
- 함수는 이름이 있고, 클로저는 없음
- 함수는 func 키워드가 필요하지만, 클로저는 func 키워드가 필요 없음

### 그럼 클로저는 도대체 언제 쓰이냐?
- Completion Block(어떤 테스크가 완료되었을 때 클로저가 수행되면서 쓰임 ex 비동기적으로 수행해야할 때 클로저 사용, 네크워크 통신 등)

- Higher Order Functions

### 클로저의 기본 사용방법
``` swift 
/*
{ (param) -> return type in 
    statement
    .....
}
/*
```
### 클로저 다양한 사용방법
``` swift 
var multiplyClosure : (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}

var multiplyClosure2 : (Int, Int) -> Int = { a, b in
    return a * b
}

var multiplyClosure3: (Int, Int) -> Int = {
    $0 * $1
}
let result1 = multiplyClosure(2, 4)
let result2 = multiplyClosure2(2, 4)
let result3 = multiplyClosure3(2, 4)

```

### 함수가 클로저를 받는 경우 
``` swift 
var multiplyClosure3: (Int, Int) -> Int = {
    $0 * $1
}
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure3)
//결과: 8
```

### input이 있고 output이 없는 클로저
``` swift 
let voidClosure: () -> Void = {
    print("으아아아")
}
voidClosure()
```

### input, output이 있는 클로저
``` swift 
let returnClosure: () -> String = {
    return "으아아아"
}
```
