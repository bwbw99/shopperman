//
//  DeveloperMode.swift
//  capstone
//
//  Created by 최병욱 on 11/2/23.
//

import UIKit

class DeveloperMode:UIViewController{
    @IBOutlet weak var UserData: UILabel!
    @IBOutlet weak var tapGetButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigation bar 나타내기
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func taptapGetButton(_ sender: UIButton) {
        
        let url = URL(string: "http://3.39.195.196:8080/test/member")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                        
                    guard let data = data else {return}
                    print("data:  \(data)")
                        
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                            
                        if let id = json["id"] as? String{
                            print("id : \(id)")
                            DispatchQueue.main.async {
                                self.UserData.text = id
                            }
                            
                        }
                    }
                        
                }.resume()
        
        
        
    }
}
