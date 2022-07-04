

## Swift 기본 문법: 조건문(if else) 

swift의 조건문 중 가장 간단하게 해볼 수 있는 문법은 if...else문 일 것이다. 

기본적인 사용방법은 이렇다.
``` swift
var isIPhoneUser: Bool = true

if isIPhoneUser == true {
    print("아이폰 유저")
} else {
    print("아이폰 유저 아님")
}
//결과 : 아이폰 
```
변수가 Bool로 선언되었다면 생략이 가능하다. 
``` swift
if isIPhoneUser { //true이면
    print("아이폰 유저")
} else { //false 라면
    print("아이폰 유저 아님")
}
```
###삼항연산자 
삼항연산자는 조건문이 Bool, true와 false로 처리해야할 경우 코드를 간결하게 만들 수 있다. 

기본적인 방법은 
(해당 조건) ? 참일경우 : 참이 아닐경우
좀 더 예시를 만들어 보면 다음과 같다. 


``` swift 
isIPhoneUser == true ? print("아이폰 유저") : print("아이폰 유저 아님")
// ?는 해당하는 조건, :는 아니라면 의미
```

``` swift 
isIPhoneUser != true ? print("아이폰 유저 아님") : print("아이폰 유저")
```

위의 코드를 좀 더 간결하게 만들고자 한다면
``` swift
isIPhoneUser ? print("아이폰 유저") : print("아이폰 유저 아님")
```

``` swift
!isIPhoneUser ? print("아이폰 유저 아님") : print("아이폰 유저")
```
