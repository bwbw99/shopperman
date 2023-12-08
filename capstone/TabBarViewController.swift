//
//  TabBarViewController.swift
//  capstone
//
//  Created by 최병욱 on 11/9/23.
//

import UIKit


class TabBarViewController:UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigation bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }

    
}
