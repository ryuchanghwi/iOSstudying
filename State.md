## State는 SwiftUI에서 가장 기본이 되는 개념이다. 

### 공식문서에서는 'A property wrapper type that can read and write a value managed by SwiftUI' 라고 나와있다. 
### 해석을 해보자면 '관리하는 값을 읽고 쓸 떄 사용하는 것'이라는 것을 알 수 있다. 

#### 사용자가 상태(State)를 변경하고자 할 때,  그 후 일어날 일은 State가 변경되면 자동으로 사용자 인터페이스를 업데이트해 변환 시켜준다. 
#### 상태(State)를 변경할 때마다 새로운 View에서 렌더링 된다.

#### 일반적으로 struct는 값 타입(?)이기 때문에 struct내에 값을 변경할 수 없다. 
#### 때문에 SwiftUI에서는 @State를 제공해 값을 변경할 수 있게 해준다. 

- @State는 일반적으로 String, Int와 같이 단순한 구조 유형과 함꼐 사용해야 하며 일반적으로 다른 뷰와 공유해서는 안된다. 
- @State는 일반적으로 private로 선언해, 다른 view와 공유되지 않도록 한다. 


예시

- 토클을 이용해서 배경색 바꾸기
``` swift 
struct StatePractice: View {
    @State private var toggleBool: Bool = false
    
    var body: some View {
        ZStack {
            toggleBool ? Color.white : Color.black
                VStack(alignment: .center) {
                    Toggle(isOn: $toggleBool) {
                        Text(toggleBool ? "불키기" : "불끄기")
                    }
                    .background(Color.white)
                }
        }
        
    }
}

```

<img src ="https://user-images.githubusercontent.com/78063938/178932248-57d977e8-6dab-4b46-bbe0-3189a7f32338.png" width = "200">
