## ScrollView
#### swiftUI에서 ScrollView를 만드는 방법은 간단하다.
``` swift
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView {
            Text("스크롤뷰")
        }
    }
}
```
#### scrollview는 기본적으로 수직 스크롤이지만 수직이나 수평 스크롤을 만들기 위한 방법은 다음과 같다. 
- 수직 스크롤
``` swift 
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView(.vertical) {
            Text("스크롤뷰")
        }
    }
}
```
- 수평 스크롤
``` swift 
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView(.horizontal) {
            Text("스크롤뷰")
        }
    }
}
```

#### scrollview에서 indicator(스크롤바) 보이거나 숨길 수 있다.
- 스크롤바 숨기기
``` swift 
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("스크롤뷰")
        }
    }
}
```
- 스크롤바 보이기
``` swift
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            Text("스크롤뷰")
        }
    }
}
```

#### scrollview안에 Vstack과 HStack
- 스크롤뷰 안에 뷰들을 채울 때 뷰는 기본적으로 수직으로 채워지고 간격을 조정해야할 필요가 있기 때문에 V(H)으로 한 번 감싸서 사용하는 편이다. 
``` swift 
struct ScrollVIewPractice: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 10){
                ForEach(0..<5) { index in
                    Text("스크롤뷰")
                        .frame(width: 100)
                        .background(Color.blue)
                }
            }
        })
    }
}
```


