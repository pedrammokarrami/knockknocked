//
//  registerViewController.swift
//  knockknocked
//
//  Created by pedram on 11/7/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class registerViewController: UIViewController, UITextFieldDelegate {
    
    
  
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
    
   
    
  
    

    
    
   
    
    @IBOutlet var firstname: UITextField!
    
    @IBOutlet var lastname: UITextField!
    
 
    @IBOutlet var phonenumber: UITextField!
    
    
    
    
    
    @IBAction func reg(_ sender: Any) {
         self.view.endEditing(true)
       
       
       if firstname.text?.isEmpty ?? true {
                                let animation = CABasicAnimation(keyPath: "position")
                                animation.duration = 0.07
                                animation.repeatCount = 4
                                animation.autoreverses = true
                                animation.fromValue = NSValue(cgPoint: CGPoint(x: firstname.center.x - 10, y: firstname.center.y))
                                animation.toValue = NSValue(cgPoint: CGPoint(x: firstname.center.x + 10, y: firstname.center.y))
                                
                                firstname.layer.add(animation, forKey: "position")
                            }
        if lastname.text?.isEmpty ?? true {
                                       let animation = CABasicAnimation(keyPath: "position")
                                       animation.duration = 0.07
                                       animation.repeatCount = 4
                                       animation.autoreverses = true
                                       animation.fromValue = NSValue(cgPoint: CGPoint(x: lastname.center.x - 10, y: lastname.center.y))
                                       animation.toValue = NSValue(cgPoint: CGPoint(x: lastname.center.x + 10, y: lastname.center.y))
                                       
                                       lastname.layer.add(animation, forKey: "position")
                                   }
        if phonenumber.text?.isEmpty ?? true {
                                             let animation = CABasicAnimation(keyPath: "position")
                                             animation.duration = 0.07
                                             animation.repeatCount = 4
                                             animation.autoreverses = true
                                             animation.fromValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x - 10, y: phonenumber.center.y))
                                             animation.toValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x + 10, y: phonenumber.center.y))
                                             
                                             phonenumber.layer.add(animation, forKey: "position")
        }else{
            server()
        }

      
    }
    
    
    func server() {

      let header:HTTPHeaders = ["accept":"application/json"]
        let paramer:Parameters = ["cellphone":phonenumber.text!, "first_name":firstname.text! , "last_name":lastname.text!]
      Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/register/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
    
      
      
 

       
        if response.response?.statusCode == 400{
            UserDefaults.standard.set(self.phonenumber.text, forKey: "mobile")
                      let verifyViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "verifyViewController") as! verifyViewController
                      self.navigationController?.pushViewController(verifyViewController, animated: true)
        }
        if response.response?.statusCode == 201{
            
         
            UserDefaults.standard.set(self.phonenumber.text, forKey: "mobile")
            let verifyViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "verifyViewController") as! verifyViewController
            self.navigationController?.pushViewController(verifyViewController, animated: true)
          
          
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
      
        firstname.delegate = self
        lastname.delegate = self
        phonenumber.delegate = self

        UserDefaults.standard.set("All services", forKey: "category")
    }
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(true)
         firstname.delegate = self
               lastname.delegate = self
               phonenumber.delegate = self

    }
    

 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     self.view.endEditing(true)
 }

}

