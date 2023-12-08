//
//  MyDelieverDetail.swift
//  capstone
//
//  Created by 최병욱 on 12/3/23.
//

import UIKit
import CoreLocation

class MyDelieverDetail:UIViewController,CLLocationManagerDelegate{
    
    
    var id:Int = 1
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ItemLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    
    // 가게 정보
    @IBOutlet weak var MarketDistanceLabel: UILabel!
    @IBOutlet weak var MarketNameLabel: UILabel!
    @IBOutlet weak var MarketDoroLabel: UILabel!
    
    // 배달 요청자 정보
    @IBOutlet weak var RequesterDistanceLabel: UILabel!
    @IBOutlet weak var RequesterDoroLabel: UILabel!
    @IBOutlet weak var RequesterDetailLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    var deliever_X : Double = 0.0
    var deliever_Y : Double = 0.0
    var market_X : Double = 0.0
    var market_Y : Double = 0.0
    var requester_X : Double = 0.0
    var requester_Y : Double = 0.0
    
    
    @IBOutlet weak var boxbox: UIView!
    
    
    override func viewDidLoad() {
        //definesPresentationContext = true
        super.viewDidLoad()
        
        boxbox.layer.cornerRadius = 15
        
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
        
        
        
    } // end of viewDidLoad
    
 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // Access the coordinates
        self.deliever_X = location.coordinate.longitude
        self.deliever_Y = location.coordinate.latitude
        
        
        
        let param = ["mapX" : String(self.deliever_X), "mapY" : String(self.deliever_Y)]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/post/get?id=\(id)")
        
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
                    self.TitleLabel.text = result_1!
                    let result_2 = jsonObject["publisherNickname"] as? String
                    self.NameLabel.text = result_2!
                    let result_3 = jsonObject["item"] as? String
                    self.ItemLabel.text = result_3!
                    let result_4 = jsonObject["price"] as? Int
                    self.PriceLabel.text = String(result_4!) + "원"
                    let result_5 = jsonObject["deliveryTip"] as? Int
                    self.TipLabel.text = String(result_5!) + "원"
                    let result_6 = jsonObject["content"] as? String
                    self.DetailLabel.text = result_6!
                    
                    // 거리계산
                    let result_7 = jsonObject["deliveryToRequesterDistance"] as? Int
                    self.RequesterDistanceLabel.text = String(result_7!) + "m"
                    let result_8 = jsonObject["deliveryToMarketDistance"] as? Int
                    self.MarketDistanceLabel.text = String(result_8!) + "m"
                    
                    
                    guard let requester = jsonObject["requesterLocation"] as? NSDictionary else {return}
                    let request_1 = requester["mapX"] as? String
                    self.requester_X = Double(request_1!)!
                    let request_2 = requester["mapY"] as? String
                    self.requester_Y = Double(request_2!)!
                    let request_3 = requester["roadName"] as? String
                    self.RequesterDoroLabel.text = request_3!
                    let request_4 = requester["addr"] as? String
                    self.RequesterDetailLabel.text = request_4!
                    
                    
                    
                    guard let market = jsonObject["marketLocation"] as? NSDictionary else {return}
                    let market_1 = market["mapX"] as? String
                    self.market_X = Double(market_1!)!
                    let market_2 = market["mapY"] as? String
                    self.market_Y = Double(market_2!)!
                    let market_3 = market["marketName"] as? String
                    self.MarketNameLabel.text = market_3!
                    let market_4 = market["roadName"] as? String
                    self.MarketDoroLabel.text = market_4!
                    
                    
                    print(self.requester_X)
                    print(self.requester_Y)
                    
                    print(self.market_X)
                    print(self.market_Y)
                    
                }catch {
                    print(String(describing: error))
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
    
    
    
    
    
    
    
}
