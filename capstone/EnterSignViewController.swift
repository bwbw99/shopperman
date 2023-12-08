//
//  EnterSignViewController.swift
//  capstone
//
//  Created by 최병욱 on 2023/10/31.
//

import UIKit

class EnterSignViewController: UIViewController{
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var ErrorMessageLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NextButton.layer.cornerRadius = 30
        
        NextButton.isEnabled = false
        
        IDTextField.delegate = self
        PasswordTextField.delegate = self
        NameTextField.delegate = self
        NicknameTextField.delegate = self
        
        IDTextField.becomeFirstResponder()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigation bar 나타내기
        //navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        let id = self.IDTextField.text!
        let pwd = self.PasswordTextField.text!
        let name = self.NameTextField.text!
        let nickname = self.NicknameTextField.text!
        let param = ["id" : id, "pwd" : pwd, "name" : name, "nickname" : nickname]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        
        let url = URL(string: "http://52.78.16.203:8080/member/join")
        
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
                            let result = jsonObject["result"] as? String
                            
                            
                            if result == "JOIN_FAILURE_NICKNAME_DUPLICATE" {
                                self.ErrorMessageLabel.text = "이미 존재하는 닉네임입니다."
                            }
                            if result == "JOIN_FAILURE_ID_DUPLICATE" {
                                self.ErrorMessageLabel.text = "이미 존재하는 아이디입니다."
                            }
                            if result == "JOIN_SUCCESS"{
                                self.ErrorMessageLabel.text = "회원가입이 완료되었습니다!"
                            }

                        }catch let e as NSError{
                            print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                            
                        }
                    }
            
        }
        task.resume()
        
    }
    
}

extension EnterSignViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isIDEmpty = IDTextField.text == ""
        let isPasswordEmpty = PasswordTextField.text == ""
        let isNameEmpty = NameTextField.text == ""
        let isNicknameEmpty = NicknameTextField.text == ""
        
        NextButton.isEnabled = !isIDEmpty && !isPasswordEmpty && !isNameEmpty && !isNicknameEmpty
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)
   }
}


