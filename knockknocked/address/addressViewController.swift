//
//  addressViewController.swift
//  knockknocked
//
//  Created by pedram on 10/24/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class addressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        @IBOutlet weak var tableview: UITableView!
    
    
    
    @IBAction func closeaddress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var addressdata : [String] = []
    var id : [Int] = []
    var latitude1 : [Double] = []
    var longitude1 : [Double] = []
       func server() {
let token = UserDefaults.standard.object(forKey: "token") as! String
        let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
      
         Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user/me/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
       
         

            

      
           if response.response?.statusCode == 200{
             let jsonData1 = JSON(response.result.value!)
            
            print(jsonData1)
            
             let idd =  jsonData1["favorites"].arrayValue.map ({$0["id"].intValue})
            self.id = idd
             
             let name =  jsonData1["favorites"].arrayValue.map ({$0["name"].stringValue})
            self.addressdata = name
            
            
            let latitude =  jsonData1["favorites"].arrayValue.map ({$0["latitude"].doubleValue})
                      self.latitude1 = latitude
            
            let longitude =  jsonData1["favorites"].arrayValue.map ({$0["longitude"].doubleValue})
                      self.longitude1 = longitude
            self.tableview.reloadData()
            
            
               
           }
           }
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    
        server()
       
      
    }
    
    var iddelet = 0
    
      func server1() {
        
       
        
    let token = UserDefaults.standard.object(forKey: "token") as! String
            let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
            let paramer:Parameters = ["id":iddelet]
        let ur = "https://api.knockknocked.com/telemarket/api/v0/user_favorite/\(iddelet)/"
            Alamofire.request(ur, method: .delete, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
   
                print(response.response?.statusCode)

          print(response)
               if response.response?.statusCode == 200{
                   
                 let jsonData1 = JSON(response.result.value!)
                print(jsonData1)
                
                 let idd =  jsonData1["favorites"].arrayValue.map ({$0["id"].intValue})
                self.id = idd
                 
                 let name =  jsonData1["favorites"].arrayValue.map ({$0["name"].stringValue})
                self.addressdata = name
                self.tableview.reloadData()
                
                
                   
               }
               }
           }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        
           return addressdata.count
           
           
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell:addresscell = self.tableview.dequeueReusableCell(withIdentifier: "addresscell") as! addresscell
        
        cell.addresslble?.text = addressdata[indexPath.row]
        
       cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
       UIView.animate(withDuration: 0.3, animations: {
           cell.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1)
       },completion: { finished in
           UIView.animate(withDuration: 0.1, animations: {
               cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
           })
       })
         return cell
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let dic1 = latitude1[indexPath.row]
        let dict2 = longitude1[indexPath.row]
         UserDefaults.standard.set(dic1, forKey: "camlat")
         UserDefaults.standard.set(dict2, forKey: "camlong")
      
NotificationCenter.default.post(name: Notification.Name("NotificationIdentifiermap"), object: nil)
         self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        self.addressdata.removeAll()
        self.id.removeAll()
        self.server1()
//        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  
    }
}




class addresscell : UITableViewCell {
    
    @IBOutlet var delet: UIButton!
    @IBOutlet var addresslble: UILabel!
}
