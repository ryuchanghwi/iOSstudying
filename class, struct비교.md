## class와 struct 비교

쉽게 말해서 

struct는 복사 개념이다. 참조하는 값이 바껴도 기존 값에는 영향을 주지 않는다. 

반면에

class는 공유 개념이다. 참조하는 값이 바뀌면 기존 값도 영향을 받아 바뀌게 된다. 


## class와 struct의 공통점
- 값을 저장하기 위한 프로퍼티를 정의할 수 있음
- 기능을 제공하기 위해 메소드를 정의할 수 있음
- subscript 문법을 이용해 특정 값에 접근할  수 있음
- 생성자를 사용해 초기 상태를 설정할 수 있음
- 기본 구현에서 기능을 확장할 수 있음
- Protocol을 채택하여 기능을 설정할 수있음

## struct
- 값 타입
- 구조체 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 할당
- 값을 변경시키더라도 다른 변수에 영향을 주지 않음


## class 
- 참조 타입 
- 같은 클래스 인스턴스를 여러 개 변수에 할당한 뒤 값을 변경시키면 할당한 모든 변수에 영향을 줌
- 상속 가능
- ??ARC로 메모리 관리(공부하기)



``` swift 
//myInfo 라는 모델 - struct or 구조체로 부름
struct myInfo {
    var name: String
    var age: Int
}

var info = myInfo(name: "declan", age: 25)

var info2 = info

print(info.name, "- 변경 전 info 값")
//info2의 name 값을 바꿈
info2.name = "데클렌"

print(info2.name, "- 변경 후 info2 값")
print(info.name, "- 변경 후 info 값")


//결과값:
// declan - 변경 전 info 값
// 데클렌 - 변경 후 info2 값
// declan - 변경 후 info 값
```
info 와 info2 의 name이 다른 것을 알 수 있다. 

``` swift 
class infomation {
    var name: String
    var age: Int
    
    //생성자를 만들어줘야함, 메모리에 올리는 과정
    // init으로 매개변수를 가진 생성자 메소드를 만들어야
    // 매개변수를 넣어서 그 값을 가진 객체(object)를 만들 수 있음.
    init(name: String, age: Int) {
        //내가(class)가 가지고 있는 self.name을 외부에서 가져온 name으로 넣는다는 의미
        self.name = name
        self.age = age
    }
}

var myinfo = infomation(name: "declan", age: 25)
var myinfo2 = myinfo

myinfo.age -= 2

print(myinfo.age, "myinfo age 2 빼기")

myinfo2.age -= 2

print(myinfo2.age, "myinfo2 age 2 빼기")

myinfo.age -= 2

print(myinfo.age, "myinfo age 2 빼기")

//결과:
// 23 myinfo age 2 빼기
// 21 myinfo2 age 2 빼기
// 19 myinfo age 2 빼기
```
위에 struct와는 다르게 class는 참조 타입이기 때문에 myinfo, myinfo2에서 age 값을 빼도 연결되어 있는 것을 알 수 있다. 
할당한 변수에 영향을 주었음
