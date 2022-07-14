### swiftUI Image

#### 이미지를 부르는 방법이다. 
``` swift
Image("이미지이름")
```

#### .resizable()
- Sets the mode by which SwiftUI resizes an image to fit its space.
- 공간에 맞게 이미지 크기를 조절하는 역할


#### .aspectRatio()
- Constrains this view’s dimensions to the aspect ratio of the given size.
- 치수를 지정된 크기의 가로 세로 비율로 제한
``` swift
.aspectRatio(2, contentMode: .fit
// 가로 세로 비율, 가로 1 세로 2, contentMode: fit은 비율 유지, fill은 비율을 무시하고 크게 만듦
```
#### .cornerRadius()
- Clips this view to its bounding frame, with the specified corner radius.
- 모서리를 둥글게 만드는 메서드
