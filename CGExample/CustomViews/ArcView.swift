//
//  ArcView.swift
//  CGExample
//
//  Created by kumar reddy on 25/01/18.
//  Copyright © 2018 kumar reddy. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

@IBDesignable
final class ArcView : UIView {
    @IBInspectable var lineWidth : CGFloat {
        return bounds.height/4
    }
    @IBInspectable var fillColor: UIColor = UIColor.red
    @IBInspectable var strokeColor: UIColor = UIColor.blue
    
    let margin : CGFloat = 10
    let startAngle : CGFloat = CGFloat.pi
    let endAngle : CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        /*let center = CGPoint(x: rect.midX, y: rect.height-margin)
        let radius = rect.height - 2 * margin - lineWidth/2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = lineWidth
        strokeColor.setStroke()
        path.stroke()*/
        
        let pointerWidth: CGFloat = 50
        let pointerHeight: CGFloat = rect.height-margin-lineWidth
        
        //let path = UIBezierPath(ovalIn: CGRect(origin: .zero, size: CGSize(width: pointerWidth, height: pointerHeight)))
        
        let path = UIBezierPath()
        
        /*path.move(to: CGPoint(x: pointerWidth/2, y: 0))
        path.addCurve(to: CGPoint(x: pointerWidth/2, y: pointerHeight), controlPoint1: CGPoint(x: pointerWidth/2, y: 0), controlPoint2: CGPoint(x: -pointerWidth/2, y: pointerHeight))
        
        path.move(to: CGPoint(x: pointerWidth/2, y: 0))
        path.addCurve(to: CGPoint(x: pointerWidth/2, y: pointerHeight), controlPoint1: CGPoint(x: pointerWidth/2, y: 0), controlPoint2: CGPoint(x: pointerWidth+(pointerWidth/2), y: pointerHeight))*/
        
        path.move(to: CGPoint(x: 20, y: 100))
        
        path.addCurve(to: CGPoint(x: 300, y: 50), controlPoint1: CGPoint(x: 150, y: 10), controlPoint2: CGPoint(x: 200, y: 150))
        
        strokeColor.setStroke()
        path.stroke()
        fillColor.setFill()
        path.fill()
        }
}
