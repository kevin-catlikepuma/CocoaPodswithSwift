//
//  ScoopCell.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 1/16/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

class ScoopCell: UICollectionViewCell {
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
    layer.cornerRadius = 10.0
  }

  // MARK: Outlets
  
  @IBOutlet var textLabel: UILabel!
  @IBOutlet var scoopView: ScoopView!
}

// MARK: Flavor Adapter

extension ScoopCell: FlavorAdapter {
  
  func updateWithFlavor(flavor: Flavor) {
    
    scoopView.topColor = flavor.topColor
    scoopView.bottomColor = flavor.bottomColor
    scoopView.setNeedsDisplay()
    
    textLabel.text = flavor.name
  }
}