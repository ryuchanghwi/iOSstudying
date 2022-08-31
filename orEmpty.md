## orEmpty

### Textfield를 다루다가 하나의 문제를 맞이하게 되었다. 

``` swift
        textField.rx.text
            .orEmpty
            .bind(to: viewModel.textFieldSubject)
            .disposed(by: disposeBag)
```

textField.rx.text의 데이터 형태는 

``` swift
var text: ControlProperty<String?> { get }
```

subject의 데이터 형태는 
``` swift
var textFieldSubject: BehaviorSubject<String>
```
다음과 같다.

둘의 차이를 보면 하나는 ?(옵셔널)이다. 때문에 둘의 타입이 맞지 않는다. 

이를 해결할 수 있는 것이 orEmpty이다. 

### orEmpty : Transforms control property of type String? into control property of type String.
간단히 말해서 string 옵셔널 타입을 string 타입으로 변환해주는 것이다. 

정말 유용한 기능들이 많다.
