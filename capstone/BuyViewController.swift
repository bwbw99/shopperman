//
//  BuyViewController.swift
//  capstone
//
//  Created by 최병욱 on 11/6/23.
//

import UIKit
import CoreLocation

class BuyViewController:UIViewController,CLLocationManagerDelegate{
    
    var token = ""
    
    let locationManager = CLLocationManager()
    var mapX:Double = 126.938920
    var mapY:Double = 37.514919
    
    @IBOutlet weak var DoroAdr: UILabel!
    
    @IBOutlet weak var request_1: UIView!
    @IBOutlet weak var request_2: UIView!
    @IBOutlet weak var request_3: UIView!
    @IBOutlet weak var request_4: UIView!
    @IBOutlet weak var request_5: UIView!
    @IBOutlet weak var request_6: UIView!
    @IBOutlet weak var request_7: UIView!
    @IBOutlet weak var request_8: UIView!
    @IBOutlet weak var request_9: UIView!
    @IBOutlet weak var request_10: UIView!
    
    
    @IBOutlet weak var tap_1: UIButton!
    @IBOutlet weak var tap_2: UIButton!
    @IBOutlet weak var tap_3: UIButton!
    @IBOutlet weak var tap_4: UIButton!
    @IBOutlet weak var tap_5: UIButton!
    @IBOutlet weak var tap_6: UIButton!
    @IBOutlet weak var tap_7: UIButton!
    @IBOutlet weak var tap_8: UIButton!
    @IBOutlet weak var tap_9: UIButton!
    @IBOutlet weak var tap_10: UIButton!
    
    
    @IBOutlet weak var title_1: UILabel!
    @IBOutlet weak var title_2: UILabel!
    @IBOutlet weak var title_3: UILabel!
    @IBOutlet weak var title_4: UILabel!
    @IBOutlet weak var title_5: UILabel!
    @IBOutlet weak var title_6: UILabel!
    @IBOutlet weak var title_7: UILabel!
    @IBOutlet weak var title_8: UILabel!
    @IBOutlet weak var title_9: UILabel!
    @IBOutlet weak var title_10: UILabel!
    
    
    @IBOutlet weak var id_1: UILabel!
    @IBOutlet weak var id_2: UILabel!
    @IBOutlet weak var id_3: UILabel!
    @IBOutlet weak var id_4: UILabel!
    @IBOutlet weak var id_5: UILabel!
    @IBOutlet weak var id_6: UILabel!
    @IBOutlet weak var id_7: UILabel!
    @IBOutlet weak var id_8: UILabel!
    @IBOutlet weak var id_9: UILabel!
    @IBOutlet weak var id_10: UILabel!
    
    
    @IBOutlet weak var item_1: UILabel!
    @IBOutlet weak var item_2: UILabel!
    @IBOutlet weak var item_3: UILabel!
    @IBOutlet weak var item_4: UILabel!
    @IBOutlet weak var item_5: UILabel!
    @IBOutlet weak var item_6: UILabel!
    @IBOutlet weak var item_7: UILabel!
    @IBOutlet weak var item_8: UILabel!
    @IBOutlet weak var item_9: UILabel!
    @IBOutlet weak var item_10: UILabel!
    
    
    @IBOutlet weak var tip_1: UILabel!
    @IBOutlet weak var tip_2: UILabel!
    @IBOutlet weak var tip_3: UILabel!
    @IBOutlet weak var tip_4: UILabel!
    @IBOutlet weak var tip_5: UILabel!
    @IBOutlet weak var tip_6: UILabel!
    @IBOutlet weak var tip_7: UILabel!
    @IBOutlet weak var tip_8: UILabel!
    @IBOutlet weak var tip_9: UILabel!
    @IBOutlet weak var tip_10: UILabel!
    
    
    @IBOutlet weak var market_distance_1: UILabel!
    @IBOutlet weak var market_distance_2: UILabel!
    @IBOutlet weak var market_distance_3: UILabel!
    @IBOutlet weak var market_distance_4: UILabel!
    @IBOutlet weak var market_distance_5: UILabel!
    @IBOutlet weak var market_distance_6: UILabel!
    @IBOutlet weak var market_distance_7: UILabel!
    @IBOutlet weak var market_distance_8: UILabel!
    @IBOutlet weak var market_distance_9: UILabel!
    @IBOutlet weak var market_distance_10: UILabel!
    
    
    @IBOutlet weak var requester_distance_1: UILabel!
    @IBOutlet weak var requester_distance_2: UILabel!
    @IBOutlet weak var requester_distance_3: UILabel!
    @IBOutlet weak var requester_distance_4: UILabel!
    @IBOutlet weak var requester_distance_5: UILabel!
    @IBOutlet weak var requester_distance_6: UILabel!
    @IBOutlet weak var requester_distance_7: UILabel!
    @IBOutlet weak var requester_distance_8: UILabel!
    @IBOutlet weak var requester_distance_9: UILabel!
    @IBOutlet weak var requester_distance_10: UILabel!
    
    
    
    
    @IBOutlet weak var lookmore: UIButton!
    
