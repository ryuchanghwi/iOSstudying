import UIKit
import RxSwift
import Foundation


print("----Just-----")
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })



print("-----Of-----")
Observable<Int>.of(1, 2, 3, 4, 5)
    .subscribe(onNext: {
        print($0)
    })
//하나의 형태의 이벤트를 넣을 수 있음

print("----Of-----")
Observable.of([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })
//하나의 배열만을 배출

print("----From----")
Observable.from([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })
//배열 안의 엘리멘트를 하나씩 꺼냄

print("----subscribe-----")
Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }

print("----subscribe2-----")
Observable.of(1, 2, 3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("-----subscribe3-----")
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })

print("-----empty-----") //카운트가 0인 옵저버블
Observable.empty()
    .subscribe {
        print($0)
    }

print("-----never-----")
Observable.never()
    .debug("never")
    .subscribe(
        onNext: {
            print($0)
        
    },
               onCompleted: {
                   print("Completed")
        
               }
    )

print("----range-----")
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2*\($0)= \(2*$0)")
    })

print("-----dispose-----")
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })
    .dispose() //구독 취소

print("----disposeBag-----")
let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)


print("-----create1-----")
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}

.subscribe {
    print($0)
}
.disposed(by: disposeBag)


print("-----create2-----")
enum MyError: Error {
    case anError
}

Observable<Int>.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
    
}
//구독 해주기
.subscribe(
    onNext: {
        print($0)
    },
    onError: {
        print($0.localizedDescription)
    },
    onCompleted: {
        print("completed")
    },
    onDisposed: {
        print("disposed")
    }

)
.disposed(by: disposeBag)


print("-----deferred-----") //옵저버 안에 옵저버
Observable.deferred {
    Observable.of(1, 2, 3)
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("-----deferred2-----")
var 뒤집기: Bool = false

let factory: Observable<String> = Observable.deferred {
    뒤집기 = !뒤집기
    
    if 뒤집기 {
        return Observable.of("✋")
    } else {
        return Observable.of("🙌🏾")
    }
}
for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
        .disposed(by: disposeBag)
}
