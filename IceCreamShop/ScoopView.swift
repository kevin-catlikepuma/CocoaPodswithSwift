//
//  FlavorView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

class ScoopView: UIView {
  
  // MARK: Variables
  
  @IBInspectable var topColor: UIColor = Flavor.vanilla().topColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var bottomColor: UIColor = Flavor.vanilla().bottomColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  // MARK: View Lifecycle
  
  override func drawRect(rect: CGRect) {
    
    let context = UIGraphicsGetCurrentContext()
    
    let path = CGPathCreateWithEllipseInRect(bounds, nil)
    CGContextAddPath(context, path)
    CGContextClip(context)
    
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [topColor.CGColor, bottomColor.CGColor], [0, 1])
    let startPoint = CGPointMake(bounds.midX, bounds.minY)
    let endPoint = CGPointMake(bounds.midX, bounds.maxY)
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions())
  }
}
