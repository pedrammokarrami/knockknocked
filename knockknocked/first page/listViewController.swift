//
//  listViewController.swift
//  knock knocked
//
//  Created by pedram on 7/19/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import PickerView
import Alamofire
import SwiftyJSON

class listViewController: UIViewController, TransitionInfoProtocol {

    @IBAction func close(_ sender: Any) {
        UserDefaults.standard.set("All services", forKey: "category")
    self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet var counting: UILabel!
    
    
    @IBOutlet weak var examplePicker: PickerView!
    
    @IBOutlet var transfer: UIButton!
    
    @IBOutlet var lable: UILabel!
    

    func startloading() {
                   let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

                   let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                   loadingIndicator.hidesWhenStopped = true
                   loadingIndicator.style = UIActivityIndicatorView.Style.gray
                   loadingIndicator.startAnimating();

                   alert.view.addSubview(loadingIndicator)
                   present(alert, animated: true, completion: nil)
               }
    func endloading() {
                   dismiss(animated: false, completion: nil)
                   
               }

    
    var osxNames = [String]()
    var serid = [Int]()
    
   func server() {

          let header:HTTPHeaders = ["accept":"application/json"]
          Alamofire.request("http://dev.hoonamapps.com/telemarket/api/v0/service/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
        
            if response.response?.statusCode == 200{
                
           
             
             print(response)
              
              
               let jsonData2 = JSON(response.result.value!)["list" ].arrayValue
                
                print(jsonData2)
              for serviceid in jsonData2 {
                let data = serviceid["id"].intValue
                self.serid.append(data)
          
              }
                
                
                           for servicenam in jsonData2 {
                             let data = servicenam["title"].stringValue
                             self.osxNames.append(data)
                            print(self.osxNames)
                           }
                self.examplePicker.reloadPickerView()
                self.counting.text = "\(self.osxNames.count)"
             
           
              }
          }
          
      }
    
       var lastSelectedIndexPath: IndexPath?
    
    
    func viewsToAnimate() -> [UIView] {
           return [lable]
       }
       
       func copyForView(_ subView: UIView) -> UIView {
        subView == lable
               let labelCopy = UILabel()
        labelCopy.text = lable.text
        labelCopy.font = lable.font
               labelCopy.backgroundColor = view.backgroundColor
         
           return UIView()
       }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            examplePicker.dataSource = self
                  examplePicker.delegate = self
                   
                   server()
                   lable.isHidden = true
         examplePicker.isHidden = false
        counting.layer.cornerRadius = 9
               counting.layer.masksToBounds = true
        }
  
    override func viewDidLoad() {
        super.viewDidLoad()

       examplePicker.dataSource = self
       examplePicker.delegate = self
        
      
        lable.isHidden = true
       
        
    }
   

}


extension listViewController: PickerViewDataSource {
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return osxNames.count
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int) -> String {
        let item = osxNames[row]
        
        return item
    }
    
}

extension listViewController: PickerViewDelegate {
    
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 50.0 // In this example I'm returning arbitrary 50.0pt but you should return the row height you want.
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int) {
       
      
    }
    
    func pickerView(_ pickerView: PickerView, didTapRow row: Int) {
       
        let idd =  serid[row]
        let selectedItem = osxNames[row]
               lable.isHidden = false
               examplePicker.isHidden = true
               lable.text =  ("\(selectedItem)")
               lable.frame = pickerView.frame
        UserDefaults.standard.set(lable.text, forKey: "category")
         UserDefaults.standard.set(idd, forKey: "categoryid")
        
        let cattname1 : firstpageViewController = firstpageViewController()

    
       
       
        cattname1.nameecategory = "\(selectedItem)"
                 cattname1.catname2()
        
        
        
        UIView.animate(withDuration: 1, animations: { self.lable.frame = CGRect(x: 50, y: 900, width: 84, height: 47) }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//           self.transfer.sendActions(for: .touchUpInside)
            self.dismiss(animated: true, completion: nil)
        }
               
          
    }
    
   

    
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
        
        if highlighted {
            label.font = UIFont.systemFont(ofSize: 25.0)
            label.textColor = .black
        } else {
            label.font = UIFont.systemFont(ofSize: 15.0)
            label.textColor = .green
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        var customView = view
         let labelTag = 101
        
       
                  var frame = pickerView.frame
                  frame.origin = CGPoint.zero
                  frame.size.height = 50
                  customView = UIView(frame: frame)
                  
                
                  
                  
                  let label = UILabel(frame: frame)
                  label.tag = labelTag
                  label.textColor = UIColor.black
                 
                 
        label.textAlignment = .left
                  
               
                  
                  customView?.addSubview(label)
              
        
        label.text = osxNames[row]
        let alpha: CGFloat = highlighted ? 1.0 : 0.5
               
          
        label.alpha = alpha
        
        return customView
    }
    
   
         
      
     
           
         }
      
    

