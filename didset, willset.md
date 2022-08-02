## didSet, willSet
### 스위프트는 프로퍼티 옵저버로 didSet, willSet을 제공한다. 
### didSet은 프로퍼티 값이 변경되지 직전, willSet은 값이 변경된 직후를 감지한다. 
- willSet은 값이 변경되기 전
- didSet은 값이 변경된 이후를 처리할 수 있다. 

### 활용
#### 프로퍼티 옵저버는 Model에서 갱신된 값을 View에 보여줄 때 사용된다. 
