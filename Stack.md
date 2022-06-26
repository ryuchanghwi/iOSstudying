
## SwiftUI에서 Stack 다루기

### SwiftUI에서 Stack은 수직(VStack), 수평(HStack), 겹쳐서 쌓아올리는 ZStack이 있다. 

기본적인 사용방법은 이렇다.
``` swift
struct StackPractice: View {
    var body: some View {
        VStack {
            Text("hello")
            Text("hello")
        }
    }
}
```
<img src ="https://user-images.githubusercontent.com/78063938/175805716-929c459d-2c77-4b55-9f4c-e82289f6c403.png" width = "200">

ZStack과 같은 경우 

``` swift 
struct StackPractice: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black) //먼저 작성한 검정색 박스가 제일 밑으로 깔림
                .frame(width: 400, height: 400)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 300, height: 300)
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
        }
    }
}
```



<img src ="https://user-images.githubusercontent.com/78063938/175806130-5ff52b6f-6e8e-4d66-be0f-79133b95b51c.png" width = "200">

스택안에 뷰를 정렬하기 위해서는 aliment, 일정한 간격을 주기 위해서는 spacing을 사용한다.

``` swift
struct StackPractice: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("helloHello")
            Text("hello")
            Text("hello")
            
        }
    }
}
```
<img src = "https://user-images.githubusercontent.com/78063938/175806395-70a8f729-28e7-4061-9b17-d62e7758667a.png" width = "200">

추가로
기본적으로 SwiftUI에서의 뷰는 SafeArea안에서 배치된다. 
따라서 SafeArea를 넘고싶다면 .edgesIgnoringSafeArea(.all)을 사용한다. 

``` swift 
struct StackPractice: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
        }
    }
}
```

<img src = "https://user-images.githubusercontent.com/78063938/175806593-7aba7b17-5ed2-464d-8d7f-6508aa91f207.png" width = "200">