    var sendID : String = ""
    
    
    @IBAction func func_1(_ sender: Any) {
        performSegue(withIdentifier: "req_1", sender: nil)
    }
    @IBAction func func_2(_ sender: Any) {
        performSegue(withIdentifier: "req_2", sender: nil)
    }
    @IBAction func func_3(_ sender: Any) {
        performSegue(withIdentifier: "req_3", sender: nil)
    }
    @IBAction func func_4(_ sender: Any) {
        performSegue(withIdentifier: "req_4", sender: nil)
    }
    @IBAction func func_5(_ sender: Any) {
        performSegue(withIdentifier: "req_5", sender: nil)
    }
    @IBAction func func_6(_ sender: Any) {
        performSegue(withIdentifier: "req_6", sender: nil)
    }
    @IBAction func func_7(_ sender: Any) {
        performSegue(withIdentifier: "req_7", sender: nil)
    }
    @IBAction func func_8(_ sender: Any) {
        performSegue(withIdentifier: "req_8", sender: nil)
    }
    @IBAction func func_9(_ sender: Any) {
        performSegue(withIdentifier: "req_9", sender: nil)
    }
    @IBAction func func_10(_ sender: Any) {
        performSegue(withIdentifier: "req_10", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNotiObserver()
        
        loadRequests()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            
            // Start updating location
            locationManager.startUpdatingLocation()
        } else {
            print("Location services are not enabled.")
        }
        
        
        request_1.layer.cornerRadius = 15
        request_2.layer.cornerRadius = 15
        request_3.layer.cornerRadius = 15
        request_4.layer.cornerRadius = 15
        request_5.layer.cornerRadius = 15
        request_6.layer.cornerRadius = 15
        request_7.layer.cornerRadius = 15
        request_8.layer.cornerRadius = 15
        request_9.layer.cornerRadius = 15
        request_10.layer.cornerRadius = 15
        lookmore.layer.cornerRadius = 15
        
        
        
        
        
        
        
        
        
        
        
    }
    
