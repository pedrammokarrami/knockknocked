//
//  loginViewController.swift
//  knockknocked
//
//  Created by pedram on 11/10/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Firebase


class loginViewController: UIViewController, UITextFieldDelegate {
    
    
      var selectedCountry: Country!
  
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
    
    
    
    @objc func showCountryViewScreen() {
      self.performSegue(withIdentifier: "countryScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "countryScreen" {
        if let control = segue.destination as? UINavigationController {
          if let contrl = control.topViewController as? SRCountryPickerController {
            contrl.countryDelegate = self
          }
        }
      }
    }

    
    
    @IBOutlet var phonenumber: UITextField!
    

    @IBAction func reg(_ sender: Any) {
        self.view.endEditing(true)
       if phonenumber.text?.isEmpty ?? true {
                                let animation = CABasicAnimation(keyPath: "position")
                                animation.duration = 0.07
                                animation.repeatCount = 4
                                animation.autoreverses = true
                                animation.fromValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x - 10, y: phonenumber.center.y))
                                animation.toValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x + 10, y: phonenumber.center.y))
                                
                                phonenumber.layer.add(animation, forKey: "position")
                            }
       else{
            server()
        }

      
    }
    
    
    @IBAction func reg1(_ sender: Any) {
        self.view.endEditing(true)
          if phonenumber.text?.isEmpty ?? true {
                                   let animation = CABasicAnimation(keyPath: "position")
                                   animation.duration = 0.07
                                   animation.repeatCount = 4
                                   animation.autoreverses = true
                                   animation.fromValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x - 10, y: phonenumber.center.y))
                                   animation.toValue = NSValue(cgPoint: CGPoint(x: phonenumber.center.x + 10, y: phonenumber.center.y))
                                   
                                   phonenumber.layer.add(animation, forKey: "position")
                               }
          else{
               server1()
           }

         
       }
    
    
  
    
    var hud = LottieHUD("loading")
    func server() {
hud.showHUD()
        let aString = phonenumber.text
        let newString = aString!.replacingOccurrences(of: "+", with: "00", options: .literal, range: nil)
        let header:HTTPHeaders = ["accept":"application/json"]
          let paramer:Parameters = ["cellphone":phonenumber.text!]
        Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/resend_verification_code/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
      
        print(response)
        
          print(response.response?.statusCode)

          self.hud.stopHUD()
        
          if response.response?.statusCode == 200{
              
           
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
     var fcm1 = ""
    
    func server1() {
        hud.showHUD()
 let uuid = UUID().uuidString
        
        
        let aString = phonenumber.text
              let newString = aString!.replacingOccurrences(of: "+", with: "00", options: .literal, range: nil)
           
          
           let header:HTTPHeaders = ["accept":"application/json"]
             let paramer:Parameters = ["cellphone":phonenumber.text!,"device_id":uuid,"registration_id":fcm1,"type":"ios"]
        
        
           Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/register/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
         
            self.hud.stopHUD()
            
            print(paramer)
           
             print(response.response?.statusCode)
print(response)
            
            if response.response?.statusCode == 400 {
                let alertController = UIAlertController(title: "Warning...", message:"This phone number already exist" , preferredStyle:UIAlertController.Style.alert)
                                              
                                              
                                              let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                                  
                                                  
                                                  
                                                  
                                                  print("you have pressed OK button");
                                              }
                                           alertController.addAction(OKAction)
                                           
                                           self.present(alertController, animated: true, completion:{ () -> Void in
                                           })
            }
            
           
             if response.response?.statusCode == 201{
                 
              
                 UserDefaults.standard.set(self.phonenumber.text, forKey: "mobile")
                 let veryfiregisterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "veryfiregisterViewController") as! veryfiregisterViewController
                 self.navigationController?.pushViewController(veryfiregisterViewController, animated: true)
               
               
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
    
    
    @IBAction func selecttt(_ sender: Any) {
        showCountryViewScreen()
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        InstanceID.instanceID().instanceID { (result, error) in
                      if let error = error {
                        print("Error fetching remote instance ID: \(error)")
                      } else if let result = result {
                        print("Remote instance ID token: \(result.token)")
                        self.fcm1 = "\(result.token)"
                        
                         
                      }
                    }

        phonenumber.delegate = self
         UserDefaults.standard.set("All services", forKey: "category")
    }
    
    @objc func methodOfReceivedNotificationlog(notification: Notification) {
        
        phonenumber.becomeFirstResponder()
       
             
         }
    
    override func viewWillAppear(_ animated: Bool) {
                  super.viewWillAppear(true)
          NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotificationlog(notification:)), name: Notification.Name("NotificationIdentifierlogin"), object: nil)

      }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


extension loginViewController: CountrySelectedDelegate {
  
  func SRcountrySelected(countrySelected country: Country) {
    self.selectedCountry = country
    print("country selected  code \(self.selectedCountry.country_code), country name \(self.selectedCountry.country_name), dial code \(self.selectedCountry.dial_code)")
    
    phonenumber.text = "\(self.selectedCountry.dial_code)"
 
  }
  
}
