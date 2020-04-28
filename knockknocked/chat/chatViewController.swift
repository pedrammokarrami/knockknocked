//
//  chatViewController.swift
//  knockknocked
//
//  Created by pedram on 11/9/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import Foundation


class chatViewController: UIViewController {
    
     var url: String = ""
     var sessionName: String = ""
     var participantName: String = ""
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         print("Did Appear")
     }
   
    func start() {
        let token = UserDefaults.standard.object(forKey: "token") as! String

//        let socket = WebSocketListener(url: "ws://dev.hoonamapps.com/ws/chat/\(token)/")
        
}
}
