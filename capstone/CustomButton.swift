//
//  CustomButton.swift
//  capstone
//
//  Created by 최병욱 on 12/2/23.
//

import Foundation
import UIKit

class CustomButton : UIButton{
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        
        
        setupUnderlinedTextField()
    }
    
    func setupUnderlinedTextField(){
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(bottomLayer)
    }
}
