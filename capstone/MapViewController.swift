//
//  MapViewController.swift
//  capstone
//
//  Created by 최병욱 on 12/7/23.
//

import UIKit

class MapViewController:UIViewController{
    
    var now_count = 0
    var total_count = 5
    var token : String = ""
    var point : Int = 0
    
    var mapX : String = "126.966635"
    var mapY : String = "37.504660"
    
    var tempX : String = "126.9618302"
    var tempY : String = "37.4764356"
    
    
    @IBOutlet weak var TotalView: UIView!
    
    
    @IBOutlet weak var Tap_1: UIButton!
    @IBOutlet weak var Tap_2: UIButton!
    @IBOutlet weak var Tap_3: UIButton!
    @IBOutlet weak var Tap_4: UIButton!
    @IBOutlet weak var Tap_5: UIButton!
    @IBOutlet weak var Tap_6: UIButton!
    @IBOutlet weak var Tap_7: UIButton!
    @IBOutlet weak var Tap_8: UIButton!
    @IBOutlet weak var Tap_9: UIButton!
    @IBOutlet weak var Tap_10: UIButton!
    @IBOutlet weak var Tap_11: UIButton!
    @IBOutlet weak var Tap_12: UIButton!
    
    
    //var X : [String] = ["126.944541781061"]
    //var Y : [String] = ["37.5062358749024"]
    
    // "126.944541781061"
    // "37.5062358749024"
     var X : [String] = ["126.9563079853935"]
     var Y : [String] = ["37.50373187590476"]
    
    
    var ids: [Int] = [1,2]
    
    @IBOutlet weak var ExplainLabel: UILabel!
    
    @IBOutlet weak var request_1: UIView!
    @IBOutlet weak var title_1: UILabel!
    @IBOutlet weak var road_1: UILabel!
    @IBOutlet weak var name_1: UILabel!
    @IBOutlet weak var id_1: UILabel!
    
    
    @IBOutlet weak var request_2: UIView!
    @IBOutlet weak var title_2: UILabel!
    @IBOutlet weak var road_2: UILabel!
    @IBOutlet weak var name_2: UILabel!
    @IBOutlet weak var id_2: UILabel!
    
    
    @IBOutlet weak var request_3: UIView!
    @IBOutlet weak var title_3: UILabel!
    @IBOutlet weak var road_3: UILabel!
    @IBOutlet weak var name_3: UILabel!
    @IBOutlet weak var id_3: UILabel!
    
    @IBOutlet weak var request_4: UIView!
    @IBOutlet weak var title_4: UILabel!
    @IBOutlet weak var road_4: UILabel!
    @IBOutlet weak var name_4: UILabel!
    @IBOutlet weak var id_4: UILabel!
    
    @IBOutlet weak var request_5: UIView!
    @IBOutlet weak var title_5: UILabel!
    @IBOutlet weak var road_5: UILabel!
    @IBOutlet weak var name_5: UILabel!
    @IBOutlet weak var id_5: UILabel!
    
    @IBOutlet weak var request_6: UIView!
    @IBOutlet weak var title_6: UILabel!
    @IBOutlet weak var road_6: UILabel!
    @IBOutlet weak var name_6: UILabel!
    @IBOutlet weak var id_6: UILabel!
    
    @IBOutlet weak var request_7: UIView!
    @IBOutlet weak var title_7: UILabel!
    @IBOutlet weak var road_7: UILabel!
    @IBOutlet weak var name_7: UILabel!
    @IBOutlet weak var id_7: UILabel!
    
    @IBOutlet weak var request_8: UIView!
    @IBOutlet weak var title_8: UILabel!
    @IBOutlet weak var road_8: UILabel!
    @IBOutlet weak var name_8: UILabel!
    @IBOutlet weak var id_8: UILabel!
    
