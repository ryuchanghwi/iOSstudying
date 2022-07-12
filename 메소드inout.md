## 메소드 매개변수 inout 

### 함수에서 매개변수는 기본적으로 상수의 성질을 가진다.(값을 중간에 바꿀 수 없음) 때문에 매개변수를 함수 내에서 변경하려고 시도하면 컴파일 에러가 나타난다. 

#### 컴파일 에러의 예시 코드
``` swift 
func changeName(_ name: String) {
    name = "ios 개발자" + name
    print("나는 \(name)")
}
changeName("땡땡땡")

//기대하는 값: 나는 ios 개발자 땡땡땡
/*
실제 값: error: InputParameter.xcplaygroundpage:13:5: error: cannot assign to value: 'name' is a 'let' constant
    name = "ios 개발자" + name
/*
```
다음과 같이 name is a let constant라는 에러를 가지면서 컴파일 에러를 내뱉는다. 

### 만약 함수의 매개변수를 함수 내부에서 변경하고 함수가 종료된 후에도 변경한 값이 지속되도록 하기 위해선 input 키워드를 사용하면 된다.
- inOut 메소드에 들어가는 값은 변경 가능해야 하기 때문에 메소드에 바로 넣지 못함
- 변수에 한번 값을 담은 뒤에 넣어야함 

``` swift 
func changeName(_ name: inout String) {
    name = "ios 개발자" + name
    print("나는 \(name)")
}
var name = "땡땡땡"
changeName(&name)

//결과: 나는 ios개발자땡땡땡
```
