//
//  IceCreamView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

class IceCreamView: UIView {
  
  // MARK: Variables
  
  @IBInspectable var iceCreamTopColor: UIColor = Flavor.vanilla().topColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var iceCreamBottomColor: UIColor = Flavor.vanilla().topColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  private let coneOuterColor = RGB(184, green: 104, blue: 50)
  private let coneInnerColor = RGB(209, green: 160, blue: 102)
  private let coneLaticeColor = RGB(235, green: 183, blue: 131)
  
  // MARK: View Lifecycle
  
  override func drawRect(frame: CGRect) {

    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    
    //// Gradient Declarations
    let iceCreamGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [iceCreamTopColor.CGColor, iceCreamBottomColor.CGColor], [0, 1])
    
    //// Shadow Declarations
    let coneInnerShadow = coneOuterColor
    let coneInnerShadowOffset = CGSizeMake(0.1, -0.1)
    let coneInnerShadowBlurRadius: CGFloat = 35
    let scoopShadow = UIColor.blackColor().colorWithAlphaComponent(0.25)
    let scoopShadowOffset = CGSizeMake(0.1, 3.1)
    let scoopShadowBlurRadius: CGFloat = 2
    let coneOuterShadow = UIColor.blackColor().colorWithAlphaComponent(0.35)
    let coneOuterShadowOffset = CGSizeMake(0.1, 3.1)
    let coneOuterShadowBlurRadius: CGFloat = 3
    
