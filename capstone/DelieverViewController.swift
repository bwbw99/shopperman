//
//  DelieverViewController.swift
//  capstone
//
//  Created by 최병욱 on 11/27/23.
//

import UIKit
import CoreLocation

class DelieverViewController:UIViewController,CLLocationManagerDelegate{
    
    var token : String = ""
    var total_point : Int = 0
    static var DVCids: [Int] = []
    let locationManager = CLLocationManager()
    var deliever_X : Double = 0.0
    var deliever_Y : Double = 0.0
    
    @IBOutlet weak var TotalView: UIView!
    
    @IBOutlet weak var request_1: UIView!
    @IBOutlet weak var request_2: UIView!
    @IBOutlet weak var request_3: UIView!
    @IBOutlet weak var request_4: UIView!
    @IBOutlet weak var request_5: UIView!
    @IBOutlet weak var request_6: UIView!
    
    @IBOutlet weak var tap_1: UIButton!
    @IBOutlet weak var tap_2: UIButton!
    @IBOutlet weak var tap_3: UIButton!
    @IBOutlet weak var tap_4: UIButton!
    @IBOutlet weak var tap_5: UIButton!
    @IBOutlet weak var tap_6: UIButton!
    
    
        
    
    
    
    @IBOutlet weak var id_1: UILabel!
    @IBOutlet weak var id_2: UILabel!
    @IBOutlet weak var id_3: UILabel!
    @IBOutlet weak var id_4: UILabel!
    @IBOutlet weak var id_5: UILabel!
    @IBOutlet weak var id_6: UILabel!
    
    
    @IBOutlet weak var title_1: UILabel!
    @IBOutlet weak var title_2: UILabel!
    @IBOutlet weak var title_3: UILabel!
    @IBOutlet weak var title_4: UILabel!
    @IBOutlet weak var title_5: UILabel!
    @IBOutlet weak var title_6: UILabel!
    
    
    @IBOutlet weak var item_1: UILabel!
    @IBOutlet weak var item_2: UILabel!
    @IBOutlet weak var item_3: UILabel!
    @IBOutlet weak var item_4: UILabel!
    @IBOutlet weak var item_5: UILabel!
    @IBOutlet weak var item_6: UILabel!
    
    
    @IBOutlet weak var tip_1: UILabel!
    @IBOutlet weak var tip_2: UILabel!
    @IBOutlet weak var tip_3: UILabel!
    @IBOutlet weak var tip_4: UILabel!
    @IBOutlet weak var tip_5: UILabel!
    @IBOutlet weak var tip_6: UILabel!
    
    
    @IBOutlet weak var market_distance_1: UILabel!
    @IBOutlet weak var market_distance_2: UILabel!
    @IBOutlet weak var market_distance_3: UILabel!
    @IBOutlet weak var market_distance_4: UILabel!
    @IBOutlet weak var market_distance_5: UILabel!
    @IBOutlet weak var market_distance_6: UILabel!
    
    
    @IBOutlet weak var requester_distance_1: UILabel!
    @IBOutlet weak var requester_distance_2: UILabel!
    @IBOutlet weak var requester_distance_3: UILabel!
    @IBOutlet weak var requester_distance_4: UILabel!
    @IBOutlet weak var requester_distance_5: UILabel!
    @IBOutlet weak var requester_distance_6: UILabel!
    
    
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title:"배달을 시작할까요?",message: "",preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        //확인 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .default, handler: {
            action in
            print(self.token)
            
