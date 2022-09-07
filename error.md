##에러 처리(예외 처리)

### 필요한 이유
#### optional 타입은 오류가 발생했을 때 오류에 대한 정보를 외부로 전달할 방법이 없음

### 구현방법
#### 1) enum 오류타입명 정의 

``` swift
enum AgeError: Error {
    case overAge
    case incorretAge(age: Int)
}
```

#### 2) 오류가 나는 조건을 명시: throw와 throws로 선언
- 오류가 발생할 수도 있다라는 의미로 "throws"를 선언해준다. 
- 오류가 발생했다는 의미로 throw와 오류명을 적는다. 
``` swift
func getMyAgeErrorCase(myAge: Int) throws {
    if myAge > 20 {
        throw AgeError.overAge
    }
    else {
        throw AgeError.incorretAge(age: myAge)
    }
    
    return myAge
}
```

### do try catch로 접근
catch: 마지막 catch에 오류타입을 작성하지 않으면 default문으로 됨
try! : 에러가 발생하지 않을 것이다.라는 의미(런타임 에러는 발생시킬 수 있음)
try? : 에러가 발생해도 처리하지 않을 것이다. 라는 의미

``` swift
func getMyAge(myAge: Int) {
    do {
        try getMyAgeErrorCase(myAge: myAge)
    } catch AgeError.overAge {
        print("나이를 초과했습니다. ")
    } catch AgeError.incorretAge(age: let part) {
        print("\(part)이므로 너무 어립니다.")
    } catch {
        print("default error")
    }
}

getMyAge(myAge: 2)
//2이므로 너무 어립니다.
```
