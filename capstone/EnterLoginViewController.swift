//
//  EnterLoginViewController.swift
//  capstone
//
//  Created by 최병욱 on 2023/10/31.
//

import UIKit



class EnterLoginViewController:UIViewController{
    
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ErrorMessageLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginButton.layer.cornerRadius = 30
        
        LoginButton.isEnabled = false
        
        IDTextField.delegate = self
        PasswordTextField.delegate = self
        
        IDTextField.becomeFirstResponder()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigation bar 나타내기
        //navigationController?.navigationBar.isHidden = false
    }
    
    
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        let id = self.IDTextField.text!
        let pwd = self.PasswordTextField.text!
        let param = ["id" : id, "pwd" : pwd]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/member/login")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        
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
                    let result = jsonObject["token"] as? String
                    if (result == nil) {
                        self.ErrorMessageLabel.text = "아이디 또는 비밀번호가 잘못되었습니다"
                    }
                    else{
                        self.ErrorMessageLabel.text = "로그인 성공"
                        NotificationCenter.default.post(name: NSNotification.Name("LoginData"), object: result)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {self.dismiss(animated: true)
                        })
                        
                        
                        
                        
                    }
                    
                    
                }catch let e as NSError{
                    print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }
}

extension EnterLoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isIDEmpty = IDTextField.text == ""
        let isPasswordEmpty = PasswordTextField.text == ""
        
        LoginButton.isEnabled = !isIDEmpty && !isPasswordEmpty
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)
   }
}
