## 클로저 

함수처럼, 기능을 수행하는 코드블록의 특별한 타입이 클로저, but 함수와 다르게 이름이 없음
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
- Completion Block(어떤 테스크가 완료되었을 때 클로저가 수행되면서 쓰임 ex 비동기적으로 수행해야할 때 클로저 사용, 네크워크 통신 등
- Higher Order Functions
- 사실상 함수와 같은 코드블럭이다. 함수와 모습이 다를 뿐
- 함수는 같은 코드의 반복을 줄이기 위해서 코드블럭을 만들어 사용한다. 클로저를 사용하면 (변수로 할당)코드블럭을 확인하여 직관적으로 알 수 있다.

### 클로저의 기본 사용방법
``` swift 
{ (param) -> return type in 
    statement(실행코드)
}
```
### 클로저 다양한 사용방법

#### 1.인풋 파라미터를 받는 클로저
``` swift
let exClosure: (String) -> Void = { name in
    print("나의 이름은 \(name) 입니다")
}
exClosure("철수") //나의 이름은 철수 입니다
```

#### 2.값을 리턴하는 클로저
``` swift
let exClosure2: (String) -> String = { name in
    return "나의 이름은 \(name)입니다."
}
print(exClosure2("미애")) //나의 이름은 미애입니다.
```

#### 3. 클로저를 파라미터로 받는 함수
``` swift
func exFunction(exClosure3: () -> Void) {
    print("함수 호출!")
}
exFunction(exClosure3: {
    print("클로저 호출")
})
// 클로저 호출!
```
위의 코드를 보면 클로저 안에 있는 실행코드가 실행되지 않았다. 그 이유는 함수만 이니셜라이즈하고 클로저는 해주지 않았기 때문이다. 

``` swift
func exFunction2(exClosure4: () -> Void) {
    print("함수 호출!")
    exClosure4()
}
exFunction2(exClosure4: {
    print("클로저 호출!")
})
//함수 호출!
//클로저 호출!
```
다음과 같은 경우는 실행이 된다. 

#### 4. 트레일링 클로저(가독성을 위해)
트레일링 클로저는 좀 더 코드를 읽기 쉽도록 만든 것이다. 함수의 마지막! 전달인자로 위치하는 클로저에 사용할 수 있다. 

``` swift
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
```
``` swift
operateTwoNum(a: 4, b: 2, operation: { a, b in
    a + b
})
```
``` swift
operateTwoNum(a: 4, b: 2) { a, b in
    a + b
}
```
