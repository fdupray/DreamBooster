//
//  DBRoundedButton.swift
//  Booster Dream
//
//  Created by DUPRAY COM & CO on 17/09/2018.
//  Copyright © 2018 Booster Dream. All rights reserved.
//

import UIKit

@IBDesignable
class DBRoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 8 {
        
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColour: UIColor = .clear {
        
        didSet {
            self.layer.borderColor = borderColour.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2 {
        
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup () {
        
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderColor = self.borderColour.cgColor
        self.layer.borderWidth = self.borderWidth
    }
}
