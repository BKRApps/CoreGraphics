//
//  DashLines.swift
//  CGExample
//
//  Created by kumar reddy on 25/01/18.
//  Copyright © 2018 kumar reddy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class DashLines : UIView {
    @IBInspectable var lineWidth : CGFloat = 10
    @IBInspectable var fillColor: UIColor = UIColor.red
    @IBInspectable var strokeColor: UIColor = UIColor.green
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        let path = UIBezierPath(rect: insetRect)
        let dashes : [CGFloat] = [10,30]
        path.setLineDash(dashes, count: 2, phase: 0)
        path.stroke()
    }
}

// line cap line join, dash line, clip
