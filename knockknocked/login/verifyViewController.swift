//
//  verifyViewController.swift
//  knockknocked
//
//  Created by pedram on 11/10/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CountdownLabel


class verifyViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var transfer: UIButton!
    
    @IBAction func back(_ sender: Any) {
self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet var timerr: CountdownLabel!
    
    @IBOutlet var timelable: UILabel!
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
                
            })
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
           UIView.animate(withDuration: 0.3, animations: {
               self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 200, width:self.view.frame.size.width, height:self.view.frame.size.height);
               
           })
       }
        
     
    
    @IBOutlet var code: UITextField!
    var hud = LottieHUD("loading")
    func server() {
        
        hud.showHUD()
        let mobile = UserDefaults.standard.object(forKey: "mobile") as! String

        let header:HTTPHeaders = ["accept":"application/json"]
          let paramer:Parameters = ["cellphone":mobile, "verification_code":code.text! ]
        Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/login/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
      
       
            self.hud.stopHUD()
            
            
          
         
          
          if response.response?.statusCode == 200{
              
         
           
            self.transfer.sendActions(for: .touchUpInside)
            
            
               let jsonObject = JSON(response.result.value!)
              print(jsonObject)
            
             let token = jsonObject["token"].stringValue
            UserDefaults.standard.set(token, forKey: "token")
            
            
             let first_name = jsonObject["user"]["first_name"].stringValue
            UserDefaults.standard.set(first_name, forKey: "first_name")
            
            let last_name = jsonObject["user"]["last_name"].stringValue
                      UserDefaults.standard.set(last_name, forKey: "last_name")
 
            
            let id = jsonObject["user"]["id"].intValue
                                 UserDefaults.standard.set(id, forKey: "userid")
            
            
              
               let tokennameValu = jsonObject["non_field_errors"].stringValue
              if tokennameValu == "" {
                  
              }else{
                 
                          let alertController = UIAlertController(title: "Warning...", message: tokennameValu, preferredStyle:UIAlertController.Style.alert)
                                     
                                     
                                     let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                         
                                         
                                         
                                         
                                         print("you have pressed OK button");
                                     }
                                  alertController.addAction(OKAction)
                                  
                                  self.present(alertController, animated: true, completion:{ () -> Void in
                                  })
              }
              
          }else{
              let jsonObject = JSON(response.result.value!)
                         print(jsonObject)
                         
                          let tokennameValu = jsonObject["non_field_errors"].string
                         if tokennameValu == "" {
                             
                         }else{
                          let alertController = UIAlertController(title: "Warning...", message: tokennameValu, preferredStyle:UIAlertController.Style.alert)
                                                   
                                                   
                                                   let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                                       
                                                       
                                                       
                                                       
                                                       print("you have pressed OK button");
                                                   }
                                                alertController.addAction(OKAction)
                                                
                                                self.present(alertController, animated: true, completion:{ () -> Void in
                                                })
                          
              }
          }
          }
      }
    
    
    @IBAction func reg(_ sender: Any) {
        if code.text?.isEmpty ?? true {
                                                   let animation = CABasicAnimation(keyPath: "position")
                                                   animation.duration = 0.07
                                                   animation.repeatCount = 4
                                                   animation.autoreverses = true
                                                   animation.fromValue = NSValue(cgPoint: CGPoint(x: code.center.x - 10, y: code .center.y))
                                                   animation.toValue = NSValue(cgPoint: CGPoint(x: code.center.x + 10, y: code.center.y))
                                                   
                                                   code.layer.add(animation, forKey: "position")
              }else{
                  server()
              }
        
       
    }
    
    @IBOutlet var resent: UIButton!
    
    @IBAction func resent(_ sender: Any) {
        resent.isHidden = true
        timerr.isHidden = false
        timelable.isHidden = false
        server1()
        resent.alpha = 0.5
        resent.isUserInteractionEnabled = false
        timerr.start()
        delayy()
        timerr.setCountDownTime(minutes: 120)
         timerr.start()
                
    }
    
    func server1() {
 let mobile = UserDefaults.standard.object(forKey: "mobile") as! String
        let header:HTTPHeaders = ["accept":"application/json"]
          let paramer:Parameters = ["cellphone":mobile]
        Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/resend_verification_code/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
      
        
        


         
        
          if response.response?.statusCode == 200{
              
           
             
            
               let jsonObject = JSON(response.result.value!)
              print(jsonObject)
              
               let tokennameValu = jsonObject["non_field_errors"].stringValue
              if tokennameValu == "" {
                  
              }else{
                 
                          let alertController = UIAlertController(title: "Warning...", message: tokennameValu, preferredStyle:UIAlertController.Style.alert)
                                     
                                     
                                     let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                         
                                         
                                         
                                         
                                         print("you have pressed OK button");
                                     }
                                  alertController.addAction(OKAction)
                                  
                                  self.present(alertController, animated: true, completion:{ () -> Void in
                                  })
              }
              
          }
          }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerr.setCountDownTime(minutes: 120)
         timerr.start()
        timerr.animationType = .Scale
        code.delegate = self
        resent.alpha = 0.5
        resent.isUserInteractionEnabled = false
        timerr.textColor = .black
        timerr.backgroundColor = .clear
        timerr.textAlignment = .right
        timerr.timeFormat = "mm:ss"
        
        
        delayy()
        resent.isHidden = true
         
        
    }
    
    
    func delayy (){
        DispatchQueue.main.asyncAfter(deadline: .now() + 119) {
            self.resent.isHidden = false
            self.timelable.isHidden = true
            self.timerr.isHidden = true
                   self.resent.alpha = 1
                   self.resent.isUserInteractionEnabled = true
               }
    }

  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
