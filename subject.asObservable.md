### RxSwift 궁금증
### Subject .asObservable은 왜 사용하는 것일까??

``` swift 
//A VC
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    func action() {
            taskSubject.onNext(task)
            }

```
```
B VC
       addTaskVC.taskSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                print(task)
                
            }).disposed(by: disposeBag)
```
이런 코드가 있었다. 

subject는 Observable과 Observer의 역할을 모두 가지고 있는 애다.
그러면 그냥 한곳에 쓰면되지 왜 굳이 .asObservable로 다시 Observable을 나눠서 사용할까...

현재까지 내가 알아낸 대답은 외부에서 observer에 접근하지 못하도록 설정하며, observable에만 접근할 수 있도록 나눠서 접근 가능하도록 하기 위함이다. 
