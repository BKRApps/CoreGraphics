//
//  NumberView.swift
//  CGExample
//
//  Created by kumar reddy on 25/01/18.
//  Copyright © 2018 kumar reddy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class NumberView : UIView {
    @IBInspectable var lineWidth : CGFloat = 25
    @IBInspectable var fillColor: UIColor = UIColor.red
    @IBInspectable var strokeColor: UIColor = UIColor.green
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        let path = UIBezierPath(ovalIn: insetRect)
        path.lineWidth = lineWidth
        fillColor.setFill()
        path.fill()
        strokeColor.setStroke()
        path.stroke()
    }
}


