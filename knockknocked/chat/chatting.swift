//
//  chatting.swift
//  knockknocked
//
//  Created by pedram on 11/13/1398 AP.
//  Copyright © 1398 knock. All rights reserved.
//

import UIKit
import Starscream
import MessengerKit
import SwiftyJSON


class chatting:  MSGMessengerViewController, WebSocketDelegate {
    
    

    @IBOutlet var offertext: UILabel!
    

    
    var recmassage = ""
    
     let steve = User(displayName: "You", avatarUrl: nil, isSender: true)
        
        let tim = User(displayName: "Tim", avatarUrl: nil, isSender: false)
        
        var id = 100
    
    var heigh = 100
        
        override var style: MSGMessengerStyle {
            var style = MessengerKit.Styles.iMessage
            style.headerHeight = CGFloat(heigh)
    //        style.inputPlaceholder = "Message"
    //        style.alwaysDisplayTails = true
            
            style.incomingTextColor = .black
            style.outgoingBubbleColor = #colorLiteral(red: 0.5806497931, green: 0.6006942987, blue: 0.711135447, alpha: 1)
          
            
            
//            style.outgoingTextColor = #colorLiteral(red: 0, green: 0.7020093203, blue: 0.2533324957, alpha: 1)
                    style.incomingBubbleColor = #colorLiteral(red: 0.3869723082, green: 0.1855167449, blue: 0.9582156539, alpha: 1)
            
//            style.incomingTextColor = #colorLiteral(red: 1, green: 0.5958490968, blue: 0.7662761807, alpha: 1)
    //        style.backgroundColor = .orange
    //        style.inputViewBackgroundColor = .purple
            return style
        }
        lazy var messages: [[MSGMessage]] = {
              return [
                  
                  
              ]
          }()

       var  socket = WebSocket(url: URL(string: "ws://dev.hoonamapps.com/ws/chat//")!)
    
//    let socket = WebSocket(url: "ws://dev.hoonamapps.com/ws/chat/\(token)/")

 

    var orderreq = true
    
   
 
    @IBOutlet var offeracept: UIView!
    

    @IBAction func accept(_ sender: Any) {
        animateOut()
        
    }
    
    @IBAction func reject(_ sender: Any) {
        animateOut()
       
    }
    
