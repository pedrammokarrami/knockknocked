//
//  bussinestimeslotViewController.swift
//  knockknocked
//
//  Created by pedram on 12/2/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class bussinestimeslotViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var time: UITextField!
    
    var timming = 0
    
    @IBAction func reg(_ sender: Any) {
        if time.text?.isEmpty ?? true {
                                      let animation = CABasicAnimation(keyPath: "position")
                                      animation.duration = 0.07
                                      animation.repeatCount = 4
                                      animation.autoreverses = true
                                      animation.fromValue = NSValue(cgPoint: CGPoint(x: time.center.x - 10, y: time.center.y))
                                      animation.toValue = NSValue(cgPoint: CGPoint(x: time.center.x + 10, y: time.center.y))
                                      
                                      time.layer.add(animation, forKey: "position")
        }else{
            UserDefaults.standard.set(timming, forKey: "sertime")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

  let contactViewController = storyBoard.instantiateViewController(withIdentifier: "contactViewController") as! contactViewController
    self.present(contactViewController, animated:true, completion:nil)
        }
    }
    
    func server () {
        
    }
    
    var hoars = ["0.5","1.0","2.0"]
var thePicker1: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thePicker1 = UIPickerView()
        time.inputView = thePicker1
        thePicker1.dataSource = self
               thePicker1.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
           
         
           return hoars.count
           
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        

            
            let dict1 = hoars[row]
            
             return dict1
       
       
       
       
        
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
      
       
       
       time.text = "\(hoars[row]) per client"
        timming = Int(hoars[row]) ?? 0
                      
                       
    
           }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             
                 self.view.endEditing(true)
             }
    

}
