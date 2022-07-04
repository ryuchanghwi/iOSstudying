## for - in
### 컬렉션에 저장된 요소 수만큼 반복되며, 저장된 요서가 루프 상스에 하나씩 들어감 
``` swift 
//forEach

for item in intArray {
    print("item: \(item)")
}
//enumerated 쌍의 sequence를 반환, (n, x) n은 0부터 시작하는 정수, x는 sequence의 element를 반환함
for (index, item) in intArray.enumerated() {
    print("index \(index), item \(item)")
}
```
##for in where

 
``` swift 
//where로 조건을 걸 수 있음
for item in intArray where item > 5 {
    print(item, "5보다 큰")
}

for item in intArray where item % 2 == 0 {
    print(item, "2로 나눠떨어지는 ")
}
```

## forEach
### 반복 실행하려는 코드를 파라미터로 받고, 저장된 요소는 클로저 상수로 전달함

``` swift 
intArray.forEach {
    print("element \($0)")
}

intArray.forEach { item in
    print("elememt, \(item)")
}
```
