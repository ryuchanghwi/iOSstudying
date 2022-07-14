## Generic 

### Generic은 포괄적인 이라는 뜻을 가지고 있다. 
#### Generic(제네릭)이란 타입에 의존하지 않는 범용 코드를 작성할 때 사용함
#### 제네릭을 사용하면 중복을 피하고, 코드를 유연하게 작성할 수 있다. 

- 먼저 제네릭을 사용하지 않고 예시로 int swap 함수를 만들어보고자 할 때

``` swift 
func swapInts(_  a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
    print("intA", a, "intB", b)
}

var intA = 4
var intB = 3
swapInts(&intA, &intB)
```
#### 이런식으로 작성할 수 있다. 하지만 int 뿐만 아니라 string이나 double타입도 swap해야 하는 경우라면?

- string swap

``` swift
func swapStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
    print("stringA", a, "stringB", b)
}

var stringA = "stringA"
var stringB = "stringB"
swapStrings(&stringA, &stringB)
```
- 그렇다면 int와 string을 swap할수도 있을까?
####  error: generic.xcplaygroundpage:64:21: error: cannot convert value of type 'Int' to expected argument type 'String'
 swapFunction(&strA, &integerB)
 #### 다음과 같은 에러가 나타나는데 strA가 함수를 탈 때  T는 string으로 정해져 있기 때문에 int값이 들어온다면 에러가 나타나는 것이다. 
- double swap
``` swift 
func swapDouble(_ a: inout Double, _ b: inout Double) {
    let temp = a
    a = b
    b = temp
    print("DoubleA", a, "DoubleB", b)
}

var doubleA = 1.1
var doubleB = 2.2

swapDouble(&doubleA, &doubleB)
```

이렇게 같은 기능을 하는 함수도 타입이 다르다는 이유로 여러번 작성해야 하는 불편함이 있다. 

이를 해결하기 위해서 Generic이 존재한다. 

#### 제네릭<T> 여기서 T는 Type Parameter를 뜻한다. 
#### 제네릭으로 어떤 타입도 들어올 수 있도록 설정할 수 있다. 

``` swift 
  func swapFunction<T> (_ a: inout T, _ b : inout T) {
    let temp = a
    a = b
    b = temp
    
    print("A는", a, "B는", b)
}
var strA = "A"
var strB = "B"
var integerB = 3

swapFunction(&strA, &strB)
```
