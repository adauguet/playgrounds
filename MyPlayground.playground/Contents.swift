//: Playground - noun: a place where people can play

import UIKit
import Foundation

let array = [[1, 2], [3, 4]]

print(Array(array.joined()))

print(array.reduce([], +))

print(array.flatMap({ $0 }))