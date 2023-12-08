//
//  CheckDelieverViewController.swift
//  capstone
//
//  Created by 최병욱 on 12/2/23.
//

import UIKit


class CheckDelieverViewController:UIViewController{
    
    var ids: [Int] = []
    
    var token : String = ""
    
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
    
    
    
    override func viewDidLoad() {
        
        request_1.layer.cornerRadius = 15
        request_2.layer.cornerRadius = 15
        request_3.layer.cornerRadius = 15
        request_4.layer.cornerRadius = 15
        request_5.layer.cornerRadius = 15
        request_6.layer.cornerRadius = 15
        
        
        
        
        loadPage()
        
        
        
    }
    
    private func loadPage(){
        
        let url = URL(string: "http://52.78.16.203:8080/post/get/list/delivery")
        
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
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? NSArray
                    
                    print(json?.count)
                    
                    if json!.count > 0{
                        let request_1 = json?.object(at: 0) as! NSDictionary
                        let title_1 = request_1["title"] as? String
                        self.title_1.text = title_1
                        let id_1 = request_1["id"] as? Int
                        self.ids.append(id_1!)
                        self.id_1.text = String(id_1!)
                        let item_1 = request_1["item"] as? String
                        self.item_1.text = item_1
                        let tip_1 = request_1["deliveryTip"] as? Int
                        self.tip_1.text = String(tip_1!) + "원"
                    }
                    if json!.count > 1{
                        let request_2 = json?.object(at: 1) as! NSDictionary
                        let title_2 = request_2["title"] as? String
                        self.title_2.text = title_2
                        let id_2 = request_2["id"] as? Int
                        self.ids.append(id_2!)
                        self.id_2.text = String(id_2!)
                        let item_2 = request_2["item"] as? String
                        self.item_2.text = item_2
                        let tip_2 = request_2["deliveryTip"] as? Int
                        self.tip_2.text = String(tip_2!) + "원"
                    }
                    if json!.count > 2{
                        let request_3 = json?.object(at: 2) as! NSDictionary
                        let title_3 = request_3["title"] as? String
                        self.title_3.text = title_3
                        let id_3 = request_3["id"] as? Int
                        self.ids.append(id_3!)
                        self.id_3.text = String(id_3!)
                        let item_3 = request_3["item"] as? String
                        self.item_3.text = item_3
                        let tip_3 = request_3["deliveryTip"] as? Int
                        self.tip_3.text = String(tip_3!) + "원"
                    }
                    
                    if json!.count > 3{
                        let request_4 = json?.object(at: 3) as! NSDictionary
                        let title_4 = request_4["title"] as? String
                        self.title_4.text = title_4
                        let id_4 = request_4["id"] as? Int
                        self.ids.append(id_4!)
                        self.id_4.text = String(id_4!)
                        let item_4 = request_4["item"] as? String
                        self.item_4.text = item_4
                        let tip_4 = request_4["deliveryTip"] as? Int
                        self.tip_4.text = String(tip_4!) + "원"
                    }
                        
                    if json!.count > 4{
                        let request_5 = json?.object(at: 4) as! NSDictionary
                        let title_5 = request_5["title"] as? String
                        self.title_5.text = title_5
                        let id_5 = request_5["id"] as? Int
                        self.ids.append(id_5!)
                        self.id_5.text = String(id_5!)
                        let item_5 = request_5["item"] as? String
                        self.item_5.text = item_5
                        let tip_5 = request_5["deliveryTip"] as? Int
                        self.tip_5.text = String(tip_5!) + "원"
                    }
                    if json!.count > 5{
                        let request_6 = json?.object(at: 5) as! NSDictionary
                        let title_6 = request_6["title"] as? String
                        self.title_6.text = title_6
                        let id_6 = request_6["id"] as? Int
                        self.ids.append(id_6!)
                        self.id_6.text = String(id_6!)
                        let item_6 = request_6["item"] as? String
                        self.item_6.text = item_6
                        let tip_6 = request_6["deliveryTip"] as? Int
                        self.tip_6.text = String(tip_6!) + "원"
                    }
                    
                    if self.ids.count == 0{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 6).isActive = true
                        self.request_1.isHidden = true
                        self.request_2.isHidden = true
                        self.request_3.isHidden = true
                        self.request_4.isHidden = true
                        self.request_5.isHidden = true
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 1{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 5).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = true
                        self.request_3.isHidden = true
                        self.request_4.isHidden = true
                        self.request_5.isHidden = true
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 2{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 4).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        self.request_3.isHidden = true
                        self.request_4.isHidden = true
                        self.request_5.isHidden = true
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 3{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 3).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        self.request_3.isHidden = false
                        self.request_4.isHidden = true
                        self.request_5.isHidden = true
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 4{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 2).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        self.request_3.isHidden = false
                        self.request_4.isHidden = false
                        self.request_5.isHidden = true
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 5{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750 - 100 * 1).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        self.request_3.isHidden = false
                        self.request_4.isHidden = false
                        self.request_5.isHidden = false
                        self.request_6.isHidden = true
                    }
                    else if self.ids.count == 6{
                        NSLayoutConstraint.init(item: self.TotalView!,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1.0,
                                                        constant: 750).isActive = true
                        self.request_1.isHidden = false
                        self.request_2.isHidden = false
                        self.request_3.isHidden = false
                        self.request_4.isHidden = false
                        self.request_5.isHidden = false
                        self.request_6.isHidden = false
                    }
                }catch {
                    print(String(describing: error))
                } // end of do, catch
                
            } // end of DispatchQueue
            
        } // end of task
        task.resume()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "req_1"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_1.text!)!
        }
        else if segue.identifier == "req_2"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_2.text!)!
        }
        else if segue.identifier == "req_3"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_3.text!)!
        }
        else if segue.identifier == "req_4"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_4.text!)!
        }
        else if segue.identifier == "req_5"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_5.text!)!
        }
        else if segue.identifier == "req_6"{
            guard let vc = segue.destination as? MyDelieverDetail else {return}
            vc.id = Int(id_6.text!)!
        }
    }
    
}
