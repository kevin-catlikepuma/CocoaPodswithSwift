//
//  RGBFromString.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/12/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

func RGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
  return RGBA(red, green: green, blue: blue, alpha: 255)
}

func RGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
  return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha/255)
}

extension UIColor {
  
  class func RGBAColorFromString(string: String?) -> UIColor? {
    
    if let string = string {
      
      var components = (string as NSString).componentsSeparatedByString(",") as [NSString]
      
      if components.count == 3 {
        components.append("1.0")
      }
      
      if components.count != 4 {
        return nil
      }
      
      let red = CGFloat(components[0].floatValue / 255)
      let green = CGFloat(components[1].floatValue / 255)
      let blue = CGFloat(components[2].floatValue / 255)
      let alpha = CGFloat(components[3].floatValue / 255)
      
      return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    return nil
  }
}
