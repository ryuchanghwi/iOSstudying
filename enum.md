## Enum

### enum은 열거라는 'Enumeration'에서 따온 용어이다. 보통 열거형으로 많이 부르게 된다. 

가장 기본적인 사용방법은 다음과 같다. 

``` swift 
enum Color: String {
    case caseRed = "red"
    case caseBlue = "blue"
    case caseGreen = "green"
}

```

``` swift
let caseColor = Color.caseBlue
print("선택한 컬러는", caseColor)
//결과: 선택한 컬러는 caseBlue

```
rawValue를 사용하게 되면 선언된 값을 가져올 수 있다. 

``` swift

let selectedColor = Color.caseBlue.rawValue
print("선택한 컬러는", selectedColor)
//결과: 선택한 컬러는 blue

```

다음과 같으 방법으로 enum 안에 함수를 만들어 값을 저장할 수 있다. 
``` swift
enum shoesBrand {
    case nike
    case puma
    case adidas
    
    func getBrand() -> String {
        switch self {
        case .nike:
            return "나이키"
        case .puma:
            return "푸마"
        case .adidas:
            return "아디다스"
        }
    }
}
```
shoesBrand의 nike case에 값을 가져오는 함수
``` swift
let selectedBrand = shoesBrand.nike.getBrand()
print(selectedBrand)
//결과: 나이키
```

다음처럼 미리 값을 선언하지 않고 함수를 만들 수도 있다. 
``` swift 
enum smartPhoneBrand {
    case apple(name: String)
    case samsung(name: String)
    case lg(name: String)
    
    func getBrand() -> String {
        switch self {
        case .apple(let name):
            return name
        case .samsung(let name):
            return name
        case .lg(let name):
            return name
        }
    }
}
```
smartPhoneBrand 열겨형의 apple 케이스의 값은 "애플"로 선언 후 함수를 통해 값을 가져올 수 있다. 

``` swift 
let selectedPhoneBrand = smartPhoneBrand.apple(name: "애플")
print(selectedPhoneBrand.getBrand())
//결과: 애플

```


## 사용해보기 
``` swift 
    enum hexColor {
        case stringColor
        case separateColor
        case backgroundColor
        
        func getHexColor() -> UIColor {
            switch self {
            case .stringColor:
                return UIColor(hex: 0x5F5D59)
            case .separateColor:
                return UIColor(hex: 0xE2DFD7)
            case .backgroundColor:
                return UIColor(hex: 0xFDFCF9)
            }
        }
    }
```

``` swift 
    func buttonBackground() {
        exitButton.backgroundColor = hexColor.backgroundColor.getHexColor()
        cancelButton.backgroundColor = hexColor.backgroundColor.getHexColor()
    }
```
