//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)




/// MARK: 나이 더하기
/// - Parameters:
///   - a: a의 나이
///   - b: b의 나이
/// - Returns: 둘 나이의 합
func add(a: Int, b: Int) -> Int {
    return a+b
}




/// <#Description#>
enum HelloError: Error {
    case noName
    case noAge
    case unknown
}


