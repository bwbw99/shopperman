//
//  MyPageViewController.swift
//  capstone
//
//  Created by 최병욱 on 11/6/23.
//

import UIKit

class MyPageViewController:UIViewController{
    
    var token : String = ""
    
    @IBOutlet weak var BlaBlaLabel: UILabel!
    @IBOutlet weak var NicknameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var PointLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var RequestCheckButton: CustomButton!
    @IBOutlet weak var DelieverCheckButton: CustomButton!

    
    @IBOutlet weak var PointOutButton: CustomButton!
    
    
    
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var LogoutButton: UIButton!
    
    
    @IBAction func LogoutButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title:"로그아웃 하시겠습니까?",message: "",preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        //확인 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .default, handler: {
            action in
            self.token = ""
            self.BlaBlaLabel.isHidden = false
            self.LoginButton.isHidden = false
            self.RequestCheckButton.isHidden = true
            self.DelieverCheckButton.isHidden = true
            self.PointOutButton.isHidden = true
            self.LogoutButton.isHidden = true
            self.NicknameLabel.text = ""
            self.IdLabel.text = ""
            self.PointLabel.text = ""
        })
        alert.addAction(cancle)
        //확인 버튼 경고창에 추가하기
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [LoginButton,LogoutButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNotiObserver()
        if token == ""{
            BlaBlaLabel.isHidden = false
            LoginButton.isHidden = false
            RequestCheckButton.isHidden = true
            DelieverCheckButton.isHidden = true
            PointOutButton.isHidden = true
            LogoutButton.isHidden = true
            self.NicknameLabel.text = ""
            self.IdLabel.text = ""
            self.PointLabel.text = ""
        }
        
        
        if token != ""{
            BlaBlaLabel.isHidden = true
            LoginButton.isHidden = true
            RequestCheckButton.isHidden = false
            DelieverCheckButton.isHidden = false
            PointOutButton.isHidden = false
            LogoutButton.isHidden = false
            let url = URL(string: "http://52.78.16.203:8080/member/get/subject")
            
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
                        let result_1 = jsonObject["nickname"] as? String
                        self.NicknameLabel.text = result_1
                        let result_2 = jsonObject["id"] as? String
                        self.IdLabel.text = result_2
                        let result_3 = jsonObject["point"] as? Int
                        self.PointLabel.text = String(result_3!)
                    }catch {
                        print(String(describing: error))
                    }
                }
            }
            
            task.resume()
            
            
        }
        
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_1"{
            guard let vc = segue.destination as? CheckRequestViewController else {return}
            vc.token = token
        }
        else if segue.identifier == "segue_2"{
            guard let vc = segue.destination as? CheckDelieverViewController else {return}
            vc.token = token
        }
        else if segue.identifier == "point"{
            guard let vc = segue.destination as? DrawOutViewController else {return}
            vc.token = token
        }
    }
    
    
    
    
    
    
    private func addNotiObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(LogIn),
                                               name: NSNotification.Name("LoginData"),
                                               object: nil)
    }
    
    
    @objc func LogIn(notification : NSNotification){
        if let text = notification.object as? String{
            self.token = text
        }
    }
}
