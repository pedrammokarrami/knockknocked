//
//  selectchatViewController.swift
//  knockknocked
//
//  Created by pedram on 11/9/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class selectchatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
   
    
    
    @IBOutlet var count: UILabel!
    
    
    @IBOutlet var tableview: UITableView!
    
     var seen : [Int] = []
     var order : [String] = []
    var lastchat : [String] = []
      var timee : [String] = []
    var firstname : [String] = []
     var lastname : [String] = []
        var id : [Int] = []
    
    
    
    var idreq : [Int] = []
    
    
    func server1 () {
        
        let token = UserDefaults.standard.object(forKey: "token") as! String
            let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
          
        Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/order/me/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
             

//                print(response)

          
               if response.response?.statusCode == 200{
                   
                 let jsonData1 = JSON(response.result.value!)
                
                 let idd =  jsonData1["pendding"].arrayValue.map ({$0["owner"]["id"].intValue})
                self.idreq = idd
             
                
                
            }
        }
    }
    
    
    
    
           func server() {
    let token = UserDefaults.standard.object(forKey: "token") as! String
            let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
          
        Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/chat/message/users/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
             

//                print(response)

          
               if response.response?.statusCode == 200{
                   
                 let jsonData1 = JSON(response.result.value!)
                
                print(jsonData1)
                
                 let idd =  jsonData1["list"].arrayValue.map ({$0["user"]["id"].intValue})
                self.id = idd
                
                 
                 let name =  jsonData1["list"].arrayValue.map ({$0["user"]["first_name"].stringValue})
                
                let famil =  jsonData1["list"].arrayValue.map ({$0["user"]["last_name"].stringValue})
                let date =  jsonData1["list"].arrayValue.map ({$0["time"].stringValue})
                 let ord =  jsonData1["list"].arrayValue.map ({$0["order"].stringValue})
                let see =  jsonData1["list"].arrayValue.map ({$0["seen"].intValue})
                       let last_message =  jsonData1["list"].arrayValue.map ({$0["last_message"].stringValue})
                
                self.lastchat = last_message
                self.seen = see
                self.order = ord
                self.firstname = name
                self.lastname = famil
                self.timee = date
                self.tableview.reloadData()
                
                
                   
               }
               }
           }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        count.layer.cornerRadius = 9
        count.layer.masksToBounds = true
     tableview.rowHeight = 90.0
       tableview.delegate = self
       tableview.dataSource = self
        
           
               server()
        server1()
    }
    

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
    count.text = "\(id.count)"
       return id.count
       
       
   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell:chatcell = self.tableview.dequeueReusableCell(withIdentifier: "chatcell") as! chatcell
        
        let namess = firstname[indexPath.row]
        let familss = lastname[indexPath.row]
        
        let zaman = timee[indexPath.row]
        let chat = lastchat[indexPath.row]
        
        
        if indexPath.row == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9803829789, green: 0.8934361339, blue: 0.9531539083, alpha: 1)

           }
        
//        let ids = id[indexPath.row]
//        if id.contains(idreq) {
//
//        }
        
      
        
//              let req1 = idreq[indexPath.row]
//        print(req1)
//        if ids == req1 {
//            cell.backgroundColor = #colorLiteral(red: 0.9803829789, green: 0.8934361339, blue: 0.9531539083, alpha: 1)
//                       cell.contentView.backgroundColor = #colorLiteral(red: 0.9803829789, green: 0.8934361339, blue: 0.9531539083, alpha: 1)
//        }
//
        
      
        
        
//        let id
        
        
        
        cell.username?.text = "\(namess) \(familss)"
        cell.lasttime?.text = zaman
        cell.lastchat?.text = chat
        
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
        
         let ids = id[indexPath.row]
        UserDefaults.standard.set(ids, forKey: "idpro")
    }
   
}


class chatcell: UITableViewCell {
    override var frame: CGRect {
           get {
               return super.frame
           }
           set (newFrame) {
               var frame =  newFrame
               frame.origin.y += 4
               frame.size.height -= 2 * 4
               super.frame = frame
           }
       }
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var lasttime: UILabel!
    
    @IBOutlet var lastchat: UILabel!
    
    @IBOutlet var userimage: UIImageView!
    
    
}
