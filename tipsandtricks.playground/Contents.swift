//: Playground - noun: a place where people can play

import UIKit

func plus(a: Int, b: Int) -> Int {
    return a + b
}


func calculate(a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

typealias Operation = (Int, Int) -> Int

func newCalculate(a: Int, b: Int, operation: Operation) -> Int {
    return operation(a, b)
}

calculate(1, 2, operation: plus)

calculate(1, 2, operation: { (a: Int, b: Int) -> Int in
    return a * b
})

calculate(1, 2, operation: {(a, b) in
    return a/b
})

let result = calculate(1, 2, operation: {$0 * $1})
result

func someFunctionWithNoEscape(@noescape closure: () -> Int) {
    closure()
}

typealias HTTPClientClosure = (HTTPClientClosureResult) -> Void

enum HTTPClientClosureResult {
    case Success()
    case Failure(ErrorType)
}

enum HTTPClientClosureError: ErrorType {
    case ServerUnavailable
}

func makeRequest(closure: HTTPClientClosure) {
    //Do some networking through Alamofire etc
//    closure(.Success())
    closure(.Failure(HTTPClientClosureError.ServerUnavailable))
}

makeRequest() { result in
    switch(result) {
    case .Success():
        print("Success!")
        break
    case .Failure(let error) :
        print("Error! - \(error)")
        break
    }
}

typealias DataClosureResult = () throws -> NSData
typealias DataClosure = (DataClosureResult) -> Void

enum DataClosureError: ErrorType {
    case UnableToReadData
}

func getData(completionHandler: DataClosure) {
    completionHandler({throw DataClosureError.UnableToReadData})
//    completionHandler({ return NSData() })
}

getData() { result in
    do {
        try result()
        print("We have data")
    } catch DataClosureError.UnableToReadData {
        print("UnableToReadData")
    } catch {
        print("unknown error")
    }
}

//var cb1 = [() -> ()]() // KO

typealias Callback = () -> ()
var cb2 = [Callback]() // OK
