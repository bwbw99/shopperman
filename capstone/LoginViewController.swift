//
//  LoginViewController.swift
//  capstone
//
//  Created by 최병욱 on 2023/10/31.
//

import UIKit

class LoginViewController: UIViewController{
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignButton: UIButton!
    @IBOutlet weak var DeveloperButton: UIButton!
    
    
    @IBOutlet weak var TextLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [LoginButton,SignButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
        
        
        TextLabel.setLineSpacing(spacing: 15.0)
        TextLabel.textAlignment = .center
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigation bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }
}

extension UILabel {
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
