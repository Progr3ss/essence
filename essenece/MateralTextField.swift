//
//  MateralTextField.swift
//  essence
//
//  Created by martin chibwe on 3/8/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import Foundation

import UIKit

class MateralTextField: UITextField {
    
    
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.1).CGColor
        layer.borderWidth = 1.0
        
    }
    
    //placeholder
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        
        return CGRectInset(bounds, 10, 0)
    }
    //edit mode
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
        
    }
}