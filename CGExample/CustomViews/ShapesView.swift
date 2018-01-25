//
//  Polygons.swift
//  CGExample
//
//  Created by kumar reddy on 25/01/18.
//  Copyright © 2018 kumar reddy. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit 

@IBDesignable
final class ShapesView : UIView {
    
    let lineWidth: CGFloat = 2
    let fillColor: UIColor = UIColor.lightGray
    let strokeColor: UIColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        let path = toolTipView(rect: rect,lineWidth: lineWidth)
        path.lineWidth = lineWidth
        fillColor.setFill()
        path.fill()
        strokeColor.setStroke()
        path.stroke()
    }
}

extension ShapesView {
    func traingleView(rect:CGRect,lineWidth:CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        path.move(to: CGPoint(x: insetRect.midX, y: 0))
        path.addLine(to: CGPoint(x: insetRect.midX + (insetRect.midX/2), y: insetRect.maxY))
        path.addLine(to: CGPoint(x: insetRect.midX - (insetRect.midX/2), y: insetRect.maxY))
        path.close()
        return path
    }
    
    func polygonView(rect:CGRect,lineWidth:CGFloat) -> UIBezierPath {
        let sideAdjustments : CGFloat = 60
        let heightAdjustMents : CGFloat = rect.maxY/3
        let path = UIBezierPath()
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: insetRect.midX + sideAdjustments, y: heightAdjustMents))
        path.addLine(to: CGPoint(x: insetRect.midX+(sideAdjustments/2), y: 2*heightAdjustMents))
        path.addLine(to: CGPoint(x: insetRect.midX-(sideAdjustments/2), y: 2*heightAdjustMents))
        path.addLine(to: CGPoint(x: insetRect.midX-sideAdjustments, y: heightAdjustMents))
        path.close()
        return path
    }
    
    func toolTipView(rect:CGRect,lineWidth:CGFloat) -> UIBezierPath {
    
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        let tipStartPoint: CGFloat = 40
        let tipWidth: CGFloat = 20
        let tipHeight: CGFloat = 20
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: insetRect.minX, y: tipHeight))
        path.addLine(to: CGPoint(x: tipStartPoint, y: tipHeight))
        path.addLine(to: CGPoint(x: tipStartPoint + tipWidth/2, y: 0))
        path.addLine(to: CGPoint(x: tipStartPoint+tipWidth, y: tipHeight))
        path.addLine(to: CGPoint(x: insetRect.maxX, y: tipHeight))
        path.addLine(to: CGPoint(x: insetRect.maxX, y: insetRect.maxY))
        path.addLine(to: CGPoint(x: insetRect.minX, y: insetRect.maxY))
        path.close()
        
        return path
    }
}

extension ShapesView {
    func creatPath() -> UIBezierPath {
        // create a new path
        let path = UIBezierPath()
        
        // starting point for the path (bottom left)
        path.move(to: CGPoint(x: 2, y: 26))
        
        // *********************
        // ***** Left side *****
        // *********************
        
        // segment 1: line
        path.addLine(to: CGPoint(x: 2, y: 15))
        
        // segment 2: curve
        path.addCurve(to: CGPoint(x: 0, y: 12), // ending point
            controlPoint1: CGPoint(x: 2, y: 14),
            controlPoint2: CGPoint(x: 0, y: 14))
        
        // segment 3: line
        path.addLine(to: CGPoint(x: 0, y: 2))
        
        // *********************
        // ****** Top side *****
        // *********************
        
        // segment 4: arc
        path.addArc(withCenter: CGPoint(x: 2, y: 2), // center point of circle
            radius: 2, // this will make it meet our path line
            startAngle: CGFloat(M_PI), // π radians = 180 degrees = straight left
            endAngle: CGFloat(3*M_PI_2), // 3π/2 radians = 270 degrees = straight up
            clockwise: true) // startAngle to endAngle goes in a clockwise direction
        
        // segment 5: line
        path.addLine(to: CGPoint(x: 8, y: 0))
        // segment 6: arc
        path.addArc(withCenter: CGPoint(x: 8, y: 2),
                    radius: 2,
                    startAngle: CGFloat(3*M_PI_2), // straight up
            endAngle: CGFloat(0), // 0 radians = straight right
            clockwise: true)
        
        // *********************
        // ***** Right side ****
        // *********************
        
        // segment 7: line
        path.addLine(to: CGPoint(x: 10, y: 12))
        
        // segment 8: curve
        path.addCurve(to: CGPoint(x: 8, y: 15), // ending point
            controlPoint1: CGPoint(x: 10, y: 14),
            controlPoint2: CGPoint(x: 8, y: 14))
        
        // segment 9: line
        path.addLine(to: CGPoint(x: 8, y: 26))
        
        // *********************
        // **** Bottom side ****
        // *********************
        
        // segment 10: line
        path.close() // draws the final line to close the path
        
        return path
    }
}
