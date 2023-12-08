//
//  DrawOutViewController.swift
//  capstone
//
//  Created by 최병욱 on 12/7/23.
//

import UIKit

class DrawOutViewController:UIViewController{
    
    var token = ""
    
    @IBOutlet weak var howmuch: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBAction func Tapped(_ sender: Any) {
        // http://52.78.16.203:8080/member/withdraw?point=5000
        print(token)
        print(howmuch.text!)
        let url = URL(string: "http://52.78.16.203:8080/member/withdraw?point=\(howmuch.text!)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": token
        ]
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let e = error{
                NSLog("An error has occured: \(e.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                do{
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    //JSON 결과값을 추출
                    let result = jsonObject["result"] as? String
                    print("포인트 출금  결과: \(result)")
                }catch {
                    print(String(describing: error))
                }
            }
            
        }
        task.resume()
        
        
        
        
        
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.layer.cornerRadius = 15
    }
}


extension DrawOutViewController: UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)
   }
}
