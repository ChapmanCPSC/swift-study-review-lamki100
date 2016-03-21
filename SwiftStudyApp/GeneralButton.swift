//
//  GeneralButton.swift
//  SwiftStudyApp
//
//  Created by Katie on 3/21/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class GeneralButton: UIButton {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // yellow 
        self.backgroundColor = UIColor(netHex: 0xF2E394)
        
        // teal
        self.titleLabel?.textColor = UIColor(netHex: 0x588C7E)
        self.layer.cornerRadius = 10
    }
}
