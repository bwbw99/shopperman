//
//  FinalViewController.swift
//  capstone
//
//  Created by 최병욱 on 12/7/23.
//

import UIKit

class FinalViewController:UIViewController{
    
    var point : Int = 9000
    
    @IBOutlet weak var ExplainLabel: UILabel!
    @IBOutlet weak var GoBackButton: CustomButton!
    @IBAction func GoBackButtonTapped(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExplainLabel.text = "모든 배달을\n완료하고\n\(point)포인트를 벌었어요!"
        
        ExplainLabel.setLineSpacing(spacing: 30.0)
        ExplainLabel.textAlignment = .center
        
        GoBackButton.layer.borderWidth = 1
        GoBackButton.layer.borderColor = UIColor.white.cgColor
        GoBackButton.layer.cornerRadius = 30
        
    }
}