            let paramData = try! JSONSerialization.data(withJSONObject: DelieverViewController.DVCids, options: [])
            let url = URL(string: "http://52.78.16.203:8080/delivery/start")
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
                        print("배달 신청 (start) 결과: \(result)")
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
            self.performSegue(withIdentifier: "Deliever", sender: sender)
            DelieverViewController.DVCids = []
        })
        alert.addAction(cancle)
        //확인 버튼 경고창에 추가하기
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        delNotiObserver()
        delNewObserver()
        addNotiObserver()
        addNewObserver()
        addLoginObserver()
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            
            // Start updating location
            locationManager.startUpdatingLocation()
        } else {
            print("Location services are not enabled.")
        }
        
        
        
        
        let constraintKey = "TotalViewHeight"
        var constraint:NSLayoutConstraint?
        
        constraint = TotalView.constraints.first(where: { $0.identifier == constraintKey })
        
        
        guard let constraint = constraint else {return}
        constraint.constant = 900 - 125 * 6
        
        request_1.layer.cornerRadius = 15
        request_2.layer.cornerRadius = 15
        request_3.layer.cornerRadius = 15
        request_4.layer.cornerRadius = 15
        request_5.layer.cornerRadius = 15
        request_6.layer.cornerRadius = 15
        startButton.layer.cornerRadius = 15
        
        if DelieverViewController.DVCids.count == 0{
            constraint.constant = 900 - 125 * 6
            request_1.isHidden = true
            request_2.isHidden = true
            request_3.isHidden = true
            request_4.isHidden = true
            request_5.isHidden = true
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 1{
            constraint.constant = 900 - 125 * 5
            request_1.isHidden = false
            request_2.isHidden = true
            request_3.isHidden = true
            request_4.isHidden = true
            request_5.isHidden = true
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 2{
            constraint.constant = 900 - 125 * 4
            request_1.isHidden = false
            request_2.isHidden = false
            request_3.isHidden = true
            request_4.isHidden = true
            request_5.isHidden = true
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 3{
            constraint.constant = 900 - 125 * 3
            request_1.isHidden = false
            request_2.isHidden = false
            request_3.isHidden = false
            request_4.isHidden = true
            request_5.isHidden = true
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 4{
            constraint.constant = 900 - 125 * 2
            request_1.isHidden = false
            request_2.isHidden = false
            request_3.isHidden = false
            request_4.isHidden = false
            request_5.isHidden = true
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 5{
            constraint.constant = 900 - 125
            request_1.isHidden = false
            request_2.isHidden = false
            request_3.isHidden = false
            request_4.isHidden = false
            request_5.isHidden = false
            request_6.isHidden = true
        }
        else if DelieverViewController.DVCids.count == 6{
            constraint.constant = 900
            request_1.isHidden = false
            request_2.isHidden = false
            request_3.isHidden = false
            request_4.isHidden = false
            request_5.isHidden = false
            request_6.isHidden = false
        }
        
      
        
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // Access the coordinates
        self.deliever_X = location.coordinate.longitude
        self.deliever_Y = location.coordinate.latitude
        
        
        if DelieverViewController.DVCids.count > 0{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[0])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_1.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_1.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_1.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_1.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_1.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_1.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 0
        
        if DelieverViewController.DVCids.count > 1{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[1])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_2.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_2.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_2.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_2.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_2.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_2.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 1
        
        if DelieverViewController.DVCids.count > 2{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[2])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_3.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_3.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_3.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_3.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_3.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_3.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 2
        
        if DelieverViewController.DVCids.count > 3{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[3])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_4.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_4.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_4.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_4.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_4.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_4.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 3
        
        if DelieverViewController.DVCids.count > 4{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[4])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_5.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_5.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_5.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_5.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_5.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_5.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 4
        
        if DelieverViewController.DVCids.count > 5{
            let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
            let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
            let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(DelieverViewController.DVCids[5])")
            
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
                        let result_1 = jsonObject["title"] as? String
                        self.title_6.text = result_1
                        let result_2 = jsonObject["id"] as? Int
                        self.id_6.text = String(result_2!)
                        let result_3 = jsonObject["item"] as? String
                        self.item_6.text = result_3
                        let result_4 = jsonObject["deliveryTip"] as? Int
                        
                        self.tip_6.text = String(result_4!) + "원"
                        let result_5 = jsonObject["deliveryToMarketDistance"] as? Int
                        self.market_distance_6.text = String(result_5!) + "m"
                        let result_6 = jsonObject["deliveryToRequesterDistance"] as? Int
                        self.requester_distance_6.text = String(result_6!) + "m"
                        
                    }catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        } // end of if DelieverViewController.DVCids.count > 5
        
        
        
        
        
        // Stop updating location to conserve battery
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
    
    
    private func addNotiObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BtnClicked),
                                               name: NSNotification.Name("notiData"),
                                               object: nil)
    }
    
    private func delNotiObserver(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("notiData"), object: nil)
    }

    private func addNewObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(removeData), name: NSNotification.Name("removeData"), object: nil)
    }
    
    private func delNewObserver(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("removeData"), object: nil)
    }
    
    @objc func BtnClicked(notification : NSNotification){
        if let data = notification.object as? Int{
            DelieverViewController.DVCids.append(data)
        }
    }
    
    @objc func removeData(notification : NSNotification){
        if let data = notification.object as? Int{
            if let index = DelieverViewController.DVCids.firstIndex(of: data){
                DelieverViewController.DVCids.remove(at: index)
            }
        }
    }
    
    private func startDeliever(){
        
    }
    
    
    
    
    
    private func addLoginObserver(){
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "req_1"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_1.text!)!
        }
        else if segue.identifier == "req_2"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_2.text!)!
        }
        else if segue.identifier == "req_3"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_3.text!)!
        }
        else if segue.identifier == "req_4"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_4.text!)!
        }
        else if segue.identifier == "req_5"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_5.text!)!
        }
        else if segue.identifier == "req_6"{
            guard let vc = segue.destination as? DelDeliverViewController else {return}
            vc.id = Int(id_6.text!)!
        }
        else if segue.identifier == "Deliever"{
            guard let vc = segue.destination as? MapViewController else {return}
            vc.modalPresentationStyle = .fullScreen
            vc.ids = DelieverViewController.DVCids
            vc.token = token
            DetailViewController.ids = []
            if DelieverViewController.DVCids.count > 0{
                let line : String = self.tip_1.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            if DelieverViewController.DVCids.count > 1{
                let line : String = self.tip_2.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            if DelieverViewController.DVCids.count > 2{
                let line : String = self.tip_3.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            if DelieverViewController.DVCids.count > 3{
                let line : String = self.tip_4.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            if DelieverViewController.DVCids.count > 4{
                let line : String = self.tip_5.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            if DelieverViewController.DVCids.count > 5{
                let line : String = self.tip_6.text!
                var tip : Int = 0
                tip = Int(line[line.startIndex...line.index(before: line.index(before: line.endIndex))])!
                total_point += tip
            }
            vc.point = total_point
            total_point = 0
            
        }
    }
    
}
