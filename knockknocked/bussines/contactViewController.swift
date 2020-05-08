//
//  contactViewController.swift
//  knockknocked
//
//  Created by pedram on 11/8/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import ContactsUI
import Alamofire
import SwiftyJSON

class contactViewController: UIViewController, CNContactPickerDelegate, UITextFieldDelegate {
    
    var btn = 0
    
    
    
    
    
    @IBOutlet var contact1: UIButton!
    
     func onClickPickContact(){


            let contactPicker = CNContactPickerViewController()
            contactPicker.delegate = self
            contactPicker.displayedPropertyKeys =
                [CNContactGivenNameKey
                    , CNContactPhoneNumbersKey]
            self.present(contactPicker, animated: true, completion: nil)

        }

        func contactPicker(_ picker: CNContactPickerViewController,
                           didSelect contactProperty: CNContactProperty) {

        }

        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            // You can fetch selected name and number in the following way

            // user name
            let userName:String = contact.givenName

            // user phone number
            let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
            let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value


            // user phone number string
            let primaryPhoneNumberStr:String = firstPhoneNumber.stringValue

            print(primaryPhoneNumberStr)
            if btn == 1 {
                text1.text = "\(primaryPhoneNumberStr)"
                text1.placeholder = "\(contact.givenName)"
            }
            
            if btn == 2 {
                text2.text = "\(primaryPhoneNumberStr)"
                 text2.placeholder = "\(contact.givenName)"
            }
            if btn == 3 {
                text3.text = "\(primaryPhoneNumberStr)"
                 text3.placeholder = "\(contact.givenName)"
            }
            
//            if btn == 4 {
//                text4.text = "\(primaryPhoneNumberStr)"
//                 text4.placeholder = "\(contact.givenName)"
//            }
//
//            if btn == 5 {
//                text5.text = "\(primaryPhoneNumberStr)"
//                 text5.placeholder = "\(contact.givenName)"
//            }




        }

        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {

        }
    
    
    @IBAction func contact1(_ sender: Any) {
        
       btn = 1
       onClickPickContact()
        
        
    }
    
    
    @IBOutlet var contact2: UIButton!
    
    @IBAction func contact2(_ sender: Any) {
        btn = 2
              onClickPickContact()
               
    }
    
    @IBOutlet var contact3: UIButton!
    
    @IBAction func contact3(_ sender: Any) {
        btn = 3
              onClickPickContact()
               
    }
    
    @IBOutlet var contact4: UIButton!
    
    @IBAction func contact4(_ sender: Any) {
        btn = 4
              onClickPickContact()
               
    }
    
    @IBOutlet var contact5: UIButton!
    
    @IBAction func contact5(_ sender: Any) {
        btn = 5
              onClickPickContact()
               
    }
    
  
   
    
    @IBOutlet var text1: UITextField!
      @IBOutlet var text2: UITextField!
      @IBOutlet var text3: UITextField!
//  @IBOutlet var text4: UITextField!
//      @IBOutlet var text5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       text1.delegate = self
       text2.delegate = self
       text3.delegate = self
//        text4.delegate = self
//        text5.delegate = self
//        UserDefaults.standard.set(idserv, forKey: "servicepro")
//              UserDefaults.standard.set(desc.text!, forKey: "descriptionpro")
//        UserDefaults.standard.set(insta.text!, forKey: "instapro")
//                              UserDefaults.standard.set(neighbourhood.text!, forKey: "webpro")
//                              UserDefaults.standard.set(serkind, forKey: "serkind")
        
//        UserDefaults.standard.set(lat1, forKey: "lat1")
//                   UserDefaults.standard.set(long1, forKey: "long1")
        
//        let mobile = UserDefaults.standard.object(forKey: "mobile") as! String

        
        

    }
    
    @IBOutlet var exit: UIButton!
    func invitefriend1() {
        let token = UserDefaults.standard.object(forKey: "token") as! String

        let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
        let paramer:Parameters = ["cellphone":text1.text!]
                       Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
                     
                      
                  
              print(response)
        }
    
    }
    func invitefriend2() {
        let token = UserDefaults.standard.object(forKey: "token") as! String

           let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
           let paramer:Parameters = ["cellphone":text2.text!]
                          Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
                        
                         
                     
                 print(response)
           }
       
       }
    func invitefriend3() {
        let token = UserDefaults.standard.object(forKey: "token") as! String

           let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
           let paramer:Parameters = ["cellphone":text3.text!]
                          Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
                        
                         
                     
                 print(response)
           }
       
       }
