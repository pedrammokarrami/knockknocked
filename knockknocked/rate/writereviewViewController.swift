//
//  writereviewViewController.swift
//  knockknocked
//
//  Created by pedram on 11/26/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Lottie

class writereviewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var review: UITextField!
    
    @IBOutlet var like: UIButton!
    
    @IBAction func like(_ sender: Any) {
     
    }
    
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
    
    @IBOutlet var gifff: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        review.delegate = self
let animationView = AnimationView(name: "like")
       
               animationView.frame = CGRect(x: 0, y: 0, width: gifff.frame.size.width, height: gifff.frame.size.height)
//               animationView.center = self.gifff.center
        animationView.contentMode = .scaleAspectFit
               
               gifff.addSubview(animationView)
           
               animationView.play()
           
    }
    

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
  }

}