    @IBOutlet weak var request_9: UIView!
    @IBOutlet weak var title_9: UILabel!
    @IBOutlet weak var road_9: UILabel!
    @IBOutlet weak var name_9: UILabel!
    @IBOutlet weak var id_9: UILabel!
    
    @IBOutlet weak var request_10: UIView!
    @IBOutlet weak var title_10: UILabel!
    @IBOutlet weak var road_10: UILabel!
    @IBOutlet weak var name_10: UILabel!
    @IBOutlet weak var id_10: UILabel!
    
    @IBOutlet weak var request_11: UIView!
    @IBOutlet weak var title_11: UILabel!
    @IBOutlet weak var road_11: UILabel!
    @IBOutlet weak var name_11: UILabel!
    @IBOutlet weak var id_11: UILabel!
    
    @IBOutlet weak var request_12: UIView!
    @IBOutlet weak var title_12: UILabel!
    @IBOutlet weak var road_12: UILabel!
    @IBOutlet weak var name_12: UILabel!
    @IBOutlet weak var id_12: UILabel!
    
    
    @IBOutlet var requests: [UIView]!
    @IBOutlet var titles: [UILabel]!
    @IBOutlet var roads: [UILabel]!
    @IBOutlet var names: [UILabel]!
    @IBOutlet var idsCollections: [UILabel]!
    
    
    @IBOutlet weak var NextLabel: UILabel!
    @IBOutlet weak var MapLabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var MapButton: UIButton!
    
    
    @IBOutlet weak var FinishButton: UIButton!
    @IBOutlet weak var FinishLabel: UILabel!
    
