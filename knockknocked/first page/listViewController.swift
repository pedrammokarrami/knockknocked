//
//  listViewController.swift
//  knock knocked
//
//  Created by pedram on 7/19/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import PickerView

class listViewController: UIViewController, TransitionInfoProtocol {

    @IBOutlet weak var examplePicker: PickerView!
    
    
    @IBOutlet var transfer: UIButton!
    
    @IBOutlet var lable: UILabel!
    


    
    let osxNames = ["کارواش","آموزشی"]
    
   
    
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
        print("The row \(row) was tapped by the user")
        
        let selectedItem = osxNames[row]
               lable.isHidden = false
               examplePicker.isHidden = true
               lable.text =  ("\(selectedItem)")
               lable.frame = pickerView.frame
        UserDefaults.standard.set(lable.text, forKey: "category")
        
        UIView.animate(withDuration: 1, animations: { self.lable.frame = CGRect(x: 50, y: 900, width: 84, height: 47) }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.transfer.sendActions(for: .touchUpInside)
            
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
                 
                 
        label.textAlignment = .center
                  
               
                  
                  customView?.addSubview(label)
              
        
        label.text = osxNames[row]
        let alpha: CGFloat = highlighted ? 1.0 : 0.5
               
          
        label.alpha = alpha
        
        return customView
    }
    
   
         
      
     
           
         }
      
    

