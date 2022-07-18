## NavigationView

#### NavigationView는 swiftUI에서 정말 중요한 컴포넌트 중에 하나라고 할 수 있다. 
#### 계층적인 방법으로 쉽게 화면을 push하거나 pop 할 수 있다.

#### NavigationView를 사용하기 위해서는 다음과 같이 표시하고자 하는 항목을 감싸준다. 
- 기본적으로 NavigationView는 최상위 수준이지만, TabView 내에서 NavigationView를 사용하고자 할 떄는 TabView안에 NavigationView가 있어야한다. 
``` swift
struct NavigationVIewPractice: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
        }
    }
}
```

#### NavigationView에 Title을 붙이는 것을 헷갈려한다. 

- 옳은 방법
``` swift
struct NavigationVIewPractice: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationTitle("Hello, World!")
        }
    }
}
```
- 틀린 방법
``` swift 
struct NavigationVIewPractice: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
        }
        .navigationTitle("Hello, World!")
    }
}
```
### navigationTitle은 View가 NavigationView 내부에 있고, NavigationView 내에서 표시되는 경우에만 적용되기 떄문임
- '틀린 방법'의 의미는 '항상 고정된 제목이다.'라고 말하는 것과 같다. swiftui는 내용이 변경됨에 따라 제목을 변경할 수 있으니까 navigation view 내부에 적는 것이 맞다. 



## navigationBarTitleDisplayMode()
### 3가지 제목 표시 방법이 있다. 
- .large (navigation stack에 최상위 view에 주로 사용)
- .inline (navigation stack에 subsequent나 secondary view에 사용)
- .automatic (전에 view가 사용된 방법을 따라감)

## NavigationLink
### NavigationView는 NavigationLink를 통해 새로운 화면을 제공함(원하는 뷰로 넘어갈 수 있음)

``` swift 
        NavigationView {
            NavigationLink(destination: Text("두번째 뷰"), label: { //Text("두번쨰 뷰")로 이동
                Text("두번쨰 뷰") //이것을 누르면
            })
                .navigationTitle("Hello, World!")
        }
```
- Navigation link 안에 텍스트 뷰를 사용했기 때문에 텍스트는 자동으로 파란색으로 바뀜, 또한 이미지를 사용한다면 이미지가 파란색으로 바뀔 수도 있음.
- 이미지를 사용하면서 파란색으로 변한다면 .renderingMode(.original)을 이용해 기존 이미지 색상을 유지할 수 있음.

## View 간의 데이터 전달 
### NavigationLink를 이용해 새 뷰를 푸시하면 새 뷰가 작동해야 하는 모든 매개변수를 전달할 수 있음

- 전달받는 뷰
``` swift
struct NavigationViewPractice2: View {
    var choice: String

    var body: some View {
        Text("나의 선택은 \(choice)")
    }
}

struct NavigationViewPractice2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewPractice2(choice: "위쪽")
        //프리뷰를 보기 위해서 먼저 예시를 만들어줘야함
    }
}

```
- 전달하는 뷰
``` swift
struct NavigationVIewPractice: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("어떤걸 선택하시겠습니까? ")

                NavigationLink(destination: NavigationViewPractice2(choice: "위")) {
                    Text("위를 선택")
                }
                NavigationLink(destination: NavigationViewPractice2(choice: "아래")) {
                    Text("아래 선택")
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct NavigationVIewPractice_Previews: PreviewProvider {
    static var previews: some View {
        NavigationVIewPractice()
    }
}
```
