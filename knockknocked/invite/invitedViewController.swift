//
//  invitedViewController.swift
//  knockknocked
//
//  Created by pedram on 11/8/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import ContactsUI
import Alamofire

class invitedViewController: UIViewController, CNContactPickerDelegate {
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func contac(_ sender: Any) {
         onClickPickContact()
    }
    
    @IBOutlet var text1: UITextField!
    
    
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
       
        text1.text = "\(primaryPhoneNumberStr)"
        text1.placeholder = "\(contact.givenName)"


    }

    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {

    }
    
     func server() {

        let header:HTTPHeaders = ["accept":"application/json"]
          let paramer:Parameters = ["cellphone":text1.text!]
        Alamofire.request("https://api.knockknocked.com/telemarket/api/v0/user_friend", method: .post, parameters: paramer, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
      
        
        
          print(response.response?.statusCode)

         
      
          }
      }
    @IBAction func invited(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }

}