    private func loadRequests(){
        let param = ["mapX" : self.mapX, "mapY" : self.mapY]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/post/get/list")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
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
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? NSArray
                    
                    
                    let request_1 = json?.object(at: 0) as! NSDictionary
                    let request_2 = json?.object(at: 1) as! NSDictionary
                    let request_3 = json?.object(at: 2) as! NSDictionary
                    let request_4 = json?.object(at: 3) as! NSDictionary
                    let request_5 = json?.object(at: 4) as! NSDictionary
                    let request_6 = json?.object(at: 5) as! NSDictionary
                    let request_7 = json?.object(at: 6) as! NSDictionary
                    let request_8 = json?.object(at: 7) as! NSDictionary
                    let request_9 = json?.object(at: 8) as! NSDictionary
                    let request_10 = json?.object(at: 9) as! NSDictionary
                    
                    let title_1 = request_1["title"] as? String
                    self.title_1.text = title_1
                    let title_2 = request_2["title"] as? String
                    self.title_2.text = title_2
                    let title_3 = request_3["title"] as? String
                    self.title_3.text = title_3
                    let title_4 = request_4["title"] as? String
                    self.title_4.text = title_4
                    let title_5 = request_5["title"] as? String
                    self.title_5.text = title_5
                    let title_6 = request_6["title"] as? String
                    self.title_6.text = title_6
                    let title_7 = request_7["title"] as? String
                    self.title_7.text = title_7
                    let title_8 = request_8["title"] as? String
                    self.title_8.text = title_8
                    let title_9 = request_9["title"] as? String
                    self.title_9.text = title_9
                    let title_10 = request_10["title"] as? String
                    self.title_10.text = title_10
                
                    
                    let id_1 = request_1["id"] as? Int
                    self.id_1.text = String(id_1!)
                    let id_2 = request_2["id"] as? Int
                    self.id_2.text = String(id_2!)
                    let id_3 = request_3["id"] as? Int
                    self.id_3.text = String(id_3!)
                    let id_4 = request_4["id"] as? Int
                    self.id_4.text = String(id_4!)
                    let id_5 = request_5["id"] as? Int
                    self.id_5.text = String(id_5!)
                    let id_6 = request_6["id"] as? Int
                    self.id_6.text = String(id_6!)
                    let id_7 = request_7["id"] as? Int
                    self.id_7.text = String(id_7!)
                    let id_8 = request_8["id"] as? Int
                    self.id_8.text = String(id_8!)
                    let id_9 = request_9["id"] as? Int
                    self.id_9.text = String(id_9!)
                    let id_10 = request_10["id"] as? Int
                    self.id_10.text = String(id_10!)
                    
                    
                    let item_1 = request_1["item"] as? String
                    self.item_1.text = item_1
                    let item_2 = request_2["item"] as? String
                    self.item_2.text = item_2
                    let item_3 = request_3["item"] as? String
                    self.item_3.text = item_3
                    let item_4 = request_4["item"] as? String
                    self.item_4.text = item_4
                    let item_5 = request_5["item"] as? String
                    self.item_5.text = item_5
                    let item_6 = request_6["item"] as? String
                    self.item_6.text = item_6
                    let item_7 = request_7["item"] as? String
                    self.item_7.text = item_7
                    let item_8 = request_8["item"] as? String
                    self.item_8.text = item_8
                    let item_9 = request_9["item"] as? String
                    self.item_9.text = item_9
                    let item_10 = request_10["item"] as? String
                    self.item_10.text = item_10
                    
                    
                    let tip_1 = request_1["deliveryTip"] as? Int
                    self.tip_1.text = String(tip_1!) + "원"
                    let tip_2 = request_2["deliveryTip"] as? Int
                    self.tip_2.text = String(tip_2!) + "원"
                    let tip_3 = request_3["deliveryTip"] as? Int
                    self.tip_3.text = String(tip_3!) + "원"
                    let tip_4 = request_4["deliveryTip"] as? Int
                    self.tip_4.text = String(tip_4!) + "원"
                    let tip_5 = request_5["deliveryTip"] as? Int
                    self.tip_5.text = String(tip_5!) + "원"
                    let tip_6 = request_6["deliveryTip"] as? Int
                    self.tip_6.text = String(tip_6!) + "원"
                    let tip_7 = request_7["deliveryTip"] as? Int
                    self.tip_7.text = String(tip_7!) + "원"
                    let tip_8 = request_8["deliveryTip"] as? Int
                    self.tip_8.text = String(tip_8!) + "원"
                    let tip_9 = request_9["deliveryTip"] as? Int
                    self.tip_9.text = String(tip_9!) + "원"
                    let tip_10 = request_10["deliveryTip"] as? Int
                    self.tip_10.text = String(tip_10!) + "원"
                    
                    
                    let market_distance_1 = request_1["deliveryToMarketDistance"] as? Int
                    self.market_distance_1.text = String(market_distance_1!) + "m"
                    let market_distance_2 = request_2["deliveryToMarketDistance"] as? Int
                    self.market_distance_2.text = String(market_distance_2!) + "m"
                    let market_distance_3 = request_3["deliveryToMarketDistance"] as? Int
                    self.market_distance_3.text = String(market_distance_3!) + "m"
                    let market_distance_4 = request_4["deliveryToMarketDistance"] as? Int
                    self.market_distance_4.text = String(market_distance_4!) + "m"
                    let market_distance_5 = request_5["deliveryToMarketDistance"] as? Int
                    self.market_distance_5.text = String(market_distance_5!) + "m"
                    let market_distance_6 = request_6["deliveryToMarketDistance"] as? Int
                    self.market_distance_6.text = String(market_distance_6!) + "m"
                    let market_distance_7 = request_7["deliveryToMarketDistance"] as? Int
                    self.market_distance_7.text = String(market_distance_7!) + "m"
                    let market_distance_8 = request_8["deliveryToMarketDistance"] as? Int
                    self.market_distance_8.text = String(market_distance_8!) + "m"
                    let market_distance_9 = request_9["deliveryToMarketDistance"] as? Int
                    self.market_distance_9.text = String(market_distance_9!) + "m"
                    let market_distance_10 = request_10["deliveryToMarketDistance"] as? Int
                    self.market_distance_10.text = String(market_distance_10!) + "m"
                    
                    
                    let requester_distance_1 = request_1["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_1.text = String(requester_distance_1!) + "m"
                    let requester_distance_2 = request_2["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_2.text = String(requester_distance_2!) + "m"
                    let requester_distance_3 = request_3["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_3.text = String(requester_distance_3!) + "m"
                    let requester_distance_4 = request_4["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_4.text = String(requester_distance_4!) + "m"
                    let requester_distance_5 = request_5["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_5.text = String(requester_distance_5!) + "m"
                    let requester_distance_6 = request_6["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_6.text = String(requester_distance_6!) + "m"
                    let requester_distance_7 = request_7["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_7.text = String(requester_distance_7!) + "m"
                    let requester_distance_8 = request_8["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_8.text = String(requester_distance_8!) + "m"
                    let requester_distance_9 = request_9["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_9.text = String(requester_distance_9!) + "m"
                    let requester_distance_10 = request_10["deliveryToRequesterDistance"] as? Int
                    self.requester_distance_10.text = String(requester_distance_10!) + "m"
                    
                }catch {
                    print(String(describing: error))
                }
            }
        }
        task.resume()
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // Access the coordinates
        self.mapX = location.coordinate.longitude
        self.mapY = location.coordinate.latitude
        
        // Use the location data as needed
        var url = URL(string: "http://52.78.16.203:8080/location/reversegeo?mapX=\(self.mapX)&mapY=\(self.mapY)")
        print("현위치 : \(self.mapX),\(self.mapY)")
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
                    let result = jsonObject["juso"] as? String
                    //self.DoroAdr.text = result!
                    self.DoroAdr.text = "서울시 동작구 흑석로 84"
                }catch let e as NSError{
                    print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                }
            }
            
        }
        task.resume()
        
        
        
        // Stop updating location to conserve battery
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "req_1"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_1.text!)!
        }
        else if segue.identifier == "req_2"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_2.text!)!
        }
        else if segue.identifier == "req_3"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_3.text!)!
        }
        else if segue.identifier == "req_4"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_4.text!)!
        }
        else if segue.identifier == "req_5"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_5.text!)!
        }
        else if segue.identifier == "req_6"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_6.text!)!
        }
        else if segue.identifier == "req_7"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_7.text!)!
        }
        else if segue.identifier == "req_8"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_8.text!)!
        }
        else if segue.identifier == "req_9"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_9.text!)!
        }
        else if segue.identifier == "req_10"{
            guard let vc = segue.destination as? DetailViewController else {return}
            vc.id = Int(id_10.text!)!
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