//    func invitefriend4() {
//        let token = UserDefaults.standard.object(forKey: "token") as! String
//
//           let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
//           let paramer:Parameters = ["cellphone":text4.text!]
//                          Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
//
//
//
//                 print(response)
//           }
//
//       }
//    func invitefriend5() {
//        let token = UserDefaults.standard.object(forKey: "token") as! String
//
//           let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
//           let paramer:Parameters = ["cellphone":text5.text!]
//                          Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
//
//
//
//                 print(response)
//           }
//
//       }
    func server () {
          let token = UserDefaults.standard.object(forKey: "token") as! String
         let servicepro = UserDefaults.standard.object(forKey: "servicepro") as! Int
        let descriptionpro = UserDefaults.standard.object(forKey: "descriptionpro") as! String
         let instapro = UserDefaults.standard.object(forKey: "instapro") as! String
        let webpro = UserDefaults.standard.object(forKey: "webpro") as! String
        let serkind = UserDefaults.standard.object(forKey: "serkind") as! String
        let sertime = UserDefaults.standard.object(forKey: "sertime") as! Int
let userid = UserDefaults.standard.object(forKey: "userid") as! Int
        


        
        let header:HTTPHeaders = ["accept":"application/json","Authorization":"bearer \(token)"]
        let paramer:Parameters = ["user":userid,"service":servicepro,"service_kind":serkind,"description":descriptionpro,"instagram":instapro,"web":webpro,"job_done_time":sertime]
                 Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/provider/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
               
                print(paramer)
                    print(header)
            
        print(response)
                    print("okpedrammmm")
                  print(response.response?.statusCode )
                  
                   if response.response?.statusCode == 201{
                 
                    if UserDefaults.standard.object(forKey: "lat1") != nil {
                        self.sendlocation1()
                    }
                    if UserDefaults.standard.object(forKey: "lat2") != nil {
                        self.sendlocation2()
                    }
                    if UserDefaults.standard.object(forKey: "lat3") != nil {
                        self.sendlocation3()
                    }
                


                    let alertController = UIAlertController(title: "Congratulatios...", message: "Your account has been successfully registered", preferredStyle:UIAlertController.Style.alert)
                               
                               
                               let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                                   
                                   self.exit.sendActions(for: .touchUpInside)
                                   
                                   
                                   print("you have pressed OK button");
                               }
                            alertController.addAction(OKAction)
                            
                            self.present(alertController, animated: true, completion:{ () -> Void in
                            })
                    }
                }
            
    }
    
      func sendlocation1 (){
        let lat1 = UserDefaults.standard.object(forKey: "lat1") as! Double
        let long1 = UserDefaults.standard.object(forKey: "long1") as! Double
        let token = UserDefaults.standard.object(forKey: "token") as! String
              let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
            let paramer:Parameters = ["latitude":lat1,"longitude":long1]
             Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/provider_location/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
           
            
        
    print(response)
              
              
               if response.response?.statusCode == 201{
             
                
                }
            }
        
            
        }
    func sendlocation2 (){
           let lat1 = UserDefaults.standard.object(forKey: "lat2") as! Double
           let long1 = UserDefaults.standard.object(forKey: "long2") as! Double
           let token = UserDefaults.standard.object(forKey: "token") as! String
                 let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
               let paramer:Parameters = ["latitude":lat1,"longitude":long1]
                Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/provider_location/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
              
               
           
       print(response)
                 
                 
                  if response.response?.statusCode == 201{
                
                   
                   }
               }
           
               
           }
    func sendlocation3 (){
           let lat1 = UserDefaults.standard.object(forKey: "lat3") as! Double
           let long1 = UserDefaults.standard.object(forKey: "long3") as! Double
           let token = UserDefaults.standard.object(forKey: "token") as! String
                 let header:HTTPHeaders = ["accept":"application/json","X-CSRFToken":token]
               let paramer:Parameters = ["latitude":lat1,"longitude":long1]
                Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/provider_location/", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
              
               
           
       print(response)
                 
                 
                  if response.response?.statusCode == 201{
                
                   
                   }
               }
           
               
           }
    func inv () {
        invitefriend1()
        invitefriend2()
        invitefriend3()
//        invitefriend4()
//        invitefriend5()
    }
    
    @IBAction func reg(_ sender: Any) {
        if text1.text?.isEmpty ?? true {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: text1.center.x - 10, y: text1.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: text1.center.x + 10, y: text1.center.y))
            
            text1.layer.add(animation, forKey: "position")
        }
        
        if text2.text?.isEmpty ?? true {
                   let animation = CABasicAnimation(keyPath: "position")
                   animation.duration = 0.07
                   animation.repeatCount = 4
                   animation.autoreverses = true
                   animation.fromValue = NSValue(cgPoint: CGPoint(x: text2.center.x - 10, y: text2.center.y))
                   animation.toValue = NSValue(cgPoint: CGPoint(x: text2.center.x + 10, y: text2.center.y))
                   
                   text2.layer.add(animation, forKey: "position")
               }
        if text3.text?.isEmpty ?? true {
                   let animation = CABasicAnimation(keyPath: "position")
                   animation.duration = 0.07
                   animation.repeatCount = 4
                   animation.autoreverses = true
                   animation.fromValue = NSValue(cgPoint: CGPoint(x: text3.center.x - 10, y: text3.center.y))
                   animation.toValue = NSValue(cgPoint: CGPoint(x: text3.center.x + 10, y: text3.center.y))
                   
                   text1.layer.add(animation, forKey: "position")
               }else{
            inv()
                  server()
               }
        
    }
    

   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
   }


}
