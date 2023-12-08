//
//  WriteViewController.swift
//  capstone
//
//  Created by 최병욱 on 11/28/23.
//

import UIKit

class WriteViewController:UIViewController{
    
    var token : String = ""
    
    @IBOutlet weak var TitleField: CustomTextFields!
    @IBOutlet weak var ItemField: CustomTextFields!
    @IBOutlet weak var PriceField: CustomTextFields!
    @IBOutlet weak var MarketNameField: CustomTextFields!
    @IBOutlet weak var MarketPlaceField: CustomTextFields!
    @IBOutlet weak var DelieverPlaceField: CustomTextFields!
    @IBOutlet weak var DelieverPlaceField_2: CustomTextFields!
    @IBOutlet weak var DelieverTipLabel: UILabel!
    @IBOutlet weak var TipCheckButton: UIButton!
    @IBOutlet weak var DetailTextView: UITextView!
    
    @IBOutlet weak var MarketCheckButton: UIButton!
    
    @IBOutlet weak var DelieverCheckButton: UIButton!
    
    
    @IBOutlet weak var MarketPossibleLabel: UILabel!
    
    @IBOutlet weak var DelieverPossibleLabel: UILabel!
    
    
    
    
    
    var market_X: String = ""
    var market_Y: String = ""
    var deliever_X : String = ""
    var deliever_Y : String = ""
    
    
    
    
    
    @IBOutlet weak var DetailBox: UIView!
    @IBOutlet weak var PostButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TipCheckButton.layer.cornerRadius = 15
        PostButton.layer.cornerRadius = 15
        DetailBox.layer.cornerRadius = 10
        MarketCheckButton.layer.cornerRadius = 15
        DelieverCheckButton.layer.cornerRadius = 15
        
        
        
        print("viewLoaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNotiObserver()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)
   }
    
    
    
    @IBAction func MarketButtonTapped(_ sender: UIButton) {
        print("판매처 주소확인 누름")
        
        let doro:String = MarketPlaceField.text!
        let url = URL(string: "http://52.78.16.203:8080/location/geo?roadName=\(doro)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
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
                    let result_1 = jsonObject["mapX"] as? String
                    if result_1 == nil{
                        self.MarketPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                    }
                    else{
                        self.market_X = result_1!
                        self.MarketPossibleLabel.text = "올바른 주소입니다!"
                    }
                    
                    let result_2 = jsonObject["mapY"] as? String
                    if result_2 == nil{
                        self.MarketPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                    }
                    else{
                        self.market_Y = result_2!
                        self.MarketPossibleLabel.text = "올바른 주소입니다!"
                    }
                    
                }catch {
                    self.MarketPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                }
            }
        }
        task.resume()
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func DelieverButtonTapped(_ sender: UIButton) {
        print("배달지 주소확인 누름")
        
        let doro:String = DelieverPlaceField.text!
        let url = URL(string: "http://52.78.16.203:8080/location/geo?roadName=\(doro)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
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
                    let result_1 = jsonObject["mapX"] as? String
                    if result_1 == nil{
                        self.DelieverPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                    }
                    else{
                        self.deliever_X = result_1!
                        self.DelieverPossibleLabel.text = "올바른 주소입니다!"
                    }
                    
                    let result_2 = jsonObject["mapY"] as? String
                    if result_2 == nil{
                        self.DelieverPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                    }
                    else{
                        self.deliever_Y = result_2!
                        self.DelieverPossibleLabel.text = "올바른 주소입니다!"
                    }
                    
                }catch {
                    self.DelieverPossibleLabel.text = "주소를 올바르게 입력하였나요?"
                }
            }
        }
        task.resume()
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    @IBAction func CheckButtonTapped(_ sender: UIButton) {
        
        // 입력한 주소의 좌표를 변환
        print("비용확인 누름")
        
        let requester = ["mapX" : self.deliever_X, "mapY" : self.deliever_Y]
        let market = ["mapX" : self.market_X, "mapY" : self.market_Y]
        
        let param = ["requesterLocation" : requester, "marketLocation" : market]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/post/deliveryTip/calculate")
        
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
                    let cal_result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Int
                    if cal_result == nil{
                        self.DelieverTipLabel.text = "주소를 올바르게 입력하였나요?"
                    }
                    else{
                        self.DelieverTipLabel.text = String(cal_result!) + "원"
                    }
                }catch {
                    self.DelieverTipLabel.text = "주소를 올바르게 입력하였나요?"
                }
            }
        }
        task.resume()
        view.endEditing(true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func PostButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title:"작성한 내용으로 게시글을 등록할까요?",message: "빠뜨린 내용이 없는지 다시 한 번 확인해 주세요!",preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        //확인 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .default, handler: {
            _ in
            self.TitleField.text = ""
            self.ItemField.text = ""
            self.PriceField.text = ""
            self.MarketNameField.text = ""
            self.MarketPlaceField.text = ""
            self.DelieverPlaceField.text = ""
            self.DelieverPlaceField_2.text = ""
            self.DetailTextView.text = ""
            self.MarketPossibleLabel.text = "오른쪽 버튼을 눌러 올바른\n주소인지 확인해주세요"
            self.DelieverPossibleLabel.text = "오른쪽 버튼을 눌러 올바른\n주소인지 확인해주세요"
            self.DelieverTipLabel.text = "오른쪽 버튼을 눌러\n의뢰비용을 확인해보세요"
        })
        alert.addAction(cancle)
        //확인 버튼 경고창에 추가하기
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
        
        let requester = ["roadName" : self.DelieverPlaceField.text!, "addr" : self.DelieverPlaceField_2.text!, "mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)] as? [String:Any]
        
        let market = ["roadName" : self.MarketPlaceField.text!, "marketName" : self.MarketNameField.text!, "mapX" : String(self.market_X), "mapY" : String(self.market_Y)] as? [String:Any]
        
        var line : String = self.DelieverTipLabel.text!
        var tip : Int = 0
        tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
        
        let param = ["title" : self.TitleField.text!, "item" : self.ItemField.text!, "price" : Int(self.PriceField.text!)!, "deliveryTip" : tip, "content" : self.DetailTextView.text!, "requesterLocation" : requester!, "marketLocation" : market!] as? [String : Any]
        
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/post/create")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Authorization": self.token
        ]
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
                    print(result)
                }catch {
                    print(String(describing: error))
                }
            }
        }
        
        task.resume()
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

