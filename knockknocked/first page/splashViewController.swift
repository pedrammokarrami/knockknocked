//
//  splashViewController.swift
//  knockknocked
//
//  Created by pedram on 11/27/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON
import Alamofire



class splashViewController: UIViewController {
    
    
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBOutlet var login: UIButton!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       UserDefaults.standard.set(35.7227, forKey: "camlat")
               UserDefaults.standard.set(51.3109, forKey: "camlong")
 
     
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
             self.login.sendActions(for: .touchUpInside)
            
        }
        // Do any additional setup after loading the view.
    }
    

    

}
