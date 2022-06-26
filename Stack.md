
## SwiftUI에서 Stack 다루기

### SwiftUI에서 Stack은 수직(VStack), 수평(HStack), 겹쳐서 쌓아올리는 ZStack이 있다. 

''' swift
struct StackPractice: View {
    var body: some View {
        VStack {
            Text("hello")
            Text("hello")
        }
    }
}
'''
