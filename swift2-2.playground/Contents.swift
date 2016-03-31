//: Playground - noun: a place where people can play

import UIKit

/**
 *  Referencing the Objective-C selector of a method
 */

class vc: UIViewController {
    let button = UIButton(type: .System)

    func oldStyle() {
        button.addTarget(self, action: Selector("buttonTapped:"), forControlEvents: .TouchUpInside)
    }
    
    func newStyle() {
        button.addTarget(self, action: #selector(vc.buttonTapped(_:)), forControlEvents: .TouchUpInside)
    }
    
    func newNewStyle() {
        button.addTarget(self, action: .buttonTapped, forControlEvents: .TouchUpInside)
    }
    
    func buttonTapped(sender: UIButton) {}
}

private extension Selector {
    static let buttonTapped = #selector(vc.buttonTapped(_:))
}

private extension vc {
    static let localButtonTapped = #selector(buttonTapped(_:))
}


/**
 *  Naming Functions with Argument Labels
 */

typealias MyModel = NSObject

extension MyModel {
    func insertData(data: NSData, at index: Int) {}
    func insertData(data: NSData, aboveData siblingData: NSData) {}
    func insertData(data: NSData, belowData siblingData: NSData) {}
}

let model = MyModel()
let data = NSData()
let otherData = NSData()
model.insertData(data, at: 1)
model.insertData(data, aboveData: otherData)


/**
 *  Naming Functions with Argument Labels
 */

for i in 1.stride(through: 9, by: 2) {
    print(i)
}

func find(data: NSData, in array: [NSData]) {
    
}


/**
 *  Modernizing Swift's Debugging Identifiers
 */

func error(message: String, file: String = #file, line: Int = #line, function: String = #function) {
}

error("Hello something went wrong!")


/**
 *  Tuple comparison operators
 */

let singer = ("Taylor", "Swift")
let alien = ("Justin", "Bieber")

if singer == alien {
    print("Matching tuples!")
} else {
    print("Non-matching tuples!")
}

/**
 *  Arrays and other slice types now have removeFirst()
 */

var array = Array(1...10)
array.removeFirst()

for number in array {
    print("\(number) green bottles")
}
