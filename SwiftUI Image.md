### swiftUI Image

#### 이미지를 부르는 방법이다. 
``` swift
Image("이미지이름")
```

### !!주의사항!!
이미지를 frame 수식어를 적용한다 해도 다음 그림에서 볼 수 있는 것처럼 이미지의 크기를 변하지 않고 뷰가 차지하는 공간만 달라진다. 
<img src ="https://user-images.githubusercontent.com/78063938/194764859-c91b0ada-9278-4b19-a67c-f0bba0a497e5.png" width = "300">
따라서 이미지의 크기를 변경해야 하는 경우에는 .resizable 수식어를 사용한다. 
<img src ="https://user-images.githubusercontent.com/78063938/194765100-d597d397-5ef2-489b-b03d-28eb91c75739.png" width = "300">
``` swift
        HStack {
            Image("SwiftUI")
            Image("SwiftUI")
                .resizable()
                .frame(width: 50, height: 50)
            Image("SwiftUI")
                .resizable()
                .frame(width:300, height: 300)
        }
```


#### .resizable()
- Sets the mode by which SwiftUI resizes an image to fit its space.
- 공간에 맞게 이미지 크기를 조절하는 역할
- .resizable(resizingMode: .stretch)이 기본값


#### .aspectRatio()
- Constrains this view’s dimensions to the aspect ratio of the given size.
- 치수를 지정된 크기의 가로 세로 비율로 제한
``` swift
.aspectRatio(2, contentMode: .fit)
// 가로 세로 비율, 가로 1 세로 2, contentMode: fit은 비율 유지, fill은 비율을 무시하고 크게 만듦
```
#### .cornerRadius()
- Clips this view to its bounding frame, with the specified corner radius.
- 모서리를 둥글게 만드는 메서드

#### .offset(x: y: )
- Offset this view by the specified horizontal and vertical distances.
- 위치 변경
``` swift
.offset(x: 10, y: 10)
// x로 10만큼, y로 10만큼 이동
```

#### .opacity()
- Sets the transparency of this view.
- 투명도 조정
``` swift
.opacity(0.5)
// 1이 기본 값 0은 투명
```

#### .renderingMode()
- Indicates whether SwiftUI renders an image as-is, or by using a different mode.
- .renderingMode(.original)은 원본이미지 색상 유지
- .renderingMode(.template)은 색상을 바꿀 수 있음 + 색 표현 코드를 추가 해야함

``` swift
Image("이미지")
    .renderingMode(.template)
    .foregroundColor(.red)
    // .foregroundColor로 이미지 색 변경 가능
```

#### .shadow(color: , radius:, x: , y: )
- Adds a shadow to this view.
- view에 그림자 추가

``` swift 
Image("이미지")
    .shadow(color: .red, radius: 1, x: 10, y: 10)
    // red 색으로 x 10 y 10만큼 그림자 효과 주기
```