    var new_names : [String] = []
    
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        requests[now_count].backgroundColor = UIColor.gray
        idsCollections[now_count].textColor = UIColor.gray
        now_count += 1
        if now_count == total_count{
            NextButton.isHidden = true
            MapButton.isHidden = true
            NextLabel.isHidden = true
            MapLabel.isHidden = true
            FinishButton.isHidden = false
            FinishLabel.isHidden = false
        }
        
    }
    
    
    @IBAction func MapButtonTapped(_ sender: UIButton) {
        
        if total_count - now_count == 1{
            NaverMap_1(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],dlat: Y[now_count + 1], dlng: X[now_count + 1], dname: new_names[now_count + 1])
        }
        else if total_count - now_count == 2{
            NaverMap_2(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],v1lat: Y[now_count + 1], v1lng: X[now_count + 1], v1name: new_names[now_count + 1],dlat: Y[now_count + 2], dlng: X[now_count + 2], dname: new_names[now_count + 2])
        }
        else if total_count - now_count == 3{
            NaverMap_3(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],v1lat: Y[now_count + 1], v1lng: X[now_count + 1], v1name: new_names[now_count + 1], v2lat: Y[now_count + 2], v2lng: X[now_count + 2], v2name: new_names[now_count + 2], dlat: Y[now_count + 3], dlng: X[now_count + 3], dname: new_names[now_count + 3])
        }
        else if total_count - now_count == 4{
            NaverMap_4(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],v1lat: Y[now_count + 1], v1lng: X[now_count + 1], v1name: new_names[now_count + 1], v2lat: Y[now_count + 2], v2lng: X[now_count + 2], v2name: new_names[now_count + 2], v3lat: Y[now_count + 3], v3lng: X[now_count + 3], v3name: new_names[now_count + 3], dlat: Y[now_count + 4], dlng: X[now_count + 4], dname: new_names[now_count + 4])
        }
        else if total_count - now_count == 5{
            NaverMap_5(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],v1lat: Y[now_count + 1], v1lng: X[now_count + 1], v1name: new_names[now_count + 1], v2lat: Y[now_count + 2], v2lng: X[now_count + 2], v2name: new_names[now_count + 2], v3lat: Y[now_count + 3], v3lng: X[now_count + 3], v3name: new_names[now_count + 3], v4lat: Y[now_count + 4], v4lng: X[now_count + 4], v4name: new_names[now_count + 4], dlat: Y[now_count + 5], dlng: X[now_count + 5], dname: new_names[now_count + 5])
        }
        else if total_count - now_count > 5{
            NaverMap_6(slat: Y[now_count], slng: X[now_count], sname: new_names[now_count],v1lat: Y[now_count + 1], v1lng: X[now_count + 1], v1name: new_names[now_count + 1], v2lat: Y[now_count + 2], v2lng: X[now_count + 2], v2name: new_names[now_count + 2], v3lat: Y[now_count + 3], v3lng: X[now_count + 3], v3name: new_names[now_count + 3], v4lat: Y[now_count + 4], v4lng: X[now_count + 4], v4name: new_names[now_count + 4], v5lat: Y[now_count + 5], v5lng: X[now_count + 5], v5name: new_names[now_count + 5], dlat: Y[now_count + 6], dlng: X[now_count + 6], dname: new_names[now_count + 6])
        }
        
    }
    
    private func finish(id:String){
        let url = URL(string: "http://52.78.16.203:8080/delivery/complete/request?postId=\(id)")
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
                    print("배달 완료신청 (complete/request) 결과: \(result)")
                }catch {
                    print(String(describing: error))
                }
            }
            
        }
        task.resume()
    }
    
    
    
    
    
    @IBAction func FinishButtonTapped(_ sender: UIButton) {
        print(ids.count)
        if ids.count > 0 {
            finish(id: id_1.text!)
        }
        if ids.count > 1 {
            finish(id: id_2.text!)
        }
        if ids.count > 2 {
            finish(id: id_3.text!)
        }
        if ids.count > 3 {
            finish(id: id_4.text!)
        }
        if ids.count > 4 {
            finish(id: id_5.text!)
        }
        if ids.count > 5 {
            finish(id: id_6.text!)
        }
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextLabel.text = "다음\n행선지"
        MapLabel.text = "지도로\n보여주세요"
        ExplainLabel.setLineSpacing(spacing: 15.0)
        NextLabel.setLineSpacing(spacing: 5.0)
        MapLabel.setLineSpacing(spacing: 5.0)
        ExplainLabel.textAlignment = .center
        NextLabel.textAlignment = .center
        MapLabel.textAlignment = .center
        
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
        request_11.layer.cornerRadius = 15
        request_12.layer.cornerRadius = 15
        
        request_1.isHidden = true
        request_2.isHidden = true
        request_3.isHidden = true
        request_4.isHidden = true
        request_5.isHidden = true
        request_6.isHidden = true
        request_7.isHidden = true
        request_8.isHidden = true
        request_9.isHidden = true
        request_10.isHidden = true
        request_11.isHidden = true
        request_12.isHidden = true
        
        
        NextButton.layer.cornerRadius = 15
        MapButton.layer.cornerRadius = 15
        FinishButton.layer.cornerRadius = 15

        total_count = 2 * ids.count
        
        
        print(ids)
        
        let location = ["mapX" : mapX, "mapY" : mapY]
        
        let param = ["myLocation" : location, "postIdList" : ids] as? [String : Any]
        
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "http://52.78.16.203:8080/delivery/sort")
        
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
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? NSArray
                    
                    if self.ids.count > 0{
                        if self.ids.count == 1{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 0).isActive = true
                        }
                        
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        
                        let request_1 = json?.object(at: 0) as! NSDictionary
                        let request_2 = json?.object(at: 1) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[0].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[0].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[0].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[0].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[0].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[1].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[1].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[1].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[1].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[1].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    if self.ids.count > 1{
                        if self.ids.count == 2{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 1).isActive = true
                            
                        }
                        
                        self.request_3.isHidden = false
                        self.request_4.isHidden = false
                        
                        let request_1 = json?.object(at: 2) as! NSDictionary
                        let request_2 = json?.object(at: 3) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[2].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[2].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[2].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[2].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[2].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[3].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[3].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[3].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[3].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[3].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    if self.ids.count > 2{
                        if self.ids.count == 3{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 2).isActive = true
                            
                        }
                        self.request_5.isHidden = false
                        self.request_6.isHidden = false
                        
                        let request_1 = json?.object(at: 4) as! NSDictionary
                        let request_2 = json?.object(at: 5) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[4].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[4].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[4].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[4].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[4].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[5].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[5].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[5].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[5].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[5].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    if self.ids.count > 3{
                        if self.ids.count == 4{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 3).isActive = true
                            
                        }
                        self.request_7.isHidden = false
                        self.request_8.isHidden = false
                        
                        let request_1 = json?.object(at: 6) as! NSDictionary
                        let request_2 = json?.object(at: 7) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[6].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[6].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[6].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[6].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[6].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[7].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[7].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[7].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[7].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[7].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    if self.ids.count > 4{
                        if self.ids.count == 5{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 4).isActive = true
                            
                        }
                        self.request_9.isHidden = false
                        self.request_10.isHidden = false
                        
                        let request_1 = json?.object(at: 8) as! NSDictionary
                        let request_2 = json?.object(at: 9) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[8].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[8].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[8].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[8].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[8].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[9].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[9].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[9].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[9].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[9].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    if self.ids.count > 5{
                        if self.ids.count == 6{
                            NSLayoutConstraint.init(item: self.TotalView!,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .height,
                                                            multiplier: 1.0,
                                                            constant: 300 + 280 * 5).isActive = true
                            
                        }
                        self.request_11.isHidden = false
                        self.request_12.isHidden = false
                        
                        let request_1 = json?.object(at: 10) as! NSDictionary
                        let request_2 = json?.object(at: 11) as! NSDictionary
                        
                        let result_1 = request_1["title"] as? String
                        self.titles[10].text = result_1
                        let result_2 = request_1["roadName"] as? String
                        self.roads[10].text = result_2
                        let type = request_1["type"] as? Int
                        if type == 1{
                            let result_3 = request_1["addr"] as? String
                            self.names[10].text = result_3
                        }
                        else{
                            let result_3 = request_1["marketName"] as? String
                            self.names[10].text = result_3
                        }
                        let result_4 = request_1["id"] as? Int
                        self.idsCollections[10].text = String(result_4!)
                        let result_5 = request_1["mapX"] as? String
                        self.X.append(result_5!)
                        let result_6 = request_1["mapY"] as? String
                        self.Y.append(result_6!)
                        
                        
                        let result_7 = request_2["title"] as? String
                        self.titles[11].text = result_7
                        let result_8 = request_2["roadName"] as? String
                        self.roads[11].text = result_8
                        let type_2 = request_2["type"] as? Int
                        if type_2 == 1{
                            let result_9 = request_2["addr"] as? String
                            self.names[11].text = result_9
                        }
                        else{
                            let result_9 = request_2["marketName"] as? String
                            self.names[11].text = result_9
                        }
                        let result_10 = request_2["id"] as? Int
                        self.idsCollections[11].text = String(result_10!)
                        let result_11 = request_2["mapX"] as? String
                        self.X.append(result_11!)
                        let result_12 = request_2["mapY"] as? String
                        self.Y.append(result_12!)
                        
                        
                    }
                    
                    
                    
                    
                    
                }catch {
                    print(String(describing: error))
                }
            }
        }
        task.resume()
        new_names.append("출발지")
        for i in 0..<names.count{
            new_names.append(names[i].text!)
        }
        
        
        
    }
    
    
    func NaverMap_1(slat: String, slng: String, sname: String ,dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlat=\(dlat)&dlng=\(dlng)&dname=\(dname)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    func NaverMap_2(slat: String, slng: String, sname: String ,v1lat: String, v1lng: String, v1name: String,dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlng=\(dlng)&dlat=\(dlat)&dname=\(dname)&v1lng=\(v1lng)&v1lat=\(v1lat)&v1name=\(v1name)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    func NaverMap_3(slat: String, slng: String, sname: String ,v1lat: String, v1lng: String, v1name: String,v2lat: String, v2lng: String, v2name: String,dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlng=\(dlng)&dlat=\(dlat)&dname=\(dname)&v1lng=\(v1lng)&v1lat=\(v1lat)&v1name=\(v1name)&v2lng=\(v2lng)&v2lat=\(v2lat)&v2name=\(v2name)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    func NaverMap_4(slat: String, slng: String, sname: String ,v1lat: String, v1lng: String, v1name: String,v2lat: String, v2lng: String, v2name: String, v3lat: String, v3lng: String, v3name: String, dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlng=\(dlng)&dlat=\(dlat)&dname=\(dname)&v1lng=\(v1lng)&v1lat=\(v1lat)&v1name=\(v1name)&v2lng=\(v2lng)&v2lat=\(v2lat)&v2name=\(v2name)&v3lng=\(v3lng)&v3lat=\(v3lat)&v3name=\(v3name)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    func NaverMap_5(slat: String, slng: String, sname: String ,v1lat: String, v1lng: String, v1name: String,v2lat: String, v2lng: String, v2name: String, v3lat: String, v3lng: String, v3name: String, v4lat: String, v4lng: String, v4name: String, dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlng=\(dlng)&dlat=\(dlat)&dname=\(dname)&v1lng=\(v1lng)&v1lat=\(v1lat)&v1name=\(v1name)&v2lng=\(v2lng)&v2lat=\(v2lat)&v2name=\(v2name)&v3lng=\(v3lng)&v3lat=\(v3lat)&v3name=\(v3name)&v4lng=\(v4lng)&v4lat=\(v4lat)&v4name=\(v4name)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    func NaverMap_6(slat: String, slng: String, sname: String ,v1lat: String, v1lng: String, v1name: String,v2lat: String, v2lng: String, v2name: String, v3lat: String, v3lng: String, v3name: String, v4lat: String, v4lng: String, v4name: String, v5lat: String, v5lng: String, v5name: String, dlat: String, dlng: String, dname: String) {
        guard let url = URL(string: "nmap://route/walk?slat=\(slat)&slng=\(slng)&sname=\(sname)&dlng=\(dlng)&dlat=\(dlat)&dname=\(dname)&v1lng=\(v1lng)&v1lat=\(v1lat)&v1name=\(v1name)&v2lng=\(v2lng)&v2lat=\(v2lat)&v2name=\(v2name)&v3lng=\(v3lng)&v3lat=\(v3lat)&v3name=\(v3name)&v4lng=\(v4lng)&v4lat=\(v4lat)&v4name=\(v4name)&v5lng=\(v5lng)&v5lat=\(v5lat)&v5name=\(v5name)&appname=com.capstone.shopperman") else { return }
            UIApplication.shared.open(url)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "final"{
            guard let vc = segue.destination as? FinalViewController else {return}
            vc.modalPresentationStyle = .fullScreen
            vc.point = point
        }
        else if segue.identifier == "req_1"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_1.text!)!
        }
        else if segue.identifier == "req_2"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_2.text!)!
        }
        else if segue.identifier == "req_3"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_3.text!)!
        }
        else if segue.identifier == "req_4"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_4.text!)!
        }
        else if segue.identifier == "req_5"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_5.text!)!
        }
        else if segue.identifier == "req_6"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_6.text!)!
        }
        else if segue.identifier == "req_7"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_7.text!)!
        }
        else if segue.identifier == "req_8"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_8.text!)!
        }
        else if segue.identifier == "req_9"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_9.text!)!
        }
        else if segue.identifier == "req_10"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_10.text!)!
        }
        else if segue.identifier == "req_11"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_11.text!)!
        }
        else if segue.identifier == "req_12"{
            guard let vc = segue.destination as? MapDetail else {return}
            vc.id = Int(id_12.text!)!
        }
        
    }
    
}