    func animateOut() {
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
   
            //self.transView?.alpha = 0
        }) { (success:Bool) in
            self.offeracept?.removeFromSuperview()
        }
    }
        func animateIn() {
            
            self.view.addSubview(offeracept!)
            offeracept?.center = view.center
          
            offeracept?.frame = CGRect(x: 0, y: 0, width:  offeracept.frame.size.width, height: offeracept.frame.size.height)
            
            UIView.animate(withDuration: 0.4) {
                //self.transView?.alpha = 0.5
                self.offeracept?.transform = CGAffineTransform.identity
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
//orderreq = true
  
       
//        let token = UserDefaults.standard.object(forKey: "token") as! String
       
//      print(token)
        let token = UserDefaults.standard.object(forKey: "token") as! String
        socket = WebSocket(url: URL(string: "ws://dev.hoonamapps.com/ws/chat/\(token)/")!)
       
        socket.delegate = self
       socket.connect()
        tintColor = #colorLiteral(red: 0.3869723082, green: 0.1855167449, blue: 0.9582156539, alpha: 1)
        dataSource = self
               delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.scrollToBottom(animated: false)
    
        offertext.layer.cornerRadius = 10
        animateIn()
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
           id += 1
           
           let body: MSGMessageBody = (inputView.message.containsOnlyEmoji && inputView.message.count < 5) ? .emoji(inputView.message) : .text(inputView.message)
           
           let message = MSGMessage(id: id, body: body, user: steve, sentAt: Date())
           insert(message)
        
        
        
        
        print(inputView.message)
        
         let idpro = UserDefaults.standard.object(forKey: "idpro") as! Int
//        let strings = "{\"status\":\"message\",\"action\":\"send\",\"message\":\"\(inputView.message)\",\"destination\":\(idpro)}"
        
        let mass = "\(inputView.message)"
        let json = "status:message,action:send,message:\(mass),destination:\(idpro)"

        
        let jsone = json.data(using: String.Encoding.utf8).flatMap({try? JSON(data: $0)}) ?? JSON(NSNull())
//print(jsone)
      
        
//        socket.write(string: "\(jsone)")
        
       let message1 = "message"
        let send = "send"
        let masseg = "\(inputView.message)"
        let des = idpro
        

        let jsonObject: [String: Any] = [
            
                "status": message1,
                "action": send,
                "message": masseg,
                "destination": des,
               
            
        ]
        if let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
            let str = String(data: data, encoding: .utf8) {
            print("\(str)")
            socket.write(string: "\(str)")
        }
//        print("{\"status\":\"message\",\"action\":\"send\",\"message\":\"\(mass)\",\"destination\":112}")
       }
    
//    {"status":"message","action":"send","message":"Ghu","destination":41}
//    {"status":"message","action":"send","message":"Ghu","destination":112}
//    {"status":"message","action":"send","message":"Man,m","destination":112}
       override func insert(_ message: MSGMessage) {
           
           collectionView.performBatchUpdates({
               if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                   self.messages[self.messages.count - 1].append(message)
                   
                   let sectionIndex = self.messages.count - 1
                   let itemIndex = self.messages[sectionIndex].count - 1
                   self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                   
               } else {
                   self.messages.append([message])
                   let sectionIndex = self.messages.count - 1
                   self.collectionView.insertSections([sectionIndex])
               }
           }, completion: { (_) in
               self.collectionView.scrollToBottom(animated: true)
               self.collectionView.layoutTypingLabelIfNeeded()
           })
        
       }
       
       override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
           
           collectionView.performBatchUpdates({
               for message in messages {
                   if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                       self.messages[self.messages.count - 1].append(message)
                       
                       let sectionIndex = self.messages.count - 1
                       let itemIndex = self.messages[sectionIndex].count - 1
                       self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                       
                   } else {
                       self.messages.append([message])
                       let sectionIndex = self.messages.count - 1
                       self.collectionView.insertSections([sectionIndex])
                   }
               }
           }, completion: { (_) in
               self.collectionView.scrollToBottom(animated: false)
               self.collectionView.layoutTypingLabelIfNeeded()
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                   callback?()
               }
           })
        
       }

  
    func websocketDidConnect(socket: WebSocketClient) {
        print("connect")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
         print("got some text: ")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
                print(text)
//        print("message: \(text)")
        if let data1 = text.data(using: .utf8) {
                  if let json1 = try? JSON(data: data1) {
                     print(json1["action"].stringValue)
                      let rec1 = json1["action"].stringValue
                    if rec1 == "receive" {
                        if let data = text.data(using: .utf8) {
                                   if let json = try? JSON(data: data) {
                                      print(json["message"].stringValue)
                                       let rec = json["message"].stringValue
                                       self.recmassage = rec
                                       id += 1
                                       insert(MSGMessage.init(id: id, body: .text(rec), user: tim, sentAt: Date()))
                                      
                                   }
                               }
                    }
                     
                  }
              }
        
        
        
       
        
        
       
    
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
         print("Got pong!")
    }
   
   
    
   

}
extension chatting: MSGDataSource {
    
    func numberOfSections() -> Int {
        return messages.count
    }
    
    func numberOfMessages(in section: Int) -> Int {
        return messages[section].count
    }
    
    func message(for indexPath: IndexPath) -> MSGMessage {
        return messages[indexPath.section][indexPath.item]
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].first?.user.displayName
    }

}

// MARK: - MSGDelegate

extension chatting: MSGDelegate {
    
    func linkTapped(url: URL) {
        print("Link tapped:", url)
    }
    
    func avatarTapped(for user: MSGUser) {
        print("Avatar tapped:", user)
    }
    
    func tapReceived(for message: MSGMessage) {
        print("Tapped: ", message)
    }
    
    func longPressReceieved(for message: MSGMessage) {
        print("Long press:", message)
    }
    
    func shouldDisplaySafari(for url: URL) -> Bool {
        return true
    }
    
    func shouldOpen(url: URL) -> Bool {
        return true
    }
    
}