    //// Cone Drawing
    let conePath = UIBezierPath()
    conePath.moveToPoint(CGPointMake(frame.minX + 0.98284 * frame.width, frame.minY + 0.29579 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.49020 * frame.width, frame.minY + 0.35519 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.98284 * frame.width, frame.minY + 0.29579 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.72844 * frame.width, frame.minY + 0.35519 * frame.height))
    conePath.addCurveToPoint(CGPointMake(frame.minX + 0.01225 * frame.width, frame.minY + 0.29579 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.25196 * frame.width, frame.minY + 0.35519 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.01225 * frame.width, frame.minY + 0.29579 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 0.49265 * frame.width, frame.minY + 0.98886 * frame.height))
    conePath.addLineToPoint(CGPointMake(frame.minX + 0.98284 * frame.width, frame.minY + 0.29579 * frame.height))
    conePath.closePath()
    conePath.lineJoinStyle = CGLineJoin.Round;
    
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, coneOuterShadowOffset, coneOuterShadowBlurRadius, (coneOuterShadow as UIColor).CGColor)
    coneInnerColor.setFill()
    conePath.fill()
    
    ////// Cone Inner Shadow
    CGContextSaveGState(context)
    CGContextClipToRect(context, conePath.bounds)
    CGContextSetShadow(context, CGSizeMake(0, 0), 0)
    CGContextSetAlpha(context, CGColorGetAlpha((coneInnerShadow as UIColor).CGColor))
    CGContextBeginTransparencyLayer(context, nil)
    let coneOpaqueShadow = (coneInnerShadow as UIColor).colorWithAlphaComponent(1)
    CGContextSetShadowWithColor(context, coneInnerShadowOffset, coneInnerShadowBlurRadius, (coneOpaqueShadow as UIColor).CGColor)
    CGContextSetBlendMode(context, CGBlendMode.SourceOut)
    CGContextBeginTransparencyLayer(context, nil)
    
    coneOpaqueShadow.setFill()
    conePath.fill()
    
    CGContextEndTransparencyLayer(context)
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
    
    CGContextRestoreGState(context)
    
    coneOuterColor.setStroke()
    conePath.lineWidth = 0.5
    conePath.stroke()
    
    
    //// Lattice 1 Drawing
    let lattice1Path = UIBezierPath()
    lattice1Path.moveToPoint(CGPointMake(frame.minX + 0.41667 * frame.width, frame.minY + 0.86881 * frame.height))
    lattice1Path.addLineToPoint(CGPointMake(frame.minX + 0.62255 * frame.width, frame.minY + 0.79950 * frame.height))
    coneLaticeColor.setStroke()
    lattice1Path.lineWidth = 1
    lattice1Path.stroke()
    
    
    //// Lattice 2 Drawing
    let lattice2Path = UIBezierPath()
    lattice2Path.moveToPoint(CGPointMake(frame.minX + 0.34804 * frame.width, frame.minY + 0.76980 * frame.height))
    lattice2Path.addLineToPoint(CGPointMake(frame.minX + 0.73039 * frame.width, frame.minY + 0.64604 * frame.height))
    coneLaticeColor.setStroke()
    lattice2Path.lineWidth = 1
    lattice2Path.stroke()
    
    
    //// Lattice 3 Drawing
    let lattice3Path = UIBezierPath()
    lattice3Path.moveToPoint(CGPointMake(frame.minX + 0.27941 * frame.width, frame.minY + 0.67079 * frame.height))
    lattice3Path.addLineToPoint(CGPointMake(frame.minX + 0.82843 * frame.width, frame.minY + 0.50743 * frame.height))
    coneLaticeColor.setStroke()
    lattice3Path.lineWidth = 1
    lattice3Path.stroke()
    
    
    //// Lattice 4 Drawing
    let lattice4Path = UIBezierPath()
    lattice4Path.moveToPoint(CGPointMake(frame.minX + 0.21078 * frame.width, frame.minY + 0.57178 * frame.height))
    lattice4Path.addLineToPoint(CGPointMake(frame.minX + 0.92647 * frame.width, frame.minY + 0.36881 * frame.height))
    coneLaticeColor.setStroke()
    lattice4Path.lineWidth = 1
    lattice4Path.stroke()
    
    
    //// Lattice 5 Drawing
    let lattice5Path = UIBezierPath()
    lattice5Path.moveToPoint(CGPointMake(frame.minX + 0.14216 * frame.width, frame.minY + 0.47277 * frame.height))
    lattice5Path.addLineToPoint(CGPointMake(frame.minX + 0.53431 * frame.width, frame.minY + 0.35891 * frame.height))
    coneLaticeColor.setStroke()
    lattice5Path.lineWidth = 1
    lattice5Path.stroke()
    
    
    //// Lattice 6 Drawing
    let lattice6Path = UIBezierPath()
    lattice6Path.moveToPoint(CGPointMake(frame.minX + 0.07353 * frame.width, frame.minY + 0.37376 * frame.height))
    lattice6Path.addLineToPoint(CGPointMake(frame.minX + 0.20098 * frame.width, frame.minY + 0.33416 * frame.height))
    coneLaticeColor.setStroke()
    lattice6Path.lineWidth = 1
    lattice6Path.stroke()
    
    
    //// Lattice 7 Drawing
    let lattice7Path = UIBezierPath()
    coneLaticeColor.setStroke()
    lattice7Path.lineWidth = 1
    lattice7Path.stroke()
    
    
    //// Lattice 8 Drawing
    let lattice8Path = UIBezierPath()
    UIColor.blackColor().setStroke()
    lattice8Path.lineWidth = 1
    lattice8Path.stroke()
    
    
    //// Lattice 9 Drawing
    let lattice9Path = UIBezierPath()
    lattice9Path.moveToPoint(CGPointMake(frame.minX + 0.64706 * frame.width, frame.minY + 0.76733 * frame.height))
    lattice9Path.addLineToPoint(CGPointMake(frame.minX + 0.25490 * frame.width, frame.minY + 0.64356 * frame.height))
    coneLaticeColor.setStroke()
    lattice9Path.lineWidth = 1
    lattice9Path.stroke()
    
    
    //// Lattice 10 Drawing
    let lattice10Path = UIBezierPath()
    lattice10Path.moveToPoint(CGPointMake(frame.minX + 0.71569 * frame.width, frame.minY + 0.66832 * frame.height))
    lattice10Path.addLineToPoint(CGPointMake(frame.minX + 0.16176 * frame.width, frame.minY + 0.50248 * frame.height))
    coneLaticeColor.setStroke()
    lattice10Path.lineWidth = 1
    lattice10Path.stroke()
    
    
    //// Lattice 11 Drawing
    let lattice11Path = UIBezierPath()
    lattice11Path.moveToPoint(CGPointMake(frame.minX + 0.78922 * frame.width, frame.minY + 0.56683 * frame.height))
    lattice11Path.addLineToPoint(CGPointMake(frame.minX + 0.06373 * frame.width, frame.minY + 0.35891 * frame.height))
    coneLaticeColor.setStroke()
    lattice11Path.lineWidth = 1
    lattice11Path.stroke()
    
    
    //// Lattice 12 Drawing
    let lattice12Path = UIBezierPath()
    lattice12Path.moveToPoint(CGPointMake(frame.minX + 0.85294 * frame.width, frame.minY + 0.46535 * frame.height))
    lattice12Path.addLineToPoint(CGPointMake(frame.minX + 0.46078 * frame.width, frame.minY + 0.35644 * frame.height))
    coneLaticeColor.setStroke()
    lattice12Path.lineWidth = 1
    lattice12Path.stroke()
    
    
    //// Lattice 13 Drawing
    let lattice13Path = UIBezierPath()
    lattice13Path.moveToPoint(CGPointMake(frame.minX + 0.92157 * frame.width, frame.minY + 0.37129 * frame.height))
    lattice13Path.addLineToPoint(CGPointMake(frame.minX + 0.79412 * frame.width, frame.minY + 0.33168 * frame.height))
    coneLaticeColor.setStroke()
    lattice13Path.lineWidth = 1
    lattice13Path.stroke()
    
    
    //// Lattice 14 Drawing
    let lattice14Path = UIBezierPath()
    lattice14Path.moveToPoint(CGPointMake(frame.minX + 0.58333 * frame.width, frame.minY + 0.85891 * frame.height))
    lattice14Path.addCurveToPoint(CGPointMake(frame.minX + 0.35784 * frame.width, frame.minY + 0.78465 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.36765 * frame.width, frame.minY + 0.78465 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.35784 * frame.width, frame.minY + 0.78465 * frame.height))
    coneLaticeColor.setStroke()
    lattice14Path.lineWidth = 1
    lattice14Path.stroke()
    
    
    //// Scoop Drawing
    let scoopPath = UIBezierPath()
    scoopPath.moveToPoint(CGPointMake(frame.minX + 0.39216 * frame.width, frame.minY + 0.35149 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.43137 * frame.width, frame.minY + 0.35149 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.43137 * frame.width, frame.minY + 0.40099 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.58824 * frame.width, frame.minY + 0.35149 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.56863 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.54902 * frame.width, frame.minY + 0.35149 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.68627 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.62745 * frame.width, frame.minY + 0.35149 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.62745 * frame.width, frame.minY + 0.40099 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.78431 * frame.width, frame.minY + 0.33663 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.74510 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.74510 * frame.width, frame.minY + 0.33663 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.88235 * frame.width, frame.minY + 0.37129 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.82353 * frame.width, frame.minY + 0.33663 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.82353 * frame.width, frame.minY + 0.37129 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.30198 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.94118 * frame.width, frame.minY + 0.37129 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.31683 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.25248 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.28713 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.26967 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.50000 * frame.width, frame.minY + 0.00495 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.99020 * frame.width, frame.minY + 0.11577 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.77073 * frame.width, frame.minY + 0.00495 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.25248 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.22927 * frame.width, frame.minY + 0.00495 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.11577 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.30198 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.27047 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.28713 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.10784 * frame.width, frame.minY + 0.37624 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.00980 * frame.width, frame.minY + 0.31683 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.04902 * frame.width, frame.minY + 0.37624 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.19608 * frame.width, frame.minY + 0.33663 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.16667 * frame.width, frame.minY + 0.37624 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.15686 * frame.width, frame.minY + 0.33663 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.29412 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.23529 * frame.width, frame.minY + 0.33663 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.22549 * frame.width, frame.minY + 0.40099 * frame.height))
    scoopPath.addCurveToPoint(CGPointMake(frame.minX + 0.39216 * frame.width, frame.minY + 0.35149 * frame.height), controlPoint1: CGPointMake(frame.minX + 0.36275 * frame.width, frame.minY + 0.40099 * frame.height), controlPoint2: CGPointMake(frame.minX + 0.35294 * frame.width, frame.minY + 0.35149 * frame.height))
    scoopPath.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, scoopShadowOffset, scoopShadowBlurRadius, (scoopShadow as UIColor).CGColor)
    CGContextBeginTransparencyLayer(context, nil)
    scoopPath.addClip()
    let scoopBounds = CGPathGetPathBoundingBox(scoopPath.CGPath)
    CGContextDrawLinearGradient(context, iceCreamGradient,
      CGPointMake(scoopBounds.midX, scoopBounds.minY),
      CGPointMake(scoopBounds.midX, scoopBounds.maxY),
      CGGradientDrawingOptions())
    CGContextEndTransparencyLayer(context)
    CGContextRestoreGState(context)
  }
}

extension IceCreamView: FlavorAdapter {
  
  func updateWithFlavor(flavor: Flavor) {
    
    self.iceCreamTopColor = flavor.topColor
    self.iceCreamBottomColor = flavor.bottomColor
    setNeedsDisplay()
  }
}
