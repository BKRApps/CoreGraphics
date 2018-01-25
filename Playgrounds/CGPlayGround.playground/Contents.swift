//: Playground - noun: a place where people can play

import UIKit
import CoreGraphics

let size = CGSize(width: 250, height: 250)
let rect = CGRect(origin: .zero, size: size)

UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
let context = UIGraphicsGetCurrentContext()


UIColor.red.setFill()
UIRectFill(rect)


let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

image

